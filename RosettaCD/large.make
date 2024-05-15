 
 
integrate :  /home/rosetta/archive/rosetta3/tools/mopttoopt.exe \
             /home/rosetta/archive/rosetta3/tools/genmake.exe \
             /home/rosetta/archive/rosetta3/tools/genscommentdata.exe \
             /home/rosetta/archive/rosetta3/tools/genmcommenttext.exe \
             /home/rosetta/archive/rosetta3/tools/genscommenttext.exe \
             /home/rosetta/archive/rosetta3/tools/genmcommentdata.exe \
             /home/rosetta/archive/rosetta3/tools/lexedcontrol.exe \
             tools/target/lockinit.exe \
             /home/rosetta/archive/rosetta3/general/control.exe \
             /home/rosetta/archive/rosetta3/Xw/Xw.exe \
             /home/rosetta/archive/rosetta3/Xw/Xlex.exe \
             /home/rosetta/archive/rosetta3/Xw/lexed.uid \
             /home/rosetta/archive/rosetta3/Xw/windows.uid ; 
	$(MAKE) -f dutch/target/descrip.make dutch/target/integrate language=dutch
	$(MAKE) -f english/target/descrip.make english/target/integrate language=english
	$(MAKE) -f spanish/target/descrip.make spanish/target/integrate language=spanish
 
 
 
# Rosetta integration targets 
# --------------------------- 
 
dutch/target/integrate :   /home/rosetta/archive/rosetta3/dutch/mrucom.exe \
                    /home/rosetta/archive/rosetta3/dutch/amglue.sro \
                    /home/rosetta/archive/rosetta3/dutch/aprefix.sro \
                    /home/rosetta/archive/rosetta3/dutch/asuffix.sro \
                    /home/rosetta/archive/rosetta3/dutch/alglue.sro \
                    /home/rosetta/archive/rosetta3/dutch/arglue.sro \
                    /home/rosetta/archive/rosetta3/dutch/analysis.exe \
                    /home/rosetta/archive/rosetta3/dutch/generation.exe \
                    /home/rosetta/archive/rosetta3/dutch/lexed.exe;
 
english/target/integrate : /home/rosetta/archive/rosetta3/english/mrucom.exe \
                     /home/rosetta/archive/rosetta3/english/amglue.sro \
                     /home/rosetta/archive/rosetta3/english/arglue.sro \
                     /home/rosetta/archive/rosetta3/english/asuffix.sro \
                     /home/rosetta/archive/rosetta3/english/alglue.sro \
                     /home/rosetta/archive/rosetta3/english/aprefix.sro \
                     /home/rosetta/archive/rosetta3/english/analysis.exe \
                     /home/rosetta/archive/rosetta3/english/generation.exe \
                     /home/rosetta/archive/rosetta3/english/lexed.exe;
 
spanish/target/integrate : /home/rosetta/archive/rosetta3/spanish/mrucom.exe \
                    /home/rosetta/archive/rosetta3/spanish/amglue.sro \
                    /home/rosetta/archive/rosetta3/spanish/arglue.sro \
                    /home/rosetta/archive/rosetta3/spanish/asuffix.sro \
                    /home/rosetta/archive/rosetta3/spanish/alglue.sro \
                    /home/rosetta/archive/rosetta3/spanish/aprefix.sro \
                    /home/rosetta/archive/rosetta3/spanish/generation.exe \
                    /home/rosetta/archive/rosetta3/spanish/lexed.exe;
 
 
 
# Rosetta dictionaries 
# -------------------- 
 
#                    interlingua/bmkeydef.dat \ 
#                    dutch/ildict.dat \ 
#                    dutch/siddict.dat \ 
#                    dutch/iddict.dat \ 
#                    dutch/bskeydef.dat \ 
#                    dutch/sdict.dat \ 
#                    dutch/fixid.dat \ 
#                    dutch/mdict.dat \ 
#                    dutch/blex.dat  \ 
#                    dutch/scomment.dat \ 
#                    dutch/mcomment.dat \ 
 
 
/home/rosetta/archive/rosetta3/general/level.o : /home/rosetta/archive/rosetta3/general/level.p \
                  /home/rosetta/archive/rosetta3/general/level.pf \
                  /home/rosetta/archive/rosetta3/general/wnd.pf \
                  /home/rosetta/archive/rosetta3/Xw/Xid.h \
                  /home/rosetta/archive/rosetta3/Xw/Sid.h \
                  /home/rosetta/archive/rosetta3/general/interfaces.pf ;
	@/home/rosetta/archive/rosetta3/actions/pas general level
 
/home/rosetta/archive/rosetta3/general/loop.o  : /home/rosetta/archive/rosetta3/general/loop.p \
                  /home/rosetta/archive/rosetta3/general/loop.pf \
                  /home/rosetta/archive/rosetta3/general/oldtree.pf \
                  /home/rosetta/archive/rosetta3/general/wnd.pf \
                  /home/rosetta/archive/rosetta3/general/rectoscreen.pf \
                  /home/rosetta/archive/rosetta3/general/drawtreeset.pf \
                  /home/rosetta/archive/rosetta3/general/debugmparser.pf \
                  /home/rosetta/archive/rosetta3/general/debugmgenerator.pf \
                  /home/rosetta/archive/rosetta3/general/drawtree.pf \
                  /home/rosetta/archive/rosetta3/Xw/Xid.h \
                  /home/rosetta/archive/rosetta3/Xw/Sid.h ;
	@/home/rosetta/archive/rosetta3/actions/pas general loop
 
/home/rosetta/archive/rosetta3/general/lastactive.o : /home/rosetta/archive/rosetta3/general/lastactive.p \
                       /home/rosetta/archive/rosetta3/general/lastactive.pf \
                       /home/rosetta/archive/rosetta3/general/level.pf \
                       /home/rosetta/archive/rosetta3/general/wnd.pf \
                       /home/rosetta/archive/rosetta3/Xw/Xid.h \
                       /home/rosetta/archive/rosetta3/Xw/Sid.h \
                       /home/rosetta/archive/rosetta3/general/globdef.pf \
                       /home/rosetta/archive/rosetta3/general/interfaces.pf ;
	@/home/rosetta/archive/rosetta3/actions/pas general lastactive                        
 
/home/rosetta/archive/rosetta3/general/drawtreeset.o : /home/rosetta/archive/rosetta3/general/drawtreeset.p \
                        /home/rosetta/archive/rosetta3/general/drawtreeset.pf \
                        /home/rosetta/archive/rosetta3/general/listree.pf \
                        /home/rosetta/archive/rosetta3/general/oldtree.pf \
                        /home/rosetta/archive/rosetta3/general/loop.pf \
                        /home/rosetta/archive/rosetta3/general/wnd.pf \
                        /home/rosetta/archive/rosetta3/Xw/Xid.h \
                        /home/rosetta/archive/rosetta3/Xw/Sid.h \
                        /home/rosetta/archive/rosetta3/general/drawtree.pf \
                        /home/rosetta/archive/rosetta3/general/drawstree.pf \
                        /home/rosetta/archive/rosetta3/general/globdef.pf \
                        /home/rosetta/archive/rosetta3/general/lidomaint.pf \
                        /home/rosetta/archive/rosetta3/general/error.pf ;
	@/home/rosetta/archive/rosetta3/actions/pas general drawtreeset                        
 
/home/rosetta/archive/rosetta3/unix/cisam.o : /home/rosetta/archive/rosetta3/unix/cisam.c \
		/home/rosetta/archive/rosetta3/unix/gendef.h \
		/home/rosetta/archive/rosetta3/unix/cisam.h \
		/home/rosetta/archive/rosetta3/unix/paspar.h ;
	@/home/rosetta/archive/rosetta3/actions/c unix cisam
 
/home/rosetta/archive/rosetta3/tools/genmake.o : /home/rosetta/archive/rosetta3/tools/genmake.p \
                  /home/rosetta/archive/rosetta3/general/string.pf \
                  /home/rosetta/archive/rosetta3/unix/cisam.pf \
                  /home/rosetta/archive/rosetta3/general/logname.pf ;
	@/home/rosetta/archive/rosetta3/actions/pas tools genmake
 
 
/home/rosetta/archive/rosetta3/tools/mopttoopt.o : /home/rosetta/archive/rosetta3/tools/mopttoopt.p \
                  /home/rosetta/archive/rosetta3/general/string.pf \
                  /home/rosetta/archive/rosetta3/unix/cisam.pf \
                  /home/rosetta/archive/rosetta3/general/logname.pf ;
	@/home/rosetta/archive/rosetta3/actions/pas tools mopttoopt
 
 
 
#!! list the integration targets of this component  
  
  
  
integrate_2 : integrate_tools_2 \
              integrate_general_2 \
              integrate_interlingua_2 \
              integrate_lexicon_2 \
              integrate_doc_2 \
              integrate_vms_2 \
              integrate_dutch_2 \
              integrate_english_2 \
              integrate_spanish_2 \
              tools/target/findmkey.exe \
              tools/target/mkeycheck.exe;
	@ ! no action needed
  
  
  
#!! list the integration targets of this component  
  
integrate_dutch : 
	@echo "no action needed yet"
 
# dutch/morftest.exe  
#                    dutch/lexview.exe   
#                    dutch/lexed.exe   
#                    dutch/isfmerge.exe 
#                    interlingua/bmkeydef.dat \ 
#                    dutch/ildict.dat \ 
#                    dutch/siddict.dat \ 
#                    dutch/iddict.dat \ 
#                    dutch/bskeydef.dat \ 
#                    dutch/sdict.dat \ 
#                    dutch/fixid.dat \ 
#                    dutch/mdict.dat \ 
#                    dutch/blex.dat  \ 
                      
 
config : /home/rosetta/archive/rosetta3/dutch/config.sys;
	@actions/sys dutch config
  
  
dutch/target/domain.new : dutch/target/lsmruquo.opt  \
                        dutch/target/lsauxdom.opt  \
                        /home/rosetta/archive/rosetta3/dutch/mrucom.exe;
	@ ! no action needed yet
  
  
#!                    dutch:testconstraints.exe  
#!! include the description files of the parts of this component  
  
  
  
#!! the dependencies of this component  
  
#!! list the integration targets of this component  
  
integrate_english : 
	@ ! no action needed yet
  
  
integrate_english_2 : english/target/toggle.opt  \
                      english/target/morftest.exe \
                      /home/rosetta/archive/rosetta3/english/asuffix.sro \
                      /home/rosetta/archive/rosetta3/english/arglue.sro \
                      /home/rosetta/archive/rosetta3/english/amglue.sro \
                      /home/rosetta/archive/rosetta3/english/sdict.dat \
                      /home/rosetta/archive/rosetta3/english/fixid.dat \
                      /home/rosetta/archive/rosetta3/english/mdict.dat \
                      /home/rosetta/archive/rosetta3/english/blex.dat \
                      /home/rosetta/archive/rosetta3/english/analysis.exe \
                      /home/rosetta/archive/rosetta3/english/generation.exe \
                      english/target/lexview.exe  \
                      /home/rosetta/archive/rosetta3/english/lexed.exe  \
                      english/target/isfmerge.exe  \
                      configeng;
	@ ! no action needed yet
  
#!! include the description files of the parts of this component  
  
  
configeng : /home/rosetta/archive/rosetta3/english/config.sys;
	@actions/sys english config
#!! the dependencies of this component  
  
#!! list the integration targets of this component  
  
integrate_general : 
	@ ! echo "no action needed"
  
#!!  
#!!aidderiv.opt and gidderiv.opt are mentioned because including them in the  
#!!dependencies would result in a loop  
#!!  
  
integrate_general_2 : general/target/aidderiv.opt  \
                      general/target/gidderiv.opt  \
                      general/target/limatches.opt  \
                      general/target/strtokey.opt  \
                      dutch/target/ldblex.opt  \
                      english/target/ldblex.opt  \
                      spanish/target/ldblex.opt  \
                      general/target/limatches.opt  \
                      /home/rosetta/archive/rosetta3/dutch/genblexisf.exe  \
                      dutch/target/genblexdict.exe  \
                      general/target/dutchdutch.opt  \
                      /home/rosetta/archive/rosetta3/english/genblexisf.exe  \
                      /home/rosetta/archive/rosetta3/english/genblexdict.exe  \
                      general/target/dutchenglish.opt  \
                      /home/rosetta/archive/rosetta3/spanish/genblexisf.exe  \
                      spanish/target/genblexdict.exe  \
                      general/target/dutchspanish.opt  \
                      general/target/englishspanish.opt  \
                      general/target/englishenglish.opt  \
                      general/target/abort.opt  \
                      morftest  \
                      general/target/morftestquestion.exe  \
                      dutch/target/convert.opt \
                      english/target/convert.opt \
                      spanish/target/convert.opt;
	@ ! no action needed
  
  
morftest : general/target/morftest.dcl;
	@actions/dcl general morftest
  
  
  
  
  
  
  
  
  
#!! include the description files of the parts of this component  
  
  
  
/home/rosetta/archive/rosetta3/dutch/lexed.o : tools/source/lexed.p \
                                  /home/rosetta/archive/rosetta3/tools/lexedaux.pf \
                                  /home/rosetta/archive/rosetta3/Xw/Xid.h \
                                  /home/rosetta/archive/rosetta3/dutch/lslexed.pf \
                                  /home/rosetta/archive/rosetta3/unix/mb.pf \
                                  /home/rosetta/archive/rosetta3/general/globdef.pf \
                                  /home/rosetta/archive/rosetta3/general/limorfdef.pf \
                                  /home/rosetta/archive/rosetta3/unix/cisam.pf \
                                  /home/rosetta/archive/rosetta3/unix/renamefixid.pf \
                                  /home/rosetta/archive/rosetta3/dutch/lsphondef.pf \
                                  /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf \
                                  /home/rosetta/archive/rosetta3/general/lidomaint.pf \
                                  /home/rosetta/archive/rosetta3/dutch/lstypetostr.pf \
                                  /home/rosetta/archive/rosetta3/dutch/lsstrtotype.pf \
                                  /home/rosetta/archive/rosetta3/dutch/maket.pf \
                                  /home/rosetta/archive/rosetta3/general/interface1.pf \
                                  /home/rosetta/archive/rosetta3/general/mem.pf \
                                  /home/rosetta/archive/rosetta3/general/log.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/general/str.pf \
                                  /home/rosetta/archive/rosetta3/general/files.pf \
                                  /home/rosetta/archive/rosetta3/general/error.pf \
                                  /home/rosetta/archive/rosetta3/general/windows.pf \
                                  /home/rosetta/archive/rosetta3/general/ldtypetostr.pf \
                                  /home/rosetta/archive/rosetta3/general/ldstrtotype.pf \
                                  /home/rosetta/archive/rosetta3/general/rectoscreen.pf \
                                  /home/rosetta/archive/rosetta3/general/ldconvrec.pf \
                                  /home/rosetta/archive/rosetta3/general/listree.pf \
                                  /home/rosetta/archive/rosetta3/general/lsstree.pf \
                                  /home/rosetta/archive/rosetta3/general/strtokey.pf \
                                  /home/rosetta/archive/rosetta3/general/strtomkey.pf \
                                  /home/rosetta/archive/rosetta3/general/ldgetkey.pf \
                                  /home/rosetta/archive/rosetta3/general/ldmdict.pf \
                                  /home/rosetta/archive/rosetta3/general/lifixiddict.pf \
                                  /home/rosetta/archive/rosetta3/general/ldblex.pf \
                                  /home/rosetta/archive/rosetta3/general/lisdict.pf \
                                  /home/rosetta/archive/rosetta3/general/lisiddict.pf \
                                  /home/rosetta/archive/rosetta3/general/liiddict.pf \
                                  /home/rosetta/archive/rosetta3/general/liildict.pf \
                                  /home/rosetta/archive/rosetta3/general/liscomment.pf \
                                  /home/rosetta/archive/rosetta3/general/limcomment.pf \
                                  /home/rosetta/archive/rosetta3/general/lilock.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools lexed $(language)
  
  
  
dutch/target/lexview.o : /home/rosetta/archive/rosetta3/tools/lexview.p \
                                  /home/rosetta/archive/rosetta3/tools/lexedaux.pf \
                                  /home/rosetta/archive/rosetta3/Xw/Xid.h \
                                  /home/rosetta/archive/rosetta3/dutch/lslexed.pf \
                                  /home/rosetta/archive/rosetta3/unix/mb.pf \
                                  /home/rosetta/archive/rosetta3/general/globdef.pf \
                                  /home/rosetta/archive/rosetta3/general/limorfdef.pf \
                                  /home/rosetta/archive/rosetta3/unix/cisam.pf \
                                  /home/rosetta/archive/rosetta3/dutch/lsphondef.pf \
                                  /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf \
                                  /home/rosetta/archive/rosetta3/general/lsconstraints.pf \
                                  /home/rosetta/archive/rosetta3/general/lidomaint.pf \
                                  /home/rosetta/archive/rosetta3/dutch/lstypetostr.pf \
                                  /home/rosetta/archive/rosetta3/dutch/lsstrtotype.pf \
                                  /home/rosetta/archive/rosetta3/dutch/maket.pf \
                                  /home/rosetta/archive/rosetta3/general/interface1.pf \
                                  /home/rosetta/archive/rosetta3/general/mem.pf \
                                  /home/rosetta/archive/rosetta3/general/log.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/general/str.pf \
                                  /home/rosetta/archive/rosetta3/general/files.pf \
                                  /home/rosetta/archive/rosetta3/general/error.pf \
                                  /home/rosetta/archive/rosetta3/general/windows.pf \
                                  /home/rosetta/archive/rosetta3/general/ldtypetostr.pf \
                                  /home/rosetta/archive/rosetta3/general/ldstrtotype.pf \
                                  /home/rosetta/archive/rosetta3/general/rectoscreen.pf \
                                  /home/rosetta/archive/rosetta3/general/ldconvrec.pf \
                                  /home/rosetta/archive/rosetta3/general/listree.pf \
                                  /home/rosetta/archive/rosetta3/general/lsstree.pf \
                                  /home/rosetta/archive/rosetta3/general/strtokey.pf \
                                  /home/rosetta/archive/rosetta3/general/strtomkey.pf \
                                  /home/rosetta/archive/rosetta3/general/ldgetkey.pf \
                                  /home/rosetta/archive/rosetta3/general/ldmdict.pf \
                                  /home/rosetta/archive/rosetta3/general/lifixiddict.pf \
                                  /home/rosetta/archive/rosetta3/general/ldblex.pf \
                                  /home/rosetta/archive/rosetta3/general/lisdict.pf \
                                  /home/rosetta/archive/rosetta3/general/lisiddict.pf \
                                  /home/rosetta/archive/rosetta3/general/liiddict.pf \
                                  /home/rosetta/archive/rosetta3/general/liildict.pf \
                                  /home/rosetta/archive/rosetta3/general/liscomment.pf \
                                  /home/rosetta/archive/rosetta3/general/limcomment.pf \
                                  /home/rosetta/archive/rosetta3/general/lilock.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools lexview $(language)
  
#!!  
  
/home/rosetta/archive/rosetta3/tools/lexedaux.o : /home/rosetta/archive/rosetta3/tools/lexedaux.p \
                                  /home/rosetta/archive/rosetta3/tools/lexedaux.pf \
                                  /home/rosetta/archive/rosetta3/general/globdef.pf \
                                  /home/rosetta/archive/rosetta3/general/mem.pf \
                                  /home/rosetta/archive/rosetta3/general/log.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/Xw/Xid.h  \
                                  /home/rosetta/archive/rosetta3/Xw/Sid.h  \
                                  /home/rosetta/archive/rosetta3/general/str.pf \
                                  /home/rosetta/archive/rosetta3/general/wnd.pf \
                                  /home/rosetta/archive/rosetta3/general/windows.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools lexedaux 
  
  
#!!  
  
/home/rosetta/archive/rosetta3/general/liscomment.o : /home/rosetta/archive/rosetta3/general/liscomment.p \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/unix/cisam.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general liscomment 
  
  
#!!  
  
/home/rosetta/archive/rosetta3/general/limcomment.o : /home/rosetta/archive/rosetta3/general/limcomment.p \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/unix/cisam.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general limcomment 
  
  
#!!  
  
/home/rosetta/archive/rosetta3/dutch/lslexed.o : /home/rosetta/archive/rosetta3/dutch/lslexed.p \
                                  /home/rosetta/archive/rosetta3/dutch/lslexed.pf \
                                  /home/rosetta/archive/rosetta3/dutch/lsphondef.pf \
                                  /home/rosetta/archive/rosetta3/tools/lexedaux.pf \
                                  /home/rosetta/archive/rosetta3/Xw/Xid.h \
                                  /home/rosetta/archive/rosetta3/unix/mb.pf \
                                  /home/rosetta/archive/rosetta3/general/wnd.pf \
                                  /home/rosetta/archive/rosetta3/general/windows.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) lslexed 
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/lexedcontrol.o : /home/rosetta/archive/rosetta3/tools/lexedcontrol.p \
                                  /home/rosetta/archive/rosetta3/tools/lexedaux.pf \
                                  /home/rosetta/archive/rosetta3/Xw/Xid.h \
                                  /home/rosetta/archive/rosetta3/unix/mb.pf \
                                  /home/rosetta/archive/rosetta3/general/globdef.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/unix/pc.pf \
                                  /home/rosetta/archive/rosetta3/unix/globbuf.pf \
                                  /home/rosetta/archive/rosetta3/general/windows.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools lexedcontrol 
  
#!!  
  
  
tools/target/initdutch.o : /home/rosetta/archive/rosetta3/tools/initdutch.p \
                                  /home/rosetta/archive/rosetta3/unix/mb.pf \
                                  /home/rosetta/archive/rosetta3/general/globdef.pf \
                                  /home/rosetta/archive/rosetta3/unix/pc.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools initdutch 
  
#!!  
  
  
tools/target/initenglish.o : /home/rosetta/archive/rosetta3/tools/initenglish.p \
                                  /home/rosetta/archive/rosetta3/unix/mb.pf \
                                  /home/rosetta/archive/rosetta3/general/globdef.pf \
                                  /home/rosetta/archive/rosetta3/unix/pc.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools initenglish 
  
#!!  
  
  
tools/target/initspanish.o : /home/rosetta/archive/rosetta3/tools/initspanish.p \
                                  /home/rosetta/archive/rosetta3/unix/mb.pf \
                                  /home/rosetta/archive/rosetta3/general/globdef.pf \
                                  /home/rosetta/archive/rosetta3/unix/pc.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools initspanish 
  
#!!  
  
/home/rosetta/archive/rosetta3/general/lilock.o : /home/rosetta/archive/rosetta3/general/lilock.p \
                                  /home/rosetta/archive/rosetta3/unix/cisam.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general lilock 
  
  
#!!  
  
  
tools/target/lockinit.o : /home/rosetta/archive/rosetta3/tools/lockinit.p \
                                  /home/rosetta/archive/rosetta3/general/logname.pf \
                                  /home/rosetta/archive/rosetta3/general/lilock.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools lockinit 
  
#!!  
  
  
dutch/target/genblexdict.o : /home/rosetta/archive/rosetta3/tools/genblexdict.p \
                                  /home/rosetta/archive/rosetta3/general/globdef.pf \
                                  /home/rosetta/archive/rosetta3/unix/cisam.pf \
                                  /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf \
                                  /home/rosetta/archive/rosetta3/general/lidomaint.pf \
                                  /home/rosetta/archive/rosetta3/dutch/lstypetostr.pf \
                                  /home/rosetta/archive/rosetta3/dutch/maket.pf \
                                  /home/rosetta/archive/rosetta3/general/mem.pf \
                                  /home/rosetta/archive/rosetta3/general/log.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/general/str.pf \
                                  /home/rosetta/archive/rosetta3/general/files.pf \
                                  /home/rosetta/archive/rosetta3/general/error.pf \
                                  /home/rosetta/archive/rosetta3/general/windows.pf \
                                  /home/rosetta/archive/rosetta3/general/ldtypetostr.pf \
                                  /home/rosetta/archive/rosetta3/general/ldconvrec.pf \
                                  /home/rosetta/archive/rosetta3/general/listree.pf \
                                  /home/rosetta/archive/rosetta3/general/lsstree.pf \
                                  /home/rosetta/archive/rosetta3/general/strtokey.pf \
                                  /home/rosetta/archive/rosetta3/general/ldblex.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools genblexdict $(language)
#!!  
  
  
  
/home/rosetta/archive/rosetta3/dutch/genblexisf.o : /home/rosetta/archive/rosetta3/tools/genblexisf.p \
                                  /home/rosetta/archive/rosetta3/general/globdef.pf \
                                  /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf \
                                  /home/rosetta/archive/rosetta3/general/lsconstraints.pf \
                                  /home/rosetta/archive/rosetta3/general/interface1.pf \
                                  /home/rosetta/archive/rosetta3/general/mem.pf \
                                  /home/rosetta/archive/rosetta3/general/log.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/general/str.pf \
                                  /home/rosetta/archive/rosetta3/general/files.pf \
                                  /home/rosetta/archive/rosetta3/general/ldstrtotype.pf \
                                  /home/rosetta/archive/rosetta3/general/ldidpatterns.pf \
                                  /home/rosetta/archive/rosetta3/general/ldconvrec.pf \
                                  /home/rosetta/archive/rosetta3/dutch/lsconvattr.pf \
                                  /home/rosetta/archive/rosetta3/general/strtokey.pf \
                                  /home/rosetta/archive/rosetta3/general/ldblex.pf \
                                  /home/rosetta/archive/rosetta3/general/lisdict.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools genblexisf $(language)
#!!  
  
  
/home/rosetta/archive/rosetta3/dutch/ldlexconvert.o : /home/rosetta/archive/rosetta3/dutch/ldlexconvert.p \
                                  /home/rosetta/archive/rosetta3/general/mdictdef.pf \
                                  /home/rosetta/archive/rosetta3/dutch/lsmorfdef.pf \
                                  /home/rosetta/archive/rosetta3/general/limorfdef.pf \
                                  /home/rosetta/archive/rosetta3/general/files.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldlexconvert 
  
  
#!!  
  
  
general/target/genmdicttext.o : tools/target/genmdicttext.p \
                                  /home/rosetta/archive/rosetta3/unix/cisam.pf \
                                  /home/rosetta/archive/rosetta3/general/files.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/tools/ldlexconvert.pf \
                                  /home/rosetta/archive/rosetta3/general/strtokey.pf \
                                  /home/rosetta/archive/rosetta3/general/ldmdict.pf \
	                          /home/rosetta/archive/rosetta3/general/mdictdef.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools genmdicttext $(language)
#!!  
  
  
/home/rosetta/archive/rosetta3/dutch/genmdictdata.o : /home/rosetta/archive/rosetta3/tools/genmdictdata.p \
                                  /home/rosetta/archive/rosetta3/unix/cisam.pf \
                                  /home/rosetta/archive/rosetta3/general/files.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/general/interface1.pf \
                                  /home/rosetta/archive/rosetta3/tools/ldlexconvert.pf \
                                  /home/rosetta/archive/rosetta3/general/strtokey.pf \
                                  /home/rosetta/archive/rosetta3/general/ldmdict.pf \
                                  /home/rosetta/archive/rosetta3/general/mdictdef.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools genmdictdata $(language)
#!!  
  
tools/target/genildicttext.o : tools/target/genildicttext.p \
                                  /home/rosetta/archive/rosetta3/unix/cisam.pf \
                                  /home/rosetta/archive/rosetta3/general/files.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/general/strtokey.pf \
                                  /home/rosetta/archive/rosetta3/general/strtomkey.pf \
                                  /home/rosetta/archive/rosetta3/general/liildict.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools genildicttext 
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/genildictdata.o : /home/rosetta/archive/rosetta3/tools/genildictdata.p \
                                  /home/rosetta/archive/rosetta3/unix/cisam.pf \
                                  /home/rosetta/archive/rosetta3/general/files.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/general/str.pf \
                                  /home/rosetta/archive/rosetta3/general/strtokey.pf \
                                  /home/rosetta/archive/rosetta3/general/strtomkey.pf \
                                  /home/rosetta/archive/rosetta3/general/liildict.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools genildictdata 
#!!  
  
tools/target/gensiddicttext.o : tools/target/gensiddicttext.p \
                                  /home/rosetta/archive/rosetta3/unix/cisam.pf \
                                  /home/rosetta/archive/rosetta3/general/files.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/general/strtokey.pf \
                                  /home/rosetta/archive/rosetta3/general/strtomkey.pf \
                                  /home/rosetta/archive/rosetta3/general/lisiddict.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools gensiddicttext 
#!!  
  
/home/rosetta/archive/rosetta3/tools/gensiddictdata.o : /home/rosetta/archive/rosetta3/tools/gensiddictdata.p \
                                  /home/rosetta/archive/rosetta3/unix/cisam.pf \
                                  /home/rosetta/archive/rosetta3/general/files.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/general/str.pf \
                                  /home/rosetta/archive/rosetta3/general/strtokey.pf \
                                  /home/rosetta/archive/rosetta3/general/strtomkey.pf \
                                  /home/rosetta/archive/rosetta3/general/lisiddict.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools gensiddictdata 
#!!  
  
/home/rosetta/archive/rosetta3/tools/genmcommenttext.o : /home/rosetta/archive/rosetta3/tools/genmcommenttext.p \
                                  /home/rosetta/archive/rosetta3/unix/cisam.pf \
                                  /home/rosetta/archive/rosetta3/general/files.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/general/strtokey.pf \
                                  /home/rosetta/archive/rosetta3/general/strtomkey.pf \
                                  /home/rosetta/archive/rosetta3/general/limcomment.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools genmcommenttext 
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/genmcommentdata.o : /home/rosetta/archive/rosetta3/tools/genmcommentdata.p \
                                  /home/rosetta/archive/rosetta3/unix/cisam.pf \
                                  /home/rosetta/archive/rosetta3/general/files.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/general/str.pf \
                                  /home/rosetta/archive/rosetta3/general/strtokey.pf \
                                  /home/rosetta/archive/rosetta3/general/strtomkey.pf \
                                  /home/rosetta/archive/rosetta3/general/limcomment.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools genmcommentdata 
#!!  
 
/home/rosetta/archive/rosetta3/tools/genscommenttext.o : /home/rosetta/archive/rosetta3/tools/genscommenttext.p \
                                  /home/rosetta/archive/rosetta3/unix/cisam.pf \
                                  /home/rosetta/archive/rosetta3/general/files.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/general/strtokey.pf \
                                  /home/rosetta/archive/rosetta3/general/liscomment.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools genscommenttext 
#!!  
  
/home/rosetta/archive/rosetta3/tools/genscommentdata.o : /home/rosetta/archive/rosetta3/tools/genscommentdata.p \
                                  /home/rosetta/archive/rosetta3/unix/cisam.pf \
                                  /home/rosetta/archive/rosetta3/general/files.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/general/str.pf \
                                  /home/rosetta/archive/rosetta3/general/strtokey.pf \
                                  /home/rosetta/archive/rosetta3/general/liscomment.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools genscommentdata 
#!!  
  
  
dutch/target/geniddicttext.o : tools/target/geniddicttext.p \
                                  /home/rosetta/archive/rosetta3/unix/cisam.pf \
                                  /home/rosetta/archive/rosetta3/general/files.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/dutch/lstypetostr.pf \
                                  /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf \
                                  /home/rosetta/archive/rosetta3/general/strtokey.pf \
                                  /home/rosetta/archive/rosetta3/general/liiddict.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools geniddicttext $(language)
#!!  
  
  
/home/rosetta/archive/rosetta3/dutch/geniddictdata.o : /home/rosetta/archive/rosetta3/tools/geniddictdata.p \
                                  /home/rosetta/archive/rosetta3/unix/cisam.pf \
                                  /home/rosetta/archive/rosetta3/general/files.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/dutch/lsstrtotype.pf \
                                  /home/rosetta/archive/rosetta3/general/strtokey.pf \
                                  /home/rosetta/archive/rosetta3/general/liiddict.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools geniddictdata $(language)
#!!   
  
tools/target/gensdicttext.o : tools/target/gensdicttext.p \
                                  /home/rosetta/archive/rosetta3/unix/cisam.pf \
                                  /home/rosetta/archive/rosetta3/general/files.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/general/strtokey.pf \
                                  /home/rosetta/archive/rosetta3/general/lisdict.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools gensdicttext 
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/gensdictdata.o : /home/rosetta/archive/rosetta3/tools/gensdictdata.p \
                                  /home/rosetta/archive/rosetta3/unix/cisam.pf \
                                  /home/rosetta/archive/rosetta3/general/files.pf \
                                  /home/rosetta/archive/rosetta3/general/string.pf \
                                  /home/rosetta/archive/rosetta3/general/str.pf \
                                  /home/rosetta/archive/rosetta3/general/strtokey.pf \
                                  /home/rosetta/archive/rosetta3/general/lisdict.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools gensdictdata 
#!!  
  
#!! ---------------module atransfer--------------------------------!!!  
  
  
  
/home/rosetta/archive/rosetta3/general/atransfer.o : /home/rosetta/archive/rosetta3/general/atransfer.p  \
                  /home/rosetta/archive/rosetta3/general/atransfer.pf  \
			  /home/rosetta/archive/rosetta3/general/debug.pf  \
			  /home/rosetta/archive/rosetta3/general/superdtree.pf \
			  /home/rosetta/archive/rosetta3/general/mem.pf \
			  /home/rosetta/archive/rosetta3/general/string.pf \
			  /home/rosetta/archive/rosetta3/general/globdef.pf \
			  /home/rosetta/archive/rosetta3/unix/mb.pf \
			  /home/rosetta/archive/rosetta3/general/log.pf \
                          /home/rosetta/archive/rosetta3/general/wnd.pf \
			  /home/rosetta/archive/rosetta3/Xw/Xid.h \
			  /home/rosetta/archive/rosetta3/Xw/Sid.h \
			  /home/rosetta/archive/rosetta3/general/error.pf \
			  /home/rosetta/archive/rosetta3/general/ldmdict.pf \
			  /home/rosetta/archive/rosetta3/general/hiltree.pf \
			  /home/rosetta/archive/rosetta3/interlingua/liilrules.pf \
			  /home/rosetta/archive/rosetta3/general/liildict.pf \
			  /home/rosetta/archive/rosetta3/general/ldanilrules.pf \
			  /home/rosetta/archive/rosetta3/general/listree.pf \
			  /home/rosetta/archive/rosetta3/general/alayout.pf \
			  /home/rosetta/archive/rosetta3/general/limorfdef.pf \
			  /home/rosetta/archive/rosetta3/general/interfaces.pf \
			  /home/rosetta/archive/rosetta3/general/interface1.pf \
   	                  /home/rosetta/archive/rosetta3/general/ldmrules.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general atransfer
  
  
  
#!! ---------------module gtransfer--------------------------------!!!  
  
  
  
/home/rosetta/archive/rosetta3/general/gtransfer.o : /home/rosetta/archive/rosetta3/general/gtransfer.p  \
         /home/rosetta/archive/rosetta3/general/gtransfer.pf  \
         /home/rosetta/archive/rosetta3/general/hyperdtree.pf  \
         /home/rosetta/archive/rosetta3/general/debug.pf  \
         /home/rosetta/archive/rosetta3/general/log.pf  \
         /home/rosetta/archive/rosetta3/general/hiltree.pf  \
         /home/rosetta/archive/rosetta3/general/interfaces.pf  \
         /home/rosetta/archive/rosetta3/general/lidomaint.pf  \
         /home/rosetta/archive/rosetta3/interlingua/liilrules.pf  \
         /home/rosetta/archive/rosetta3/general/liildict.pf  \
         /home/rosetta/archive/rosetta3/general/ldgenilrules.pf  \
         /home/rosetta/archive/rosetta3/general/ldmrules.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general gtransfer
  
  
  
  
  
#!! ---------------module hiltree--------------------------------!!!  
  
  
/home/rosetta/archive/rosetta3/general/hiltree.o : /home/rosetta/archive/rosetta3/general/hiltree.p  \
         /home/rosetta/archive/rosetta3/general/hiltree.pf  \
         /home/rosetta/archive/rosetta3/interlingua/liilrules.pf  \
         /home/rosetta/archive/rosetta3/unix/globbuf.pf  \
         /home/rosetta/archive/rosetta3/general/log.pf  \
                        /home/rosetta/archive/rosetta3/general/mem.pf  \
         /home/rosetta/archive/rosetta3/general/debug.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general hiltree
  
  
  
#!! ---------------module liildict--------------------------------!!!  
  
  
/home/rosetta/archive/rosetta3/general/liildict.o : /home/rosetta/archive/rosetta3/general/liildict.p \
         /home/rosetta/archive/rosetta3/unix/cisam.pf  \
         /home/rosetta/archive/rosetta3/general/liildict.pf  \
         /home/rosetta/archive/rosetta3/general/globdef.pf  \
         /home/rosetta/archive/rosetta3/general/log.pf  \
         /home/rosetta/archive/rosetta3/general/debug.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general liildict
  
  
  
  
#!! ---------------module lisiddict--------------------------------!!  
  
  
/home/rosetta/archive/rosetta3/general/lisiddict.o : /home/rosetta/archive/rosetta3/general/lisiddict.p \
         /home/rosetta/archive/rosetta3/unix/cisam.pf  \
         /home/rosetta/archive/rosetta3/general/lisiddict.pf  \
         /home/rosetta/archive/rosetta3/general/globdef.pf  \
         /home/rosetta/archive/rosetta3/general/log.pf  \
         /home/rosetta/archive/rosetta3/general/debug.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general lisiddict
  
  
  
  
#!! ---------------module liiddict--------------------------------!!  
  
  
/home/rosetta/archive/rosetta3/general/liiddict.o : /home/rosetta/archive/rosetta3/general/liiddict.p \
         /home/rosetta/archive/rosetta3/unix/cisam.pf  \
         /home/rosetta/archive/rosetta3/general/liiddict.pf  \
         /home/rosetta/archive/rosetta3/general/globdef.pf  \
         /home/rosetta/archive/rosetta3/general/log.pf  \
         /home/rosetta/archive/rosetta3/general/debug.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general liiddict
  
  
  
#!! ---------------module segmrules--------------------------------!!!  
  
  
  
/home/rosetta/archive/rosetta3/general/segmrules.o : /home/rosetta/archive/rosetta3/general/segmrules.p \
                        /home/rosetta/archive/rosetta3/general/segmrules.pf \
                        /home/rosetta/archive/rosetta3/general/log.pf \
                        /home/rosetta/archive/rosetta3/general/files.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general segmrules
  
#!! ---------------module asegmrules--------------------------------!!!  
  
  
  
/home/rosetta/archive/rosetta3/general/asegmrules.o : /home/rosetta/archive/rosetta3/general/asegmrules.p \
                        /home/rosetta/archive/rosetta3/general/asegmrules.pf \
                        /home/rosetta/archive/rosetta3/general/segmrules.pf \
                        /home/rosetta/archive/rosetta3/general/string.pf \
                        /home/rosetta/archive/rosetta3/general/limorfdef.pf \
                        /home/rosetta/archive/rosetta3/general/mem.pf  \
                        /home/rosetta/archive/rosetta3/general/debug.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general asegmrules
  
#!! ---------------module gsegmrules--------------------------------!!!  
  
  
  
/home/rosetta/archive/rosetta3/general/gsegmrules.o : /home/rosetta/archive/rosetta3/general/gsegmrules.p \
                        /home/rosetta/archive/rosetta3/general/gsegmrules.pf \
                        /home/rosetta/archive/rosetta3/general/segmrules.pf \
                        /home/rosetta/archive/rosetta3/general/string.pf \
                        /home/rosetta/archive/rosetta3/general/limorfdef.pf \
                        /home/rosetta/archive/rosetta3/general/mem.pf  \
                        /home/rosetta/archive/rosetta3/general/debug.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general gsegmrules
  
#!!---------------------------------------------!!!  
  
  
general/target/test.o : general/target/test.p \
                   /home/rosetta/archive/rosetta3/general/asegmrules.pf \
                   /home/rosetta/archive/rosetta3/general/gsegmrules.pf \
                   /home/rosetta/archive/rosetta3/general/globdef.pf \
                   /home/rosetta/archive/rosetta3/general/string.pf \
                   /home/rosetta/archive/rosetta3/general/str.pf \
                   /home/rosetta/archive/rosetta3/general/printerf.pf \
                   /home/rosetta/archive/rosetta3/general/log.pf \
                   /home/rosetta/archive/rosetta3/general/alayout.pf \
                   /home/rosetta/archive/rosetta3/general/drawstree.pf \
                   /home/rosetta/archive/rosetta3/general/debug.pf \
                   /home/rosetta/archive/rosetta3/general/interface0.pf \
                   /home/rosetta/archive/rosetta3/general/interface1.pf \
                   /home/rosetta/archive/rosetta3/general/interface7.pf \
                   /home/rosetta/archive/rosetta3/general/interface8.pf \
                   general/target/interface1to7.pf \
                   /home/rosetta/archive/rosetta3/general/interfaces.pf \
                   /home/rosetta/archive/rosetta3/general/amorph.pf \
                   /home/rosetta/archive/rosetta3/general/gmorph.pf \
                   /home/rosetta/archive/rosetta3/general/asegm.pf \
                   /home/rosetta/archive/rosetta3/general/alex.pf \
                   /home/rosetta/archive/rosetta3/general/alextree.pf \
                   /home/rosetta/archive/rosetta3/general/glextree.pf \
                   /home/rosetta/archive/rosetta3/general/glex.pf \
                   /home/rosetta/archive/rosetta3/general/gsegm.pf \
                   /home/rosetta/archive/rosetta3/general/glayout.pf \
                   /home/rosetta/archive/rosetta3/general/ldmdict.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general test
  
  
  
  
/home/rosetta/archive/rosetta3/general/asegm.o : /home/rosetta/archive/rosetta3/general/asegm.p \
                    /home/rosetta/archive/rosetta3/general/asegm.pf \
                    /home/rosetta/archive/rosetta3/general/string.pf \
                    /home/rosetta/archive/rosetta3/general/config.pf \
                    /home/rosetta/archive/rosetta3/general/asegmrules.pf \
                    /home/rosetta/archive/rosetta3/general/segmrules.pf \
                    /home/rosetta/archive/rosetta3/general/globdef.pf \
                    /home/rosetta/archive/rosetta3/general/limorfdef.pf \
                    /home/rosetta/archive/rosetta3/general/interface1.pf \
                    /home/rosetta/archive/rosetta3/general/interface0.pf \
                    /home/rosetta/archive/rosetta3/general/ldmorfdef.pf \
                    /home/rosetta/archive/rosetta3/general/ldmdict.pf \
                    /home/rosetta/archive/rosetta3/general/ldsucc.pf \
                    /home/rosetta/archive/rosetta3/general/debug.pf \
                    /home/rosetta/archive/rosetta3/general/lifixiddict.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general asegm
  
  
  
#!!!!!!!!!!!!!!!!!!!ldmorfdef!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
/home/rosetta/archive/rosetta3/dutch/ldmorfdef.o : /home/rosetta/archive/rosetta3/dutch/ldmorfdef.p \
                            /home/rosetta/archive/rosetta3/general/ldmorfdef.pf \
                            /home/rosetta/archive/rosetta3/dutch/lsmorfdef.pf \
                            /home/rosetta/archive/rosetta3/dutch/lsphondef.pf \
                            /home/rosetta/archive/rosetta3/general/limorfdef.pf \
                            /home/rosetta/archive/rosetta3/general/interface0.pf \
                            /home/rosetta/archive/rosetta3/general/asegm.pf \
                            /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldmorfdef
  
  
  
#!!!!!!!!!!!!!!!!!!!lsphondef!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
  
/home/rosetta/archive/rosetta3/dutch/lsphondef.o : /home/rosetta/archive/rosetta3/dutch/lsphondef.p \
                            /home/rosetta/archive/rosetta3/dutch/lsphondef.pf \
                            /home/rosetta/archive/rosetta3/general/mem.pf  \
                            /home/rosetta/archive/rosetta3/general/ldconvrec.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) lsphondef
  
#!!!!!!!!!!!!!!!!!!!mdictdef!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
  
dutch/target/mdictdef.o : /home/rosetta/archive/rosetta3/general/mdictdef.p \
                           /home/rosetta/archive/rosetta3/general/mdictdef.pf \
                           /home/rosetta/archive/rosetta3/dutch/lsphondef.pf \
                           /home/rosetta/archive/rosetta3/general/limorfdef.pf \
                           /home/rosetta/archive/rosetta3/general/interface1.pf \
                           /home/rosetta/archive/rosetta3/general/ldmdict.pf \
                           /home/rosetta/archive/rosetta3/general/ldconvrec.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general mdictdef $(language)
  
#!!!!!!!!!!!!!!!!!!!ldmdict!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
/home/rosetta/archive/rosetta3/dutch/ldmdict.o :   /home/rosetta/archive/rosetta3/general/ldmdict.p \
                            /home/rosetta/archive/rosetta3/general/ldmdict.pf \
                            /home/rosetta/archive/rosetta3/general/limorfdef.pf \
                            /home/rosetta/archive/rosetta3/dutch/lsphondef.pf \
                            /home/rosetta/archive/rosetta3/general/interface1.pf \
                            /home/rosetta/archive/rosetta3/general/globdef.pf \
                            /home/rosetta/archive/rosetta3/general/string.pf \
                            /home/rosetta/archive/rosetta3/general/debug.pf \
                            /home/rosetta/archive/rosetta3/dutch/lsphondef.pf \
                            /home/rosetta/archive/rosetta3/general/mdictdef.pf \
                            /home/rosetta/archive/rosetta3/unix/cisam.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general ldmdict $(language)
  
  
  
#!!!!!!!!!!!!!!!!!!!ldidpatterns!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
dutch/target/ldidpatterns.o :   dutch/target/ldidpatterns.p \
                            /home/rosetta/archive/rosetta3/general/ldidpatterns.pf \
                            /home/rosetta/archive/rosetta3/dutch/lsstrtotype.pf \
                            /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldidpatterns 
  
  
#!!!!!!!!!!!!!!!!!!!alex!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
/home/rosetta/archive/rosetta3/general/alex.o : /home/rosetta/archive/rosetta3/general/alex.p \
                   /home/rosetta/archive/rosetta3/general/alex.pf \
                   /home/rosetta/archive/rosetta3/general/string.pf \
                   /home/rosetta/archive/rosetta3/general/ldaffixlex.pf \
                   /home/rosetta/archive/rosetta3/general/ldblex.pf \
                   /home/rosetta/archive/rosetta3/general/ldgluelex.pf \
                   /home/rosetta/archive/rosetta3/general/listree.pf \
                   /home/rosetta/archive/rosetta3/general/interface1.pf \
                   /home/rosetta/archive/rosetta3/general/debug.pf \
                   /home/rosetta/archive/rosetta3/general/lisdict.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general alex
  
  
  
#!!!!!!!!!!!!!!!!!!!alextree!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
/home/rosetta/archive/rosetta3/general/alextree.o : /home/rosetta/archive/rosetta3/general/alextree.p \
                       /home/rosetta/archive/rosetta3/general/alextree.pf \
                       /home/rosetta/archive/rosetta3/general/listree.pf \
                       /home/rosetta/archive/rosetta3/general/interface0.pf \
                       /home/rosetta/archive/rosetta3/general/interface1.pf \
                       /home/rosetta/archive/rosetta3/general/anlexif.pf \
                       /home/rosetta/archive/rosetta3/general/mem.pf \
                       /home/rosetta/archive/rosetta3/general/globdef.pf \
                       /home/rosetta/archive/rosetta3/general/drawstree.pf \
                       /home/rosetta/archive/rosetta3/general/ldcatsets.pf \
                       /home/rosetta/archive/rosetta3/general/debug.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general alextree
  
  
  
#!!!!!!!!!!!!!!!!!!!ldaffixlex!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
/home/rosetta/archive/rosetta3/dutch/ldaffixlex.o : /home/rosetta/archive/rosetta3/general/ldaffixlex.p \
                             /home/rosetta/archive/rosetta3/general/ldaffixlex.pf \
                             /home/rosetta/archive/rosetta3/general/listree.pf \
                             /home/rosetta/archive/rosetta3/general/lidomaint.pf \
                             /home/rosetta/archive/rosetta3/general/ldblex.pf \
                             /home/rosetta/archive/rosetta3/general/ldcatsets.pf \
                             /home/rosetta/archive/rosetta3/general/ldgetkey.pf \
                             /home/rosetta/archive/rosetta3/general/lsstree.pf \
                             /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf \
                             /home/rosetta/archive/rosetta3/dutch/maket.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general ldaffixlex $(language)
  
  
#!!!!!!!!!!!!!!!!!!!ldgluelex!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
/home/rosetta/archive/rosetta3/dutch/ldgluelex.o :  /home/rosetta/archive/rosetta3/general/ldgluelex.p \
                             /home/rosetta/archive/rosetta3/general/ldgluelex.pf \
                             /home/rosetta/archive/rosetta3/general/listree.pf \
                             /home/rosetta/archive/rosetta3/general/lidomaint.pf \
                             /home/rosetta/archive/rosetta3/general/lsstree.pf \
                             /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf \
                             /home/rosetta/archive/rosetta3/dutch/maket.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general ldgluelex $(language)
  
  
  
#!!!!!!!!!!!!!!!!!!!ldblex!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
/home/rosetta/archive/rosetta3/dutch/ldblex.o : /home/rosetta/archive/rosetta3/general/ldblex.p \
                         /home/rosetta/archive/rosetta3/general/ldblex.pf \
                         /home/rosetta/archive/rosetta3/general/listree.pf \
                         /home/rosetta/archive/rosetta3/general/lsstree.pf \
                         /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf \
                         /home/rosetta/archive/rosetta3/dutch/maket.pf \
                         /home/rosetta/archive/rosetta3/unix/cisam.pf \
                         /home/rosetta/archive/rosetta3/general/mem.pf  \
                         /home/rosetta/archive/rosetta3/general/ldgetkey.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general ldblex $(language) 
  
  
  
#!!------------------amorph---------------------------!!  
  
  
/home/rosetta/archive/rosetta3/general/amorph.o : /home/rosetta/archive/rosetta3/general/amorph.p \
                   /home/rosetta/archive/rosetta3/general/amorph.pf \
                   /home/rosetta/archive/rosetta3/general/debug.pf \
                   /home/rosetta/archive/rosetta3/general/error.pf \
                   /home/rosetta/archive/rosetta3/general/log.pf \
                   /home/rosetta/archive/rosetta3/general/interfaces.pf \
                   /home/rosetta/archive/rosetta3/general/interface0.pf \
                   /home/rosetta/archive/rosetta3/general/interface1.pf \
                   /home/rosetta/archive/rosetta3/general/alayout.pf \
                   /home/rosetta/archive/rosetta3/general/asegm.pf \
                   /home/rosetta/archive/rosetta3/general/wnd.pf \
                   /home/rosetta/archive/rosetta3/Xw/Xid.h \
                   /home/rosetta/archive/rosetta3/Xw/Sid.h \
                   /home/rosetta/archive/rosetta3/general/alex.pf \
                   /home/rosetta/archive/rosetta3/general/alextree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general amorph
  
  
#!!!!!!!!!!!!!!!!!!!glextree!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
/home/rosetta/archive/rosetta3/general/glextree.o : /home/rosetta/archive/rosetta3/general/glextree.p \
                       /home/rosetta/archive/rosetta3/general/glextree.pf \
                       /home/rosetta/archive/rosetta3/general/listree.pf \
                       /home/rosetta/archive/rosetta3/general/interface7.pf \
                       /home/rosetta/archive/rosetta3/general/genlexif.pf \
                       /home/rosetta/archive/rosetta3/general/drawstree.pf \
                       /home/rosetta/archive/rosetta3/general/str.pf \
                       /home/rosetta/archive/rosetta3/general/ldtypetostr.pf \
                       /home/rosetta/archive/rosetta3/general/ldcatsets.pf \
                       /home/rosetta/archive/rosetta3/general/string.pf \
                       /home/rosetta/archive/rosetta3/general/debug.pf \
                       /home/rosetta/archive/rosetta3/general/ldaffixlex.pf \
                       /home/rosetta/archive/rosetta3/general/ldgluelex.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general glextree
  
  
  
  
#!!!!!!!!!!!!!!!!!!!ldgetkey!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
/home/rosetta/archive/rosetta3/dutch/ldgetkey.o : /home/rosetta/archive/rosetta3/dutch/ldgetkey.p \
                         /home/rosetta/archive/rosetta3/general/ldgetkey.pf \
                         /home/rosetta/archive/rosetta3/general/listree.pf \
                         /home/rosetta/archive/rosetta3/general/lsstree.pf \
                         /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldgetkey
  
  
#!!!!!!!!!!!!!!!!!!!glex!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
/home/rosetta/archive/rosetta3/general/glex.o : /home/rosetta/archive/rosetta3/general/glex.p \
                   /home/rosetta/archive/rosetta3/general/glex.pf \
                   /home/rosetta/archive/rosetta3/general/string.pf \
                   /home/rosetta/archive/rosetta3/general/ldgetkey.pf \
                   /home/rosetta/archive/rosetta3/general/listree.pf \
                   /home/rosetta/archive/rosetta3/general/interface7.pf \
                   /home/rosetta/archive/rosetta3/general/interface1.pf \
                   /home/rosetta/archive/rosetta3/general/ldaffixlex.pf \
                   /home/rosetta/archive/rosetta3/general/ldgluelex.pf \
                   /home/rosetta/archive/rosetta3/general/lisdict.pf \
                   /home/rosetta/archive/rosetta3/general/debug.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general glex
  
  
  
#!!!!!!!!!!!!!!!!!!!gsegm!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
/home/rosetta/archive/rosetta3/general/gsegm.o : /home/rosetta/archive/rosetta3/general/gsegm.p \
                    /home/rosetta/archive/rosetta3/general/gsegm.pf \
                    /home/rosetta/archive/rosetta3/general/string.pf \
                    /home/rosetta/archive/rosetta3/general/config.pf \
                    /home/rosetta/archive/rosetta3/general/segmrules.pf \
                    /home/rosetta/archive/rosetta3/general/gsegmrules.pf \
                    /home/rosetta/archive/rosetta3/general/globdef.pf \
                    /home/rosetta/archive/rosetta3/general/limorfdef.pf \
                    /home/rosetta/archive/rosetta3/general/interface1.pf \
                    /home/rosetta/archive/rosetta3/general/interface8.pf \
                    /home/rosetta/archive/rosetta3/general/interface7.pf \
                    /home/rosetta/archive/rosetta3/general/ldmorfdef.pf \
                    /home/rosetta/archive/rosetta3/general/ldmdict.pf \
                    /home/rosetta/archive/rosetta3/general/debug.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general gsegm
  
  
  
#!!!!!!!!!!!!!!!!!!!!!!!!!!!drawstree!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
/home/rosetta/archive/rosetta3/general/drawstree.o : /home/rosetta/archive/rosetta3/general/drawstree.p \
                        /home/rosetta/archive/rosetta3/general/drawstree.pf \
                        /home/rosetta/archive/rosetta3/general/drawtree.pf \
                        /home/rosetta/archive/rosetta3/general/oldtree.pf \
                        /home/rosetta/archive/rosetta3/general/globdef.pf \
                        /home/rosetta/archive/rosetta3/general/wnd.pf \
                        /home/rosetta/archive/rosetta3/Xw/Xid.h \
                        /home/rosetta/archive/rosetta3/Xw/Sid.h \
                        /home/rosetta/archive/rosetta3/general/lidomaint.pf \
                        /home/rosetta/archive/rosetta3/general/listree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general drawstree
  
  
  
#!!!!!!!!!!!!!!!!!!!!!!lirectoscreen!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
/home/rosetta/archive/rosetta3/general/lirectoscreen.o : /home/rosetta/archive/rosetta3/general/lirectoscreen.p \
                            /home/rosetta/archive/rosetta3/general/lirectoscreen.pf \
                            /home/rosetta/archive/rosetta3/general/ldconvrec.pf \
                            /home/rosetta/archive/rosetta3/general/windows.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general lirectoscreen
  
  
  
  
#!!!!!!!!!!!!!!!!!!!!!!rectoscreen!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
/home/rosetta/archive/rosetta3/general/rectoscreen.o : /home/rosetta/archive/rosetta3/general/rectoscreen.p \
                            /home/rosetta/archive/rosetta3/general/rectoscreen.pf \
                            /home/rosetta/archive/rosetta3/general/string.pf \
                            /home/rosetta/archive/rosetta3/general/str.pf \
                            /home/rosetta/archive/rosetta3/general/files.pf \
                            /home/rosetta/archive/rosetta3/general/strtokey.pf \
                            /home/rosetta/archive/rosetta3/general/strtomkey.pf \
                            /home/rosetta/archive/rosetta3/general/error.pf \
                            /home/rosetta/archive/rosetta3/general/listree.pf \
                            /home/rosetta/archive/rosetta3/general/ldconvrec.pf \
                            /home/rosetta/archive/rosetta3/general/wnd.pf \
                            /home/rosetta/archive/rosetta3/Xw/Xid.h \
                            /home/rosetta/archive/rosetta3/Xw/Sid.h \
                            /home/rosetta/archive/rosetta3/general/globsubst.pf \
                            /home/rosetta/archive/rosetta3/general/drawstree.pf \
                            /home/rosetta/archive/rosetta3/general/drawtree.pf \
                            /home/rosetta/archive/rosetta3/general/ldgetkey.pf \
                            /home/rosetta/archive/rosetta3/general/mem.pf  \
                            /home/rosetta/archive/rosetta3/general/ldcatsets.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general rectoscreen
  
# below, rectoscreen.opt does not depend on drawstree.opt because this  
# would introduce a cycle  
  
  
#!!!!!!!!!!!!!!!!!!!!!!testdict!!!!!!!!!!!!!!  
  
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!glayout!!!!!!!!!!!!!!!!!!!  
  
  
/home/rosetta/archive/rosetta3/general/glayout.o : /home/rosetta/archive/rosetta3/general/glayout.p \
                     /home/rosetta/archive/rosetta3/general/glayout.pf \
                     /home/rosetta/archive/rosetta3/general/string.pf \
                     /home/rosetta/archive/rosetta3/general/str.pf \
                     /home/rosetta/archive/rosetta3/general/globdef.pf \
                     /home/rosetta/archive/rosetta3/general/wnd.pf \
                     /home/rosetta/archive/rosetta3/Xw/Xid.h \
                     /home/rosetta/archive/rosetta3/Xw/Sid.h \
                     /home/rosetta/archive/rosetta3/general/interface8.pf \
                     /home/rosetta/archive/rosetta3/general/interface1.pf \
                     /home/rosetta/archive/rosetta3/general/interfaces.pf \
                     /home/rosetta/archive/rosetta3/unix/globbuf.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general glayout
  
  
  
#!!------------------gmorph---------------------------!!  
  
  
/home/rosetta/archive/rosetta3/general/gmorph.o : /home/rosetta/archive/rosetta3/general/gmorph.p \
                   /home/rosetta/archive/rosetta3/general/gmorph.pf \
                   /home/rosetta/archive/rosetta3/general/interfaces.pf \
                   /home/rosetta/archive/rosetta3/general/gsegm.pf \
                   /home/rosetta/archive/rosetta3/general/glex.pf \
                   /home/rosetta/archive/rosetta3/general/glextree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general gmorph
  
  
  
#!!!--------------------morftest------------------------------!!  
  
  
general/target/morftest.o : general/target/morftest.p \
                   /home/rosetta/archive/rosetta3/general/asegmrules.pf \
                   /home/rosetta/archive/rosetta3/general/gsegmrules.pf \
                   /home/rosetta/archive/rosetta3/general/globdef.pf \
                   /home/rosetta/archive/rosetta3/general/printerf.pf \
                   /home/rosetta/archive/rosetta3/general/config.pf \
                   /home/rosetta/archive/rosetta3/general/log.pf \
                   /home/rosetta/archive/rosetta3/general/alayout.pf \
                   /home/rosetta/archive/rosetta3/general/drawstree.pf \
                   /home/rosetta/archive/rosetta3/general/debug.pf \
                   general/target/interface1to7.pf \
                   /home/rosetta/archive/rosetta3/general/interfaces.pf \
                   /home/rosetta/archive/rosetta3/general/amorph.pf \
                   /home/rosetta/archive/rosetta3/general/gmorph.pf \
                   /home/rosetta/archive/rosetta3/general/glayout.pf \
                   /home/rosetta/archive/rosetta3/general/ldmdict.pf \
                   /home/rosetta/archive/rosetta3/general/ldsucc.pf \
                   /home/rosetta/archive/rosetta3/general/ldblex.pf \
                   /home/rosetta/archive/rosetta3/general/lifixiddict.pf \
                   /home/rosetta/archive/rosetta3/general/lisdict.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general morftest
  
  
  
#!!!--------------------mgrammartest------------------------------!!  
  
  
general/target/mgrammartest.o : general/target/mgrammartest.p \
                   /home/rosetta/archive/rosetta3/general/asegmrules.pf \
                   /home/rosetta/archive/rosetta3/general/gsegmrules.pf \
                   /home/rosetta/archive/rosetta3/general/globdef.pf \
                   /home/rosetta/archive/rosetta3/general/printerf.pf \
                   /home/rosetta/archive/rosetta3/general/log.pf \
                   /home/rosetta/archive/rosetta3/general/alayout.pf \
                   /home/rosetta/archive/rosetta3/general/drawstree.pf \
                   /home/rosetta/archive/rosetta3/general/debug.pf \
                   general/target/interface1to7.pf \
                   /home/rosetta/archive/rosetta3/general/interfaces.pf \
                   /home/rosetta/archive/rosetta3/general/amorph.pf \
                   /home/rosetta/archive/rosetta3/general/gmorph.pf \
                   /home/rosetta/archive/rosetta3/general/glayout.pf \
                   /home/rosetta/archive/rosetta3/general/ldmdict.pf \
                   /home/rosetta/archive/rosetta3/general/ldsucc.pf \
                   /home/rosetta/archive/rosetta3/general/ldblex.pf \
                   /home/rosetta/archive/rosetta3/general/lifixiddict.pf \
                   /home/rosetta/archive/rosetta3/general/lisdict.pf \
                   /home/rosetta/archive/rosetta3/general/lisiddict.pf \
                   /home/rosetta/archive/rosetta3/general/strtokey.pf \
                   /home/rosetta/archive/rosetta3/general/limrules.pf \
                   /home/rosetta/archive/rosetta3/general/ldanmrules.pf \
                   /home/rosetta/archive/rosetta3/general/ldgenmrules.pf \
                   /home/rosetta/archive/rosetta3/general/ldmrules.pf \
                   general/target/interface3to5.pf \
                   /home/rosetta/archive/rosetta3/general/surfparser.pf \
                   /home/rosetta/archive/rosetta3/general/mparser.pf \
                   /home/rosetta/archive/rosetta3/general/debugmparser.pf \
                   /home/rosetta/archive/rosetta3/general/debugmgenerator.pf \
                   /home/rosetta/archive/rosetta3/general/mgenerator.pf \
                   /home/rosetta/archive/rosetta3/general/linearizer.pf \
                   /home/rosetta/archive/rosetta3/general/windows.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general mgrammartest
  
  
  
#!!!!!!!!!!!!!!!!!!!ldsucc!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
/home/rosetta/archive/rosetta3/dutch/ldsucc.o : /home/rosetta/archive/rosetta3/dutch/ldsucc.p \
                         /home/rosetta/archive/rosetta3/general/mem.pf  \
                         /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldsucc
  
  
#!!!!!!!!!!!!!!!!!!!lisdict!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
/home/rosetta/archive/rosetta3/general/lisdict.o :   /home/rosetta/archive/rosetta3/general/lisdict.p \
                        /home/rosetta/archive/rosetta3/general/lisdict.pf \
                        /home/rosetta/archive/rosetta3/general/debug.pf \
                        /home/rosetta/archive/rosetta3/unix/cisam.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general lisdict general
  
  
  
#!!!!!!!!!!!!!!!!!!!!!!fixiddict!!!!!!!!!!!!!!  
  
  
  
/home/rosetta/archive/rosetta3/tools/fixidgen.o : /home/rosetta/archive/rosetta3/tools/fixidgen.p \
                     /home/rosetta/archive/rosetta3/general/files.pf \
                     /home/rosetta/archive/rosetta3/general/lifixiddict.pf \
                     /home/rosetta/archive/rosetta3/unix/cisam.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools fixidgen
  
  
#!!!!!!!!!!!!!!!!!!!lifixiddict!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
/home/rosetta/archive/rosetta3/general/lifixiddict.o : /home/rosetta/archive/rosetta3/general/lifixiddict.p \
                          /home/rosetta/archive/rosetta3/general/lifixiddict.pf \
                          /home/rosetta/archive/rosetta3/general/debug.pf \
                          /home/rosetta/archive/rosetta3/general/interface0.pf \
                          /home/rosetta/archive/rosetta3/general/string.pf \
                          /home/rosetta/archive/rosetta3/general/alayout.pf  \
                          /home/rosetta/archive/rosetta3/unix/cisam.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general lifixiddict general
  
  
#!!!!!!!!!!!!!!!!!!!!!!tools:dictgen!!!!!!!!!!!!!!  
  
  
tools/target/dictgen.o : tools/target/dictgen.p \
                    /home/rosetta/archive/rosetta3/general/strtokey.pf \
                    /home/rosetta/archive/rosetta3/general/globdef.pf \
                    /home/rosetta/archive/rosetta3/general/string.pf \
                    /home/rosetta/archive/rosetta3/general/files.pf \
                    /home/rosetta/archive/rosetta3/general/ldmdict.pf \
                    /home/rosetta/archive/rosetta3/general/liildict.pf \
                    /home/rosetta/archive/rosetta3/general/lisiddict.pf \
                    /home/rosetta/archive/rosetta3/general/liiddict.pf \
                    /home/rosetta/archive/rosetta3/general/ldidpatterns.pf \
                    /home/rosetta/archive/rosetta3/general/str.pf \
                    /home/rosetta/archive/rosetta3/unix/cisam.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools dictgen
  
  
#!!!!!!!!!!!!!!!!!!!!!!tools:newdictgen!!!!!!!!!!!!!!  
  
  
dutch/target/newdictgen.o : tools/target/newdictgen.p \
                    /home/rosetta/archive/rosetta3/general/strtokey.pf \
                    /home/rosetta/archive/rosetta3/general/strtomkey.pf \
                    /home/rosetta/archive/rosetta3/general/globdef.pf \
                    /home/rosetta/archive/rosetta3/general/string.pf \
                    /home/rosetta/archive/rosetta3/general/files.pf \
                    /home/rosetta/archive/rosetta3/general/ldmdict.pf \
                    /home/rosetta/archive/rosetta3/general/liildict.pf \
                    /home/rosetta/archive/rosetta3/general/lisiddict.pf \
                    /home/rosetta/archive/rosetta3/general/lisdict.pf \
                    /home/rosetta/archive/rosetta3/general/liiddict.pf \
                    /home/rosetta/archive/rosetta3/general/liscomment.pf \
                    /home/rosetta/archive/rosetta3/general/limcomment.pf \
                    /home/rosetta/archive/rosetta3/general/ldidpatterns.pf \
                    /home/rosetta/archive/rosetta3/general/ldblex.pf \
                    /home/rosetta/archive/rosetta3/general/lsconstraints.pf \
                    /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf \
                    /home/rosetta/archive/rosetta3/dutch/lsconvattr.pf \
                    /home/rosetta/archive/rosetta3/dutch/lsphondef.pf \
                    /home/rosetta/archive/rosetta3/general/mdictdef.pf \
                    /home/rosetta/archive/rosetta3/general/ldconvrec.pf \
                    /home/rosetta/archive/rosetta3/general/limorfdef.pf \
                    /home/rosetta/archive/rosetta3/general/ldstrtotype.pf \
                    /home/rosetta/archive/rosetta3/general/interface1.pf \
                    /home/rosetta/archive/rosetta3/general/str.pf \
                    /home/rosetta/archive/rosetta3/general/mem.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools newdictgen $(language)
  
  
#!!!!!!!!!!!!!!!!!!!!!!tools:constraintgen!!!!!!!!!!!!!!  
  
  
tools/target/constraintgen.o : /home/rosetta/archive/rosetta3/tools/constraintgen.p \
                    /home/rosetta/archive/rosetta3/general/string.pf \
                    /home/rosetta/archive/rosetta3/general/files.pf \
                    /home/rosetta/archive/rosetta3/general/str.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools constraintgen tools
  
  
#!!!!!!!!!!!!!!!!!!!!!!language: lsconstraints!!!!!!!!!!!!!!  
  
  
dutch/target/lsconstraints.o : dutch/target/lsconstraints.p \
                               /home/rosetta/archive/rosetta3/general/lsconstraints.pf \
                                /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf \
                                /home/rosetta/archive/rosetta3/dutch/lsauxdom.pf \
                                /home/rosetta/archive/rosetta3/general/files.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) lsconstraints
  
  
#!!!!!!!!!!!!!!!!!!!!!!tools: strkey!!!!!!!!!!!!!!  
  
  
tools/target/strkey.o : /home/rosetta/archive/rosetta3/tools/strkey.p \
                    /home/rosetta/archive/rosetta3/general/strtokey.pf \
                    /home/rosetta/archive/rosetta3/general/string.pf \
                    /home/rosetta/archive/rosetta3/general/files.pf \
                    /home/rosetta/archive/rosetta3/unix/cisam.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools strkey
  
  
#!!!!!!!!!!!!!!!!!!!!!!!!!!!isfinit  
  
  
  
  
dutch/target/isfinit.o : tools/target/isfinit.p \
                         /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf \
                         /home/rosetta/archive/rosetta3/general/mdictdef.pf \
                         /home/rosetta/archive/rosetta3/general/lisdict.pf \
                         /home/rosetta/archive/rosetta3/general/liildict.pf \
                         /home/rosetta/archive/rosetta3/general/lisiddict.pf \
                         /home/rosetta/archive/rosetta3/general/liiddict.pf \
                         /home/rosetta/archive/rosetta3/general/liscomment.pf \
                         /home/rosetta/archive/rosetta3/general/limcomment.pf \
                         /home/rosetta/archive/rosetta3/unix/cisam.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools isfinit $(language)
  
  
#!!!!!!!!!!!!!!!!!!!!!!!!!!!isfmerge  
  
  
  
  
dutch/target/isfmerge.o : tools/target/isfmerge.p \
                         /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf \
                         /home/rosetta/archive/rosetta3/general/mdictdef.pf \
                         /home/rosetta/archive/rosetta3/general/strtokey.pf \
                         /home/rosetta/archive/rosetta3/general/lisdict.pf \
                         /home/rosetta/archive/rosetta3/general/liildict.pf \
                         /home/rosetta/archive/rosetta3/general/lisiddict.pf \
                         /home/rosetta/archive/rosetta3/general/liiddict.pf \
                         /home/rosetta/archive/rosetta3/general/liscomment.pf \
                         /home/rosetta/archive/rosetta3/general/limcomment.pf \
                         /home/rosetta/archive/rosetta3/unix/cisam.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools isfmerge $(language)
  
  
  
#!!!!!!!!!!!!!!!!!!!!!!!!!!!kdfmerge  
  
  
  
  
tools/target/kdfmerge.o : tools/target/kdfmerge.p \
                         /home/rosetta/archive/rosetta3/general/string.pf \
                         /home/rosetta/archive/rosetta3/general/strkeyrecdef.pf \
                         /home/rosetta/archive/rosetta3/unix/cisam.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools kdfmerge 
  
  
#!!!!!!!!!!!!!!!!!!!!!!!!!!!mkdfmerge  
  
  
  
  
tools/target/mkdfmerge.o : tools/target/mkdfmerge.p \
                         /home/rosetta/archive/rosetta3/general/string.pf \
                         /home/rosetta/archive/rosetta3/general/strtomkey.pf \
                         /home/rosetta/archive/rosetta3/unix/cisam.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools mkdfmerge
  
  
#!!-------------------------ildictdef--------!!  
  
  
  
  
#!! -------------------limrules-------------------!!  
  
  
  
/home/rosetta/archive/rosetta3/general/limrules.o : /home/rosetta/archive/rosetta3/general/limrules.p \
                       /home/rosetta/archive/rosetta3/general/limrules.pf \
                       /home/rosetta/archive/rosetta3/general/mem.pf  \
                       /home/rosetta/archive/rosetta3/general/ldmrules.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general limrules
  
  
  
#!!-------------------------strkeyrecdef--------!!  
  
  
  
  
#!! -------------------strtokey-------------------!!  
  
  
  
/home/rosetta/archive/rosetta3/general/strtokey.o : /home/rosetta/archive/rosetta3/general/strtokey.p \
                       /home/rosetta/archive/rosetta3/general/strtokey.pf \
                       /home/rosetta/archive/rosetta3/general/string.pf \
                       /home/rosetta/archive/rosetta3/general/strkeyrecdef.pf \
                       /home/rosetta/archive/rosetta3/general/globdef.pf \
                       /home/rosetta/archive/rosetta3/unix/cisam.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general strtokey
  
#!! -------------------mem-------------------!!  
  
  
  
/home/rosetta/archive/rosetta3/general/mem.o : /home/rosetta/archive/rosetta3/general/mem.p \
                  /home/rosetta/archive/rosetta3/general/mem.pf \
                  /home/rosetta/archive/rosetta3/general/log.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general mem
  
#!! -------------------awhere-------------------!!  
  
  
  
/home/rosetta/archive/rosetta3/general/awhere.o : /home/rosetta/archive/rosetta3/general/awhere.p \
                  /home/rosetta/archive/rosetta3/general/awhere.pf \
                  /home/rosetta/archive/rosetta3/general/wnd.pf \
                  /home/rosetta/archive/rosetta3/Xw/Xid.h \
                  /home/rosetta/archive/rosetta3/Xw/Sid.h \
                  /home/rosetta/archive/rosetta3/general/globdef.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general awhere
  
  
  
#!! -------------------gwhere-------------------!!  
  
  
  
/home/rosetta/archive/rosetta3/general/gwhere.o : /home/rosetta/archive/rosetta3/general/gwhere.p \
                  /home/rosetta/archive/rosetta3/general/gwhere.pf \
                  /home/rosetta/archive/rosetta3/general/wnd.pf \
                  /home/rosetta/archive/rosetta3/Xw/Xid.h \
                  /home/rosetta/archive/rosetta3/Xw/Sid.h \
                  /home/rosetta/archive/rosetta3/general/globdef.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general gwhere
  
  
  
#!! -------------------batch-------------------!!  
  
  
  
/home/rosetta/archive/rosetta3/general/batch.o : /home/rosetta/archive/rosetta3/general/batch.p \
                  /home/rosetta/archive/rosetta3/general/batch.pf \
                  /home/rosetta/archive/rosetta3/general/files.pf \
                  /home/rosetta/archive/rosetta3/unix/globbuf.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general batch
  
  
  
#!! -------------------help-------------------!!  
  
  
  
/home/rosetta/archive/rosetta3/general/help.o : /home/rosetta/archive/rosetta3/general/help.p \
                   /home/rosetta/archive/rosetta3/general/help.pf \
                   /home/rosetta/archive/rosetta3/general/wnd.pf \
                   /home/rosetta/archive/rosetta3/Xw/Xid.h \
                   /home/rosetta/archive/rosetta3/Xw/Sid.h \
                   /home/rosetta/archive/rosetta3/general/globdef.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general help
  
  
  
#!!!!!!!!!!!!!!!!!!!!!!tools: strmkey!!!!!!!!!!!!!!  
  
  
/home/rosetta/archive/rosetta3/tools/strmkey.o : /home/rosetta/archive/rosetta3/tools/strmkey.p \
                    /home/rosetta/archive/rosetta3/general/strtomkey.pf \
                    /home/rosetta/archive/rosetta3/general/liildict.pf \
                    /home/rosetta/archive/rosetta3/general/string.pf \
                    /home/rosetta/archive/rosetta3/general/files.pf \
                    /home/rosetta/archive/rosetta3/unix/cisam.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools strmkey
  
  
#!! -------------------strtomkey-------------------!!  
  
  
  
/home/rosetta/archive/rosetta3/general/strtomkey.o : /home/rosetta/archive/rosetta3/general/strtomkey.p \
                       /home/rosetta/archive/rosetta3/general/strtomkey.pf \
                       /home/rosetta/archive/rosetta3/general/string.pf \
                       /home/rosetta/archive/rosetta3/general/liildict.pf \
                       /home/rosetta/archive/rosetta3/general/globdef.pf \
                       /home/rosetta/archive/rosetta3/unix/cisam.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general strtomkey
  
#!! -------------------config-------------------!!  
  
  
  
/home/rosetta/archive/rosetta3/general/config.o : /home/rosetta/archive/rosetta3/general/config.p \
                     /home/rosetta/archive/rosetta3/general/config.pf \
                     /home/rosetta/archive/rosetta3/general/str.pf \
                     /home/rosetta/archive/rosetta3/general/files.pf \
                     /home/rosetta/archive/rosetta3/general/globdef.pf \
                     /home/rosetta/archive/rosetta3/general/log.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general config
  
  
  
  
#!!------------------linearizer---------------------------  
  
  
/home/rosetta/archive/rosetta3/general/linearizer.o : /home/rosetta/archive/rosetta3/general/linearizer.p \
                      /home/rosetta/archive/rosetta3/general/linearizer.pf \
                      /home/rosetta/archive/rosetta3/general/interfaces.pf \
                      /home/rosetta/archive/rosetta3/general/interface6.pf \
                      /home/rosetta/archive/rosetta3/general/interface7.pf \
                      /home/rosetta/archive/rosetta3/general/listree.pf  \
                      /home/rosetta/archive/rosetta3/general/debug.pf  \
                      /home/rosetta/archive/rosetta3/general/error.pf  \
                      /home/rosetta/archive/rosetta3/general/log.pf  \
                      /home/rosetta/archive/rosetta3/general/ldcatsets.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general linearizer
  
  
  
#!!------------------mparser---------------------------  
  
  
/home/rosetta/archive/rosetta3/general/mparser.o : /home/rosetta/archive/rosetta3/general/mparser.p \
                      /home/rosetta/archive/rosetta3/general/mparser.pf \
                      /home/rosetta/archive/rosetta3/general/interfaces.pf \
                      /home/rosetta/archive/rosetta3/general/interface2.pf \
                      /home/rosetta/archive/rosetta3/general/interface3.pf \
                      /home/rosetta/archive/rosetta3/general/listree.pf  \
                      /home/rosetta/archive/rosetta3/general/superdtree.pf  \
                      /home/rosetta/archive/rosetta3/general/ldgetkey.pf  \
                      /home/rosetta/archive/rosetta3/general/ldmrules.pf  \
                      /home/rosetta/archive/rosetta3/general/ldanmrules.pf  \
                      /home/rosetta/archive/rosetta3/general/debug.pf  \
                      /home/rosetta/archive/rosetta3/general/error.pf  \
                      /home/rosetta/archive/rosetta3/general/log.pf  \
                      /home/rosetta/archive/rosetta3/general/mem.pf  \
                      /home/rosetta/archive/rosetta3/general/awhere.pf  \
                      /home/rosetta/archive/rosetta3/general/wnd.pf  \
                      /home/rosetta/archive/rosetta3/Xw/Xid.h \
                      /home/rosetta/archive/rosetta3/Xw/Sid.h \
                      /home/rosetta/archive/rosetta3/general/limrules.pf  \
                      /home/rosetta/archive/rosetta3/general/ldcatsets.pf  \
                      /home/rosetta/archive/rosetta3/general/debugmparser.pf  \
                      /home/rosetta/archive/rosetta3/general/mpstatistics.pf \
                      /home/rosetta/archive/rosetta3/general/globsubst.pf \
                      /home/rosetta/archive/rosetta3/general/drawstree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general mparser
  
  
  
#!!------------------mgenerator---------------------------  
  
  
/home/rosetta/archive/rosetta3/general/mgenerator.o : /home/rosetta/archive/rosetta3/general/mgenerator.p \
                      /home/rosetta/archive/rosetta3/general/mgenerator.pf \
                      /home/rosetta/archive/rosetta3/general/interfaces.pf \
                      /home/rosetta/archive/rosetta3/general/interface5.pf \
                      /home/rosetta/archive/rosetta3/general/interface6.pf \
                      /home/rosetta/archive/rosetta3/general/listree.pf  \
                      /home/rosetta/archive/rosetta3/general/hyperdtree.pf  \
                      /home/rosetta/archive/rosetta3/general/ldgetkey.pf  \
                      /home/rosetta/archive/rosetta3/general/ldmrules.pf  \
                      /home/rosetta/archive/rosetta3/general/ldgenmrules.pf  \
                      /home/rosetta/archive/rosetta3/general/debug.pf  \
                      /home/rosetta/archive/rosetta3/general/error.pf  \
                      /home/rosetta/archive/rosetta3/general/log.pf  \
                      /home/rosetta/archive/rosetta3/general/mem.pf  \
                      /home/rosetta/archive/rosetta3/general/limrules.pf  \
                      /home/rosetta/archive/rosetta3/general/ldblex.pf \
                      /home/rosetta/archive/rosetta3/general/ldsubsttovar.pf \
                      /home/rosetta/archive/rosetta3/general/debugmgenerator.pf \
                      /home/rosetta/archive/rosetta3/general/globsubst.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general mgenerator
  
  
  
#!! --------------module superdtree------------------------------  
  
  
/home/rosetta/archive/rosetta3/general/superdtree.o : /home/rosetta/archive/rosetta3/general/superdtree.p  \
                        /home/rosetta/archive/rosetta3/general/mem.pf  \
                      /home/rosetta/archive/rosetta3/general/superdtree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general superdtree
  
  
  
#!! --------------module hyperdtree------------------------------  
  
  
/home/rosetta/archive/rosetta3/general/hyperdtree.o : /home/rosetta/archive/rosetta3/general/hyperdtree.p  \
                        /home/rosetta/archive/rosetta3/general/mem.pf  \
                      /home/rosetta/archive/rosetta3/general/hyperdtree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general hyperdtree
  
  
  
#!!------------------ldmrules---------------------------  
  
  
/home/rosetta/archive/rosetta3/dutch/ldmrules.o : /home/rosetta/archive/rosetta3/dutch/ldmrules.p \
                           /home/rosetta/archive/rosetta3/general/ldmrules.pf \
                           /home/rosetta/archive/rosetta3/general/limatches.pf \
                           /home/rosetta/archive/rosetta3/general/mem.pf  \
                           /home/rosetta/archive/rosetta3/general/ldconvrec.pf \
                           /home/rosetta/archive/rosetta3/dutch/lsparams.pf \
                           /home/rosetta/archive/rosetta3/general/rectoscreen.pf \
                           /home/rosetta/archive/rosetta3/dutch/lstypetostr.pf \
                           /home/rosetta/archive/rosetta3/general/globdef.pf \
                           /home/rosetta/archive/rosetta3/general/windows.pf \
                           /home/rosetta/archive/rosetta3/dutch/lsmruquo.pf \
                           /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf \
                           /home/rosetta/archive/rosetta3/general/ldsubgrammars.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldmrules
  
  
#!! above mrules107 and mrules117 contain idiom rules, all such files should be added.  
#!! in general:rene.mms these files are also handled somewhat differently  
  
#!!------------------ldanmrules---------------------------  
  
  
/home/rosetta/archive/rosetta3/dutch/ldanmrules.o : /home/rosetta/archive/rosetta3/dutch/ldanmrules.p \
                           /home/rosetta/archive/rosetta3/general/ldanmrules.pf \
                           /home/rosetta/archive/rosetta3/general/ldmrules.pf \
                           /home/rosetta/archive/rosetta3/general/mem.pf  \
                           /home/rosetta/archive/rosetta3/general/limatches.pf \
                           /home/rosetta/archive/rosetta3/general/listree.pf \
                           /home/rosetta/archive/rosetta3/general/lidomaint.pf \
                           /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf \
                           /home/rosetta/archive/rosetta3/dutch/lsparams.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldanmrules
  
#! i left out dependencies of decommrulesi.pf, i=1..50, because   
#! already ldanmrules.p is taken to depend on these.  
  
  
  
#!!------------------ldgenmrules---------------------------  
  
  
/home/rosetta/archive/rosetta3/dutch/ldgenmrules.o : /home/rosetta/archive/rosetta3/dutch/ldgenmrules.p \
                           /home/rosetta/archive/rosetta3/general/ldgenmrules.pf \
                           /home/rosetta/archive/rosetta3/general/ldmrules.pf \
                           /home/rosetta/archive/rosetta3/general/listree.pf \
                           /home/rosetta/archive/rosetta3/general/lidomaint.pf \
                           /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf \
                           /home/rosetta/archive/rosetta3/dutch/lsparams.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldgenmrules
  
#! i left out dependencies of commrulesi.pf, i=1..50, because   
#! already ldgenmrules.p is taken to depend on these.  
  
  
  
#!!!!!!!!!!!!!!!!!!!interfaces!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
  
#!!!!!!!!!!!!!!!!!!!interface0!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
/home/rosetta/archive/rosetta3/general/interface0.o : /home/rosetta/archive/rosetta3/general/interface0.p \
                         /home/rosetta/archive/rosetta3/general/interface0.pf \
                         /home/rosetta/archive/rosetta3/general/mem.pf  \
                         /home/rosetta/archive/rosetta3/general/string.pf \
                         /home/rosetta/archive/rosetta3/general/limorfdef.pf \
                         /home/rosetta/archive/rosetta3/general/interface1.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general interface0
  
  
  
#!!!!!!!!!!!!!!!!!!!interface1!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
/home/rosetta/archive/rosetta3/general/interface1.o : /home/rosetta/archive/rosetta3/general/interface1.p \
                         /home/rosetta/archive/rosetta3/general/interface1.pf \
                         /home/rosetta/archive/rosetta3/general/mem.pf  \
                         /home/rosetta/archive/rosetta3/general/limorfdef.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general interface1
  
  
  
#!!!!!!!!!!!!!!!!!!!interface2!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
  
#!!!!!!!!!!!!!!!!!!!interface3!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
  
#!!!!!!!!!!!!!!!!!!!interface4!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
  
#!!!!!!!!!!!!!!!!!!!interface5!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
  
#!!!!!!!!!!!!!!!!!!!interface6!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
  
#!!!!!!!!!!!!!!!!!!!interface7!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
/home/rosetta/archive/rosetta3/general/interface7.o : /home/rosetta/archive/rosetta3/general/interface7.p \
                         /home/rosetta/archive/rosetta3/general/interface7.pf \
                         /home/rosetta/archive/rosetta3/general/mem.pf  \
                         /home/rosetta/archive/rosetta3/general/interface1.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general interface7
  
  
  
#!!!!!!!!!!!!!!!!!!!interface8!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
/home/rosetta/archive/rosetta3/general/interface8.o : /home/rosetta/archive/rosetta3/general/interface8.p \
                         /home/rosetta/archive/rosetta3/general/interface8.pf \
                         /home/rosetta/archive/rosetta3/general/string.pf \
                         /home/rosetta/archive/rosetta3/general/mem.pf  \
                         /home/rosetta/archive/rosetta3/general/limorfdef.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general interface8
  
  
  
#!!!!!!!!!!!!!!!!!!!interface1to7!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
general/target/interface1to7.o : general/target/interface1to7.p \
                            general/target/interface1to7.pf \
                            /home/rosetta/archive/rosetta3/general/interfaces.pf \
                            /home/rosetta/archive/rosetta3/general/interface7.pf \
                            /home/rosetta/archive/rosetta3/general/interface1.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general interface1to7
  
  
#!!!!!!!!!!!!!!!!!!!interface2to6!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
general/target/interface2to6.o : general/target/interface2to6.p \
                            general/target/interface2to6.pf \
                            /home/rosetta/archive/rosetta3/general/interfaces.pf \
                            /home/rosetta/archive/rosetta3/general/interface6.pf \
                            /home/rosetta/archive/rosetta3/general/interface2.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general interface2to6
  
  
#!!!!!!!!!!!!!!!!!!!interface3to5!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
general/target/interface3to5.o : general/target/interface3to5.p \
                            general/target/interface3to5.pf \
                            /home/rosetta/archive/rosetta3/general/interfaces.pf \
                            /home/rosetta/archive/rosetta3/general/interface5.pf \
                            /home/rosetta/archive/rosetta3/general/interface3.pf \
                            /home/rosetta/archive/rosetta3/general/hyperdtree.pf \
                            /home/rosetta/archive/rosetta3/general/superdtree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general interface3to5
  
  
#!!!!!!!!!!!!!!!!!!!interface4to4!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
general/target/interface4to4.o : general/target/interface4to4.p \
                            general/target/interface4to4.pf \
                            /home/rosetta/archive/rosetta3/general/interfaces.pf \
                            /home/rosetta/archive/rosetta3/general/interface4.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general interface4to4
  
  
#!!!!!!!!!!!-----------------printerf------------------------------  
  
  
/home/rosetta/archive/rosetta3/general/printerf.o : /home/rosetta/archive/rosetta3/general/printerf.p \
                       /home/rosetta/archive/rosetta3/general/printerf.pf \
                       /home/rosetta/archive/rosetta3/general/printerf1.pf \
                       /home/rosetta/archive/rosetta3/general/printerf2.pf  \
                       /home/rosetta/archive/rosetta3/general/printerf3.pf  \
                       /home/rosetta/archive/rosetta3/general/printerf4.pf  \
                       /home/rosetta/archive/rosetta3/general/printerf5.pf  \
                       /home/rosetta/archive/rosetta3/general/printerf6.pf  \
                       /home/rosetta/archive/rosetta3/general/printerf7.pf \
                       /home/rosetta/archive/rosetta3/general/wnd.pf \
                       /home/rosetta/archive/rosetta3/Xw/Xid.h \
                       /home/rosetta/archive/rosetta3/Xw/Sid.h \
                       /home/rosetta/archive/rosetta3/general/interfaces.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general printerf
  
  
  
#!!!!!!!!!!!-----------------printerf1------------------------------  
  
  
/home/rosetta/archive/rosetta3/general/printerf1.o : /home/rosetta/archive/rosetta3/general/printerf1.p \
                        /home/rosetta/archive/rosetta3/general/printerf1.pf \
                        /home/rosetta/archive/rosetta3/general/drawstree.pf \
                        /home/rosetta/archive/rosetta3/general/interface1.pf \
                        /home/rosetta/archive/rosetta3/general/interfaces.pf \
                        /home/rosetta/archive/rosetta3/general/wnd.pf \
                        /home/rosetta/archive/rosetta3/Xw/Xid.h \
                        /home/rosetta/archive/rosetta3/Xw/Sid.h \
                        /home/rosetta/archive/rosetta3/general/globdef.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general printerf1
  
  
  
#!!!!!!!!!!!-----------------printerf2------------------------------  
  
  
/home/rosetta/archive/rosetta3/general/printerf2.o : /home/rosetta/archive/rosetta3/general/printerf2.p \
                        /home/rosetta/archive/rosetta3/general/printerf2.pf \
                        /home/rosetta/archive/rosetta3/general/drawstree.pf \
                        /home/rosetta/archive/rosetta3/general/listree.pf  \
                        /home/rosetta/archive/rosetta3/general/interface2.pf \
                        /home/rosetta/archive/rosetta3/general/interfaces.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general printerf2
  
  
  
#!!!!!!!!!!!-----------------printerf3------------------------------  
  
  
/home/rosetta/archive/rosetta3/general/printerf3.o : /home/rosetta/archive/rosetta3/general/printerf3.p \
                        /home/rosetta/archive/rosetta3/general/printerf3.pf \
                        /home/rosetta/archive/rosetta3/general/drawsuperdtree.pf \
                        /home/rosetta/archive/rosetta3/general/interface3.pf \
                        /home/rosetta/archive/rosetta3/general/interfaces.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general printerf3
  
  
  
#!!!!!!!!!!!-----------------printerf4------------------------------  
  
  
/home/rosetta/archive/rosetta3/general/printerf4.o : /home/rosetta/archive/rosetta3/general/printerf4.p \
                        /home/rosetta/archive/rosetta3/general/printerf4.pf \
                        /home/rosetta/archive/rosetta3/general/drawhiltree.pf \
                        /home/rosetta/archive/rosetta3/general/interface4.pf \
                        /home/rosetta/archive/rosetta3/general/interfaces.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general printerf4
  
  
  
#!!!!!!!!!!!-----------------printerf5------------------------------  
  
  
/home/rosetta/archive/rosetta3/general/printerf5.o : /home/rosetta/archive/rosetta3/general/printerf5.p \
                        /home/rosetta/archive/rosetta3/general/printerf5.pf \
                        /home/rosetta/archive/rosetta3/general/drawhyperdtree.pf \
                        /home/rosetta/archive/rosetta3/general/interface5.pf \
                        /home/rosetta/archive/rosetta3/general/interfaces.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general printerf5
  
  
  
#!!!!!!!!!!!-----------------printerf6------------------------------  
  
  
/home/rosetta/archive/rosetta3/general/printerf6.o : /home/rosetta/archive/rosetta3/general/printerf6.p \
                        /home/rosetta/archive/rosetta3/general/printerf6.pf \
                        /home/rosetta/archive/rosetta3/general/drawstree.pf \
                        /home/rosetta/archive/rosetta3/general/interface6.pf \
                        /home/rosetta/archive/rosetta3/general/interfaces.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general printerf6
  
  
  
#!!!!!!!!!!!-----------------printerf7------------------------------  
  
  
/home/rosetta/archive/rosetta3/general/printerf7.o : /home/rosetta/archive/rosetta3/general/printerf7.p \
                        /home/rosetta/archive/rosetta3/general/printerf7.pf \
                        /home/rosetta/archive/rosetta3/general/drawstree.pf \
                        /home/rosetta/archive/rosetta3/general/interface7.pf \
                        /home/rosetta/archive/rosetta3/general/interfaces.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general printerf7
  
  
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!error!!!!!!!!!!!!!!!!!!!  
  
  
/home/rosetta/archive/rosetta3/general/error.o : /home/rosetta/archive/rosetta3/general/error.p \
                    /home/rosetta/archive/rosetta3/general/error.pf \
                    /home/rosetta/archive/rosetta3/general/globdef.pf \
                    /home/rosetta/archive/rosetta3/general/string.pf \
                    /home/rosetta/archive/rosetta3/general/wnd.pf \
                    /home/rosetta/archive/rosetta3/Xw/Xid.h \
                    /home/rosetta/archive/rosetta3/Xw/Sid.h;
	@/home/rosetta/archive/rosetta3/actions/pas general error
  
  
#!!!!!!!!!!!-----------------debug------------------------------  
  
  
/home/rosetta/archive/rosetta3/general/debug.o : /home/rosetta/archive/rosetta3/general/debug.p \
                    /home/rosetta/archive/rosetta3/general/debug.pf \
                    /home/rosetta/archive/rosetta3/general/globdef.pf \
                    /home/rosetta/archive/rosetta3/general/string.pf \
                    /home/rosetta/archive/rosetta3/general/wnd.pf \
                    /home/rosetta/archive/rosetta3/Xw/Xid.h \
                    /home/rosetta/archive/rosetta3/Xw/Sid.h;
	@/home/rosetta/archive/rosetta3/actions/pas general debug
  
  
  
#!!!!!!!!!!!!!!!!!!!prproc!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
dutch/target/prproc.o : dutch/target/prproc.p \
                         general/target/prproc.pf \
                         /home/rosetta/archive/rosetta3/general/listree.pf \
                         /home/rosetta/archive/rosetta3/general/lsstree.pf \
                         /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) prproc
  
  
  
#!!!!!!!!!!!!!!!!!!!!!!!!!!!drawsuperdtree!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
/home/rosetta/archive/rosetta3/general/drawsuperdtree.o : /home/rosetta/archive/rosetta3/general/drawsuperdtree.p \
                        /home/rosetta/archive/rosetta3/general/drawsuperdtree.pf \
                        /home/rosetta/archive/rosetta3/general/drawtree.pf \
                        /home/rosetta/archive/rosetta3/general/oldtree.pf \
                        /home/rosetta/archive/rosetta3/general/mem.pf  \
                        /home/rosetta/archive/rosetta3/general/globdef.pf \
                        /home/rosetta/archive/rosetta3/general/superdtree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general drawsuperdtree
  
  
  
#!!!!!!!!!!!!!!!!!!!!!!!!!!!drawhyperdtree!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
/home/rosetta/archive/rosetta3/general/drawhyperdtree.o : /home/rosetta/archive/rosetta3/general/drawhyperdtree.p \
                        /home/rosetta/archive/rosetta3/general/drawhyperdtree.pf \
                        /home/rosetta/archive/rosetta3/general/drawtree.pf \
                        /home/rosetta/archive/rosetta3/general/mem.pf  \
                        /home/rosetta/archive/rosetta3/general/oldtree.pf \
                        /home/rosetta/archive/rosetta3/general/globdef.pf \
                        /home/rosetta/archive/rosetta3/general/hyperdtree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general drawhyperdtree
  
  
  
#!!!!!!!!!!!!!!!!!!!!!!!!!!!drawhiltree!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
/home/rosetta/archive/rosetta3/general/drawhiltree.o : /home/rosetta/archive/rosetta3/general/drawhiltree.p  \
                          /home/rosetta/archive/rosetta3/general/oldtree.pf   \
   			/home/rosetta/archive/rosetta3/general/drawtree.pf   \
			/home/rosetta/archive/rosetta3/general/drawhiltree.pf  \
			/home/rosetta/archive/rosetta3/general/hiltree.pf  \
  			/home/rosetta/archive/rosetta3/general/globdef.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general drawhiltree
  
  
  
#!!------------------debugmparser---------------------------  
  
  
/home/rosetta/archive/rosetta3/general/debugmparser.o : /home/rosetta/archive/rosetta3/general/debugmparser.p \
                      /home/rosetta/archive/rosetta3/general/debugmparser.pf \
                      /home/rosetta/archive/rosetta3/general/listree.pf  \
                      /home/rosetta/archive/rosetta3/general/ldmrules.pf  \
                      /home/rosetta/archive/rosetta3/general/drawstree.pf  \
                      /home/rosetta/archive/rosetta3/general/drawtreeset.pf  \
                      /home/rosetta/archive/rosetta3/general/error.pf  \
                      /home/rosetta/archive/rosetta3/general/loop.pf  \
                      /home/rosetta/archive/rosetta3/general/wnd.pf  \
                      /home/rosetta/archive/rosetta3/Xw/Xid.h  \
                      /home/rosetta/archive/rosetta3/Xw/Sid.h  \
                      /home/rosetta/archive/rosetta3/general/globdef.pf  \
                      /home/rosetta/archive/rosetta3/general/string.pf \
                      /home/rosetta/archive/rosetta3/general/str.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general debugmparser
  
  
#!!------------------debugmgenerator---------------------------  
  
  
/home/rosetta/archive/rosetta3/general/debugmgenerator.o : /home/rosetta/archive/rosetta3/general/debugmgenerator.p \
                      /home/rosetta/archive/rosetta3/general/debugmgenerator.pf \
                      /home/rosetta/archive/rosetta3/general/listree.pf  \
                      /home/rosetta/archive/rosetta3/general/ldmrules.pf  \
                      /home/rosetta/archive/rosetta3/general/drawtreeset.pf  \
                      /home/rosetta/archive/rosetta3/general/error.pf  \
                      /home/rosetta/archive/rosetta3/general/loop.pf  \
                      /home/rosetta/archive/rosetta3/general/wnd.pf  \
                      /home/rosetta/archive/rosetta3/Xw/Xid.h  \
                      /home/rosetta/archive/rosetta3/Xw/Sid.h  \
                      /home/rosetta/archive/rosetta3/general/globdef.pf  \
                      /home/rosetta/archive/rosetta3/general/string.pf \
                      /home/rosetta/archive/rosetta3/general/str.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general debugmgenerator
  
  
#!!------------------mpstatistics---------------------------  
  
  
/home/rosetta/archive/rosetta3/general/mpstatistics.o : /home/rosetta/archive/rosetta3/general/mpstatistics.p \
                      /home/rosetta/archive/rosetta3/general/mpstatistics.pf \
                      /home/rosetta/archive/rosetta3/general/wnd.pf  \
                      /home/rosetta/archive/rosetta3/Xw/Xid.h  \
                      /home/rosetta/archive/rosetta3/Xw/Sid.h  \
                      /home/rosetta/archive/rosetta3/general/globdef.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general mpstatistics
  
  
#!!------------------globsubst---------------------------  
  
  
/home/rosetta/archive/rosetta3/general/globsubst.o : /home/rosetta/archive/rosetta3/general/globsubst.p \
                      /home/rosetta/archive/rosetta3/general/globsubst.pf \
                      /home/rosetta/archive/rosetta3/general/listree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general globsubst
  
  
  
/home/rosetta/archive/rosetta3/general/aidderiv.o : /home/rosetta/archive/rosetta3/general/aidderiv.p  \
                      /home/rosetta/archive/rosetta3/general/aidderiv.pf  \
                      /home/rosetta/archive/rosetta3/general/mparser.o;
	@/home/rosetta/archive/rosetta3/actions/pas general aidderiv
  
  
  
/home/rosetta/archive/rosetta3/general/gidderiv.o : /home/rosetta/archive/rosetta3/general/gidderiv.p  \
                      /home/rosetta/archive/rosetta3/general/gidderiv.pf  \
                      /home/rosetta/archive/rosetta3/general/mgenerator.o;
	@/home/rosetta/archive/rosetta3/actions/pas general gidderiv
  
  
  
  
/home/rosetta/archive/rosetta3/dutch/ldsubgrammars.o : /home/rosetta/archive/rosetta3/dutch/ldsubgrammars.p \
                           /home/rosetta/archive/rosetta3/general/ldsubgrammars.pf  \
                           /home/rosetta/archive/rosetta3/dutch/helpsubgrammars.pf  \
                           /home/rosetta/archive/rosetta3/general/ldmrules.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldsubgrammars
  
  
  
  
/home/rosetta/archive/rosetta3/dutch/helpsubgrammars.o : /home/rosetta/archive/rosetta3/dutch/helpsubgrammars.p \
                           /home/rosetta/archive/rosetta3/dutch/helpsubgrammars.pf  \
                           /home/rosetta/archive/rosetta3/general/ldmrules.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) helpsubgrammars
  
  
  
  
# -----------generation of the modules lsparams,ldmrules,ldanmrules ldgenmrules and---  
# ---------- ldsubgrammars the sources are really commrules"i".env, but are taken to be----  
# ---------- the .pf versions of these so that these files need not be -----  
# ---------- repeated as sources of ldgenmrules.obj, ldmrules.obj, ldanmrules.obj--  
  
  
  
  
#--removed from dependencies of decommrulesa.opt:  general:limatches.opt  
#                                                  general:strtokey.opt  
  
  
  
  
#--removed from dependencies of commrulesa.opt:  general:limatches.opt  
#                                                general:strtokey.opt  
  
  
  
#!!_________module lsmruquo, pascal procedures for mrules-------------  
  
  
/home/rosetta/archive/rosetta3/dutch/lsmruquo.o : /home/rosetta/archive/rosetta3/dutch/lsmruquo.p  \
                           /home/rosetta/archive/rosetta3/dutch/lsmruquo.pf  \
                        /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf  \
                        /home/rosetta/archive/rosetta3/general/lsstree.pf  \
                        /home/rosetta/archive/rosetta3/dutch/maket.pf  \
                        /home/rosetta/archive/rosetta3/dutch/lsauxdom.pf  \
                        /home/rosetta/archive/rosetta3/general/ldcatsets.pf \
                        /home/rosetta/archive/rosetta3/general/strtokey.pf \
                        /home/rosetta/archive/rosetta3/dutch/copyt.pf  \
                        /home/rosetta/archive/rosetta3/general/ldgetkey.pf  \
                        /home/rosetta/archive/rosetta3/general/liiddict.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) lsmruquo
  
  
  
#!!_________module lsmatches, limatches, matching functions for mrules-------------  
  
  
/home/rosetta/archive/rosetta3/dutch/lsmatches.o : /home/rosetta/archive/rosetta3/general/lsmatches.p  \
                         /home/rosetta/archive/rosetta3/general/lsmatches.pf  \
                         /home/rosetta/archive/rosetta3/dutch/lsmruquo.pf  \
                         /home/rosetta/archive/rosetta3/general/lsstree.pf  \
                         /home/rosetta/archive/rosetta3/general/string.pf  \
                         /home/rosetta/archive/rosetta3/general/strtokey.pf  \
                         /home/rosetta/archive/rosetta3/general/ldmeasuresize.pf  \
                         /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf  \
                         /home/rosetta/archive/rosetta3/general/limatches.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general lsmatches $(language)
  
  
  
/home/rosetta/archive/rosetta3/general/limatches.o : /home/rosetta/archive/rosetta3/general/limatches.p  \
                        /home/rosetta/archive/rosetta3/general/limatches.pf  \
                        /home/rosetta/archive/rosetta3/general/lidomaint.pf  \
                        /home/rosetta/archive/rosetta3/general/lisiddict.pf  \
                        /home/rosetta/archive/rosetta3/general/liiddict.pf  \
                        /home/rosetta/archive/rosetta3/general/listree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general limatches
  
  
  
#!!------------------modules mrules-----------------------  
  
  
  
  
  
#!!------------------modules mrules-----------------------  
  
#---removed from dependencies of neededinmrules.opt:  
#                            general:gidderiv.opt, -  
#                            general:aidderiv.opt, -  
#                            $(language):lsmatches.opt, -  
#                            general:strtokey.opt, -  
#                            $(language):ldblex.opt, -  
#                            general:limatches.opt, -  
  
  
  
  
# waarom staat hier het rijtje van lisdict tot en met ldblex????  
  
/home/rosetta/archive/rosetta3/general/analysis.o : /home/rosetta/archive/rosetta3/general/analysis.p \
                       /home/rosetta/archive/rosetta3/general/awhere.pf \
                       /home/rosetta/archive/rosetta3/general/help.pf \
                       /home/rosetta/archive/rosetta3/unix/mb.pf \
                       /home/rosetta/archive/rosetta3/unix/pc.pf \
                       /home/rosetta/archive/rosetta3/unix/sockipc.pf \
                       /home/rosetta/archive/rosetta3/unix/globbuf.pf \
                       /home/rosetta/archive/rosetta3/general/log.pf \
                       /home/rosetta/archive/rosetta3/general/mem.pf \
                       /home/rosetta/archive/rosetta3/general/string.pf \
                       /home/rosetta/archive/rosetta3/general/config.pf \
                       /home/rosetta/archive/rosetta3/general/asegmrules.pf \
                       /home/rosetta/archive/rosetta3/general/wnd.pf \
                       /home/rosetta/archive/rosetta3/Xw/Xid.h \
                       /home/rosetta/archive/rosetta3/Xw/Sid.h \
                       /home/rosetta/archive/rosetta3/general/liiddict.pf \
                       /home/rosetta/archive/rosetta3/general/liildict.pf \
                       /home/rosetta/archive/rosetta3/general/lisdict.pf \
                       /home/rosetta/archive/rosetta3/general/lisiddict.pf \
                       /home/rosetta/archive/rosetta3/general/logname.pf \
                       /home/rosetta/archive/rosetta3/general/level.pf \
                       /home/rosetta/archive/rosetta3/general/lastactive.pf \
                       /home/rosetta/archive/rosetta3/general/interfaces.pf \
                       /home/rosetta/archive/rosetta3/general/strtokey.pf \
                       /home/rosetta/archive/rosetta3/general/strtomkey.pf \
                       /home/rosetta/archive/rosetta3/general/lifixiddict.pf \
                       /home/rosetta/archive/rosetta3/general/ldmdict.pf \
                       /home/rosetta/archive/rosetta3/general/ldblex.pf \
                       /home/rosetta/archive/rosetta3/general/printerf.pf \
                       /home/rosetta/archive/rosetta3/general/debug.pf \
                       /home/rosetta/archive/rosetta3/general/drawstree.pf \
                       /home/rosetta/archive/rosetta3/general/alayout.pf \
                       /home/rosetta/archive/rosetta3/general/amorph.pf \
                       /home/rosetta/archive/rosetta3/general/globdef.pf \
                       /home/rosetta/archive/rosetta3/general/surfparser.pf  \
                       /home/rosetta/archive/rosetta3/general/mparser.pf  \
                       /home/rosetta/archive/rosetta3/general/debugmparser.pf  \
                       /home/rosetta/archive/rosetta3/general/ldsucc.pf  \
                       /home/rosetta/archive/rosetta3/general/limrules.pf  \
                       /home/rosetta/archive/rosetta3/general/ldmrules.pf \
                       /home/rosetta/archive/rosetta3/general/ldanmrules.pf \
                       /home/rosetta/archive/rosetta3/general/atransfer.pf \
                       /home/rosetta/archive/rosetta3/general/drawtree.pf  \
                       /home/rosetta/archive/rosetta3/general/oldtree.pf  \
                       /home/rosetta/archive/rosetta3/general/loop.pf  \
                       /home/rosetta/archive/rosetta3/general/hiltree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general analysis
  
#!!!!!!!!!!!!!!!!!  
  
  
  
/home/rosetta/archive/rosetta3/general/globdef.o : /home/rosetta/archive/rosetta3/general/globdef.p \
                      /home/rosetta/archive/rosetta3/general/globdef.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general globdef
  
#!!!  
  
  
/home/rosetta/archive/rosetta3/general/alayout.o : /home/rosetta/archive/rosetta3/general/alayout.p \
                     /home/rosetta/archive/rosetta3/general/alayout.pf \
                     /home/rosetta/archive/rosetta3/general/string.pf \
                     /home/rosetta/archive/rosetta3/general/help.pf \
                     /home/rosetta/archive/rosetta3/general/str.pf \
                     /home/rosetta/archive/rosetta3/unix/globbuf.pf \
                     /home/rosetta/archive/rosetta3/general/globdef.pf \
                     /home/rosetta/archive/rosetta3/general/wnd.pf \
                     /home/rosetta/archive/rosetta3/Xw/Xid.h \
                     /home/rosetta/archive/rosetta3/Xw/Sid.h \
                     /home/rosetta/archive/rosetta3/general/interface0.pf \
                     /home/rosetta/archive/rosetta3/general/interfaces.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general alayout
  
  
  
  
#!! the dependencies of this component   
  
#!!  
  
  
# waarom staat hier het rijtje van lisdict tot en met ldblex????  
  
/home/rosetta/archive/rosetta3/general/generation.o : /home/rosetta/archive/rosetta3/general/generation.p \
                       /home/rosetta/archive/rosetta3/unix/mb.pf \
                       /home/rosetta/archive/rosetta3/unix/pc.pf \
                       /home/rosetta/archive/rosetta3/unix/sockipc.pf \
                       /home/rosetta/archive/rosetta3/unix/globbuf.pf \
                       /home/rosetta/archive/rosetta3/general/log.pf \
                       /home/rosetta/archive/rosetta3/general/logname.pf \
                       /home/rosetta/archive/rosetta3/general/config.pf \
                       /home/rosetta/archive/rosetta3/general/mem.pf \
                       /home/rosetta/archive/rosetta3/general/gwhere.pf \
                       /home/rosetta/archive/rosetta3/general/string.pf \
                       /home/rosetta/archive/rosetta3/general/gsegmrules.pf \
                       /home/rosetta/archive/rosetta3/general/wnd.pf \
                       /home/rosetta/archive/rosetta3/Xw/Xid.h \
                       /home/rosetta/archive/rosetta3/Xw/Sid.h \
                       /home/rosetta/archive/rosetta3/general/liiddict.pf \
                       /home/rosetta/archive/rosetta3/general/liildict.pf \
                       /home/rosetta/archive/rosetta3/general/lisdict.pf \
                       /home/rosetta/archive/rosetta3/general/lisiddict.pf \
                       /home/rosetta/archive/rosetta3/general/strtokey.pf \
                       /home/rosetta/archive/rosetta3/general/strtomkey.pf \
                       /home/rosetta/archive/rosetta3/general/lifixiddict.pf \
                       /home/rosetta/archive/rosetta3/general/lastactive.pf \
                       /home/rosetta/archive/rosetta3/general/interfaces.pf \
                       /home/rosetta/archive/rosetta3/general/ldmdict.pf \
                       /home/rosetta/archive/rosetta3/general/ldblex.pf \
                       /home/rosetta/archive/rosetta3/general/printerf.pf \
                       /home/rosetta/archive/rosetta3/general/debug.pf \
                       /home/rosetta/archive/rosetta3/general/drawstree.pf \
                       /home/rosetta/archive/rosetta3/general/glayout.pf \
                       /home/rosetta/archive/rosetta3/general/gmorph.pf \
                       /home/rosetta/archive/rosetta3/general/globdef.pf \
                       /home/rosetta/archive/rosetta3/general/linearizer.pf  \
                       /home/rosetta/archive/rosetta3/general/debugmgenerator.pf  \
                       /home/rosetta/archive/rosetta3/general/mgenerator.pf  \
                       /home/rosetta/archive/rosetta3/general/ldsucc.pf  \
                       /home/rosetta/archive/rosetta3/general/limrules.pf  \
                       /home/rosetta/archive/rosetta3/general/ldgenmrules.pf \
                       /home/rosetta/archive/rosetta3/general/ldmrules.pf \
                       /home/rosetta/archive/rosetta3/general/gtransfer.pf \
                       /home/rosetta/archive/rosetta3/general/hiltree.pf  \
                       /home/rosetta/archive/rosetta3/general/drawtree.pf  \
                       /home/rosetta/archive/rosetta3/general/oldtree.pf  \
                       /home/rosetta/archive/rosetta3/general/loop.pf  \
                       /home/rosetta/archive/rosetta3/general/hyperdtree.pf  \
                       /home/rosetta/archive/rosetta3/general/listree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general generation
  
#!!  
  
  
  
#!!  
  
  
general/target/clock.o : general/target/clock.p \
                    general/target/clock.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general clock
  
  
#!!  
  
  
general/target/abort.o : general/target/abort.p \
                    general/target/abort.pf  \
                    /home/rosetta/archive/rosetta3/general/files.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general abort
  
  
#!!  
  
control : /home/rosetta/archive/rosetta3/general/control.exe;
	@ ! no action needed
  
  
  
/home/rosetta/archive/rosetta3/general/control.o : /home/rosetta/archive/rosetta3/general/control.p \
                      /home/rosetta/archive/rosetta3/unix/mb.pf \
                      /home/rosetta/archive/rosetta3/unix/pc.pf \
                      /home/rosetta/archive/rosetta3/unix/sockipc.pf \
                      /home/rosetta/archive/rosetta3/general/log.pf \
                      /home/rosetta/archive/rosetta3/general/interfaces.pf \
                      /home/rosetta/archive/rosetta3/general/logname.pf \
                      /home/rosetta/archive/rosetta3/general/str.pf \
                      /home/rosetta/archive/rosetta3/general/wnd.pf \
                      /home/rosetta/archive/rosetta3/Xw/Xid.h \
                      /home/rosetta/archive/rosetta3/Xw/Sid.h \
                      /home/rosetta/archive/rosetta3/general/globdef.pf \
                      /home/rosetta/archive/rosetta3/general/batch.pf \
                      /home/rosetta/archive/rosetta3/general/level.pf \
                      /home/rosetta/archive/rosetta3/general/lastactive.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general control
  
#!!  
  
  
/home/rosetta/archive/rosetta3/general/files.o : /home/rosetta/archive/rosetta3/general/files.p  \
                    /home/rosetta/archive/rosetta3/general/files.pf  \
                    /home/rosetta/archive/rosetta3/general/string.pf  \
                    /home/rosetta/archive/rosetta3/general/str.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general files
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/general/log.o : /home/rosetta/archive/rosetta3/general/log.p \
                  /home/rosetta/archive/rosetta3/general/log.pf \
                  /home/rosetta/archive/rosetta3/general/files.pf \
                  /home/rosetta/archive/rosetta3/general/globdef.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general log
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/unix/mb.o : /home/rosetta/archive/rosetta3/unix/mb.c \
                 /home/rosetta/archive/rosetta3/unix/mb.h \
                 /home/rosetta/archive/rosetta3/unix/gendef.h \
                 /home/rosetta/archive/rosetta3/unix/logc.h \
		 /home/rosetta/archive/rosetta3/unix/globdef.h \
		 /home/rosetta/archive/rosetta3/unix/sockipc.h \
		 /home/rosetta/archive/rosetta3/unix/paspar.h ;
	@/home/rosetta/archive/rosetta3/actions/c unix mb
  
  
#!!  
  
/home/rosetta/archive/rosetta3/unix/globbuf.o : /home/rosetta/archive/rosetta3/unix/globbuf.c \
                 /home/rosetta/archive/rosetta3/unix/globbuf.h \
		 /home/rosetta/archive/rosetta3/unix/gendef.h \
		 /home/rosetta/archive/rosetta3/unix/logc.h \
		 /home/rosetta/archive/rosetta3/unix/mkkey.h ;
	@/home/rosetta/archive/rosetta3/actions/c unix globbuf
 
  
  
#!!  
  
/home/rosetta/archive/rosetta3/unix/renamefixid.o : /home/rosetta/archive/rosetta3/unix/renamefixid.c \
                 /home/rosetta/archive/rosetta3/unix/renamefixid.h \
		 /home/rosetta/archive/rosetta3/unix/gendef.h \
		 /home/rosetta/archive/rosetta3/unix/logc.h \
		 /home/rosetta/archive/rosetta3/unix/mkkey.h \
		 /home/rosetta/archive/rosetta3/unix/paspar.h ;
	@/home/rosetta/archive/rosetta3/actions/c unix renamefixid
 
  
  
#!!  
  
/home/rosetta/archive/rosetta3/unix/logc.o : /home/rosetta/archive/rosetta3/unix/logc.c \
              /home/rosetta/archive/rosetta3/unix/logc.h \
              /home/rosetta/archive/rosetta3/unix/gendef.h \
              /home/rosetta/archive/rosetta3/unix/paspar.h ;
	@/home/rosetta/archive/rosetta3/actions/c unix logc
 
  
  
#!!  
  
/home/rosetta/archive/rosetta3/unix/mkkey.o : /home/rosetta/archive/rosetta3/unix/mkkey.c \
              /home/rosetta/archive/rosetta3/unix/mkkey.h \
              /home/rosetta/archive/rosetta3/unix/gendef.h \
              /home/rosetta/archive/rosetta3/unix/logc.h ;
	@/home/rosetta/archive/rosetta3/actions/c unix mkkey
 
  
#!!  
  
/home/rosetta/archive/rosetta3/unix/paspar.o : /home/rosetta/archive/rosetta3/unix/paspar.c \
              /home/rosetta/archive/rosetta3/unix/paspar.h \
              /home/rosetta/archive/rosetta3/unix/gendef.h ;
	@/home/rosetta/archive/rosetta3/actions/c unix paspar
  
#!!  
  
/home/rosetta/archive/rosetta3/unix/wch.o : /home/rosetta/archive/rosetta3/unix/wch.c \
              /home/rosetta/archive/rosetta3/unix/wch.h \
	      /home/rosetta/archive/rosetta3/unix/wchdef.h \
              /home/rosetta/archive/rosetta3/unix/gendef.h \
	      /home/rosetta/archive/rosetta3/unix/logc.h ;
	@/home/rosetta/archive/rosetta3/actions/c unix wch
 
/home/rosetta/archive/rosetta3/unix/wchdef.h : /home/rosetta/archive/rosetta3/unix/wchdef.def ;
	@rm -f $@
	@/home/rosetta/archive/rosetta3/actions/stripdef unix wchdef
  
#!!  
 
/home/rosetta/archive/rosetta3/unix/wipc.o : /home/rosetta/archive/rosetta3/unix/wipc.c \
              /home/rosetta/archive/rosetta3/unix/wipc.h \
              /home/rosetta/archive/rosetta3/unix/sockipc.h \
              /home/rosetta/archive/rosetta3/unix/gendef.h \
	      /home/rosetta/archive/rosetta3/unix/mkkey.h \
	      /home/rosetta/archive/rosetta3/unix/logc.h ;
	@/home/rosetta/archive/rosetta3/actions/c unix wipc
 
  
#!!  
 
/home/rosetta/archive/rosetta3/unix/sockipc.o : /home/rosetta/archive/rosetta3/unix/sockipc.c \
              /home/rosetta/archive/rosetta3/unix/sockipc.h \
              /home/rosetta/archive/rosetta3/unix/gendef.h \
	      /home/rosetta/archive/rosetta3/unix/mkkey.h \
	      /home/rosetta/archive/rosetta3/unix/logc.h ;
	@/home/rosetta/archive/rosetta3/actions/c unix sockipc
 
  
#!!  
  
  
/home/rosetta/archive/rosetta3/unix/pc.o : /home/rosetta/archive/rosetta3/unix/pc.c \
                 /home/rosetta/archive/rosetta3/unix/pc.h \
                 /home/rosetta/archive/rosetta3/unix/gendef.h \
                 /home/rosetta/archive/rosetta3/unix/globdef.h \
                 /home/rosetta/archive/rosetta3/unix/paspar.h \
                 /home/rosetta/archive/rosetta3/unix/logc.h ;
	@/home/rosetta/archive/rosetta3/actions/c unix pc
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/general/str.o : /home/rosetta/archive/rosetta3/general/str.p \
                  /home/rosetta/archive/rosetta3/general/str.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general str
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/general/string.o : /home/rosetta/archive/rosetta3/general/string.p \
                     /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general string
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/general/windows.o : /home/rosetta/archive/rosetta3/general/windows.p  \
                      /home/rosetta/archive/rosetta3/general/wnd.pf  \
                      /home/rosetta/archive/rosetta3/Xw/Xid.h  \
                      /home/rosetta/archive/rosetta3/Xw/Sid.h  \
                      /home/rosetta/archive/rosetta3/general/string.pf  \
                      /home/rosetta/archive/rosetta3/general/str.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general windows
 
 
/home/rosetta/archive/rosetta3/general/wnd.o : /home/rosetta/archive/rosetta3/general/wnd.p  \
                /home/rosetta/archive/rosetta3/general/wnd.pf \
                /home/rosetta/archive/rosetta3/Xw/Xid.h  \
                /home/rosetta/archive/rosetta3/Xw/Sid.h  \
                /home/rosetta/archive/rosetta3/unix/wch.pf \
                /home/rosetta/archive/rosetta3/unix/wchdef.h \
                /home/rosetta/archive/rosetta3/unix/logc.pf \
                /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general wnd
  
  
  
/home/rosetta/archive/rosetta3/dutch/ldstrtotype.o : /home/rosetta/archive/rosetta3/dutch/ldstrtotype.p \
                              /home/rosetta/archive/rosetta3/general/ldstrtotype.pf \
                              /home/rosetta/archive/rosetta3/general/limorfdef.pf \
                              /home/rosetta/archive/rosetta3/general/str.pf \
                              /home/rosetta/archive/rosetta3/general/lidomaint.pf \
                              /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldstrtotype $(language) 
  
  
  
#!! --------------module ldtypetostr------------------------------  
  
  
/home/rosetta/archive/rosetta3/dutch/ldtypetostr.o : /home/rosetta/archive/rosetta3/dutch/ldtypetostr.p \
                              /home/rosetta/archive/rosetta3/general/ldtypetostr.pf \
                              /home/rosetta/archive/rosetta3/general/limorfdef.pf \
                              /home/rosetta/archive/rosetta3/general/str.pf \
                              /home/rosetta/archive/rosetta3/general/lidomaint.pf \
                              /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldtypetostr $(language) "/nooptimize"
  
  
  
#!! --------------module ldcatsets------------------------------  
  
  
/home/rosetta/archive/rosetta3/dutch/ldcatsets.o : /home/rosetta/archive/rosetta3/dutch/ldcatsets.p \
                              /home/rosetta/archive/rosetta3/general/ldcatsets.pf \
                              /home/rosetta/archive/rosetta3/general/lidomaint.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldcatsets $(language) "/nooptimize"
  
  
#!! --------------module ldequal------------------------------  
  
  
/home/rosetta/archive/rosetta3/dutch/ldequal.o : /home/rosetta/archive/rosetta3/dutch/ldequal.p \
                              /home/rosetta/archive/rosetta3/general/ldequal.pf \
                              /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf  \
                              /home/rosetta/archive/rosetta3/general/lsstree.pf  \
                              /home/rosetta/archive/rosetta3/general/listree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldequal $(language) "/nooptimize"
  
  
#!!----------------module ldstrtostr--------------------  
  
  
/home/rosetta/archive/rosetta3/dutch/ldstrtostr.o : /home/rosetta/archive/rosetta3/dutch/ldstrtostr.p  \
                             /home/rosetta/archive/rosetta3/general/ldstrtostr.pf  \
                             /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldstrtostr
  
  
#!!-----------------module maket---------------------------  
  
  
/home/rosetta/archive/rosetta3/dutch/maket.o : /home/rosetta/archive/rosetta3/dutch/maket.p  \
                        /home/rosetta/archive/rosetta3/dutch/maket.pf  \
                        /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf  \
                        /home/rosetta/archive/rosetta3/general/mem.pf  \
                        /home/rosetta/archive/rosetta3/general/lsstree.pf  \
                        /home/rosetta/archive/rosetta3/general/listree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) maket
  
  
#!!-----------------module copyt---------------------------  
  
  
/home/rosetta/archive/rosetta3/dutch/copyt.o : /home/rosetta/archive/rosetta3/dutch/copyt.p  \
                        /home/rosetta/archive/rosetta3/dutch/copyt.pf  \
                        /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) copyt
  
  
  
#!! --------------module lidomaint------------------------------  
  
  
  
  
#!! --------------module lsdomaint------------------------------  
  
  
  
  
  
  
  
  
#!! --------------auxiliary domain ------------------------------  
  
  
/home/rosetta/archive/rosetta3/dutch/lsauxdom.o : /home/rosetta/archive/rosetta3/dutch/lsauxdom.p \
                            /home/rosetta/archive/rosetta3/dutch/lsauxdom.pf \
                            /home/rosetta/archive/rosetta3/general/string.pf \
                            /home/rosetta/archive/rosetta3/general/strtokey.pf \
                            /home/rosetta/archive/rosetta3/general/files.pf \
                            /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) lsauxdom
  
  
  
/home/rosetta/archive/rosetta3/dutch/ldsubsttovar.o : /home/rosetta/archive/rosetta3/dutch/ldsubsttovar.p \
                               /home/rosetta/archive/rosetta3/general/listree.pf \
                               /home/rosetta/archive/rosetta3/dutch/maket.pf \
                               /home/rosetta/archive/rosetta3/general/lsstree.pf \
                               /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldsubsttovar
  
  
#!! -------------module limorfdef-------------------------------  
  
  
  
  
#!! -------------module lsmorfdef-------------------------------  
  
  
  
  
#!! --------------module listree------------------------------  
  
  
/home/rosetta/archive/rosetta3/general/listree.o : /home/rosetta/archive/rosetta3/general/listree.p  \
                      /home/rosetta/archive/rosetta3/general/mem.pf  \
                      /home/rosetta/archive/rosetta3/general/listree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general listree
  
  
#!! --------------module lsstree------------------------------  
  
  
  
  
  
#!!------------------modules lexrules-----------------------  
  
  
  
/home/rosetta/archive/rosetta3/dutch/comlexrules1.o : /home/rosetta/archive/rosetta3/dutch/comlexrules1.p  \
                            /home/rosetta/archive/rosetta3/dutch/comlexrules1.pf  \
                            /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf  \
                            /home/rosetta/archive/rosetta3/dutch/maket.pf  \
                            /home/rosetta/archive/rosetta3/dutch/copyt.pf  \
                            /home/rosetta/archive/rosetta3/general/listree.pf  \
                            /home/rosetta/archive/rosetta3/general/ldblex.pf \
                            /home/rosetta/archive/rosetta3/general/strtokey.pf \
                            /home/rosetta/archive/rosetta3/general/lsstree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) comlexrules1
  
/home/rosetta/archive/rosetta3/dutch/decomlexrules1.o : /home/rosetta/archive/rosetta3/dutch/decomlexrules1.p  \
                              /home/rosetta/archive/rosetta3/dutch/decomlexrules1.pf  \
                              /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf  \
                              /home/rosetta/archive/rosetta3/dutch/maket.pf  \
                              /home/rosetta/archive/rosetta3/dutch/copyt.pf  \
                              /home/rosetta/archive/rosetta3/general/listree.pf  \
                              /home/rosetta/archive/rosetta3/general/ldblex.pf \
                              /home/rosetta/archive/rosetta3/general/strtokey.pf \
                              /home/rosetta/archive/rosetta3/general/lsstree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) decomlexrules1
  
  
  
  
  
/home/rosetta/archive/rosetta3/dutch/comlexrules2.o : /home/rosetta/archive/rosetta3/dutch/comlexrules2.p  \
                            /home/rosetta/archive/rosetta3/dutch/comlexrules2.pf  \
                            /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf  \
                            /home/rosetta/archive/rosetta3/dutch/maket.pf  \
                            /home/rosetta/archive/rosetta3/dutch/copyt.pf  \
                            /home/rosetta/archive/rosetta3/general/ldblex.pf \
                            /home/rosetta/archive/rosetta3/general/strtokey.pf \
                            /home/rosetta/archive/rosetta3/general/listree.pf  \
                            /home/rosetta/archive/rosetta3/general/lsstree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) comlexrules2
  
/home/rosetta/archive/rosetta3/dutch/decomlexrules2.o : /home/rosetta/archive/rosetta3/dutch/decomlexrules2.p  \
                              /home/rosetta/archive/rosetta3/dutch/decomlexrules2.pf  \
                              /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf  \
                              /home/rosetta/archive/rosetta3/dutch/maket.pf  \
                              /home/rosetta/archive/rosetta3/dutch/copyt.pf  \
                              /home/rosetta/archive/rosetta3/general/ldblex.pf \
                              /home/rosetta/archive/rosetta3/general/strtokey.pf \
                              /home/rosetta/archive/rosetta3/general/listree.pf  \
                              /home/rosetta/archive/rosetta3/general/lsstree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) decomlexrules2
  
  
  
  
  
/home/rosetta/archive/rosetta3/dutch/comlexrules3.o : /home/rosetta/archive/rosetta3/dutch/comlexrules3.p  \
                            /home/rosetta/archive/rosetta3/dutch/comlexrules3.pf  \
                            /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf  \
                            /home/rosetta/archive/rosetta3/dutch/maket.pf  \
                            /home/rosetta/archive/rosetta3/dutch/copyt.pf  \
                            /home/rosetta/archive/rosetta3/general/ldblex.pf \
                            /home/rosetta/archive/rosetta3/general/strtokey.pf \
                            /home/rosetta/archive/rosetta3/general/listree.pf  \
                            /home/rosetta/archive/rosetta3/general/lsstree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) comlexrules3
  
/home/rosetta/archive/rosetta3/dutch/decomlexrules3.o : /home/rosetta/archive/rosetta3/dutch/decomlexrules3.p  \
                              /home/rosetta/archive/rosetta3/dutch/decomlexrules3.pf  \
                              /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf  \
                              /home/rosetta/archive/rosetta3/dutch/maket.pf  \
                              /home/rosetta/archive/rosetta3/general/ldblex.pf \
                              /home/rosetta/archive/rosetta3/general/strtokey.pf \
                              /home/rosetta/archive/rosetta3/dutch/copyt.pf  \
                              /home/rosetta/archive/rosetta3/general/listree.pf  \
                              /home/rosetta/archive/rosetta3/general/lsstree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) decomlexrules3
  
  
  
# -------------------modules anlexif and genlexif----------------------  
  
  
  
/home/rosetta/archive/rosetta3/dutch/anlexif.o : /home/rosetta/archive/rosetta3/dutch/anlexif.p  \
                      /home/rosetta/archive/rosetta3/general/anlexif.pf  \
                      /home/rosetta/archive/rosetta3/general/mem.pf  \
                      /home/rosetta/archive/rosetta3/dutch/comlexrules1.pf  \
                      /home/rosetta/archive/rosetta3/dutch/comlexrules2.pf  \
                      /home/rosetta/archive/rosetta3/dutch/comlexrules3.pf  \
                      /home/rosetta/archive/rosetta3/general/listree.pf  \
                      /home/rosetta/archive/rosetta3/general/lidomaint.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) anlexif
  
/home/rosetta/archive/rosetta3/dutch/genlexif.o : /home/rosetta/archive/rosetta3/dutch/genlexif.p  \
                      /home/rosetta/archive/rosetta3/general/genlexif.pf  \
                      /home/rosetta/archive/rosetta3/general/mem.pf  \
                      /home/rosetta/archive/rosetta3/dutch/decomlexrules1.pf  \
                      /home/rosetta/archive/rosetta3/dutch/decomlexrules2.pf  \
                      /home/rosetta/archive/rosetta3/dutch/decomlexrules3.pf  \
                      /home/rosetta/archive/rosetta3/general/listree.pf  \
                      /home/rosetta/archive/rosetta3/general/lidomaint.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) genlexif
  
  
  
#!!  
  
#$(language):drawjtree.opt : general:drawjtree.obj,-  
#                        $(language):drawtree.opt  
#   @actions:obj general $(language) drawjtree  
#   @actions:merge_opt $(language) drawjtree general drawtree  
#  
#general:drawjtree.obj : general:drawjtree.p,-  
#                        general:drawjtree.pf,-  
#                        general:drawtree.pf,-  
#                        general:oldtree.pf,-  
#                        general:original.pf  
#   @actions:pas general drawjtree  
#  
#general:drawjtree.pf : general:drawjtree.env,-  
#                        general:drawtree.pf,-  
#                        general:original.pf  
#   @actions:env general drawjtree  
  
/home/rosetta/archive/rosetta3/general/drawtree.o : /home/rosetta/archive/rosetta3/general/drawtree.p \
                       /home/rosetta/archive/rosetta3/general/drawtree.pf \
                       /home/rosetta/archive/rosetta3/general/oldtree.pf \
                       /home/rosetta/archive/rosetta3/general/wnd.pf \
                       /home/rosetta/archive/rosetta3/general/loop.pf \
                       /home/rosetta/archive/rosetta3/Xw/Xid.h \
                       /home/rosetta/archive/rosetta3/Xw/Sid.h \
                       /home/rosetta/archive/rosetta3/general/mem.pf  \
                       /home/rosetta/archive/rosetta3/general/error.pf  \
                       /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general drawtree
  
  
  
#                      $(language):ldmrules.opt  
  
  
  
  
#                      general:ldmrules.pf  
  
/home/rosetta/archive/rosetta3/general/oldtree.o : /home/rosetta/archive/rosetta3/general/oldtree.p \
                      /home/rosetta/archive/rosetta3/general/oldtree.pf \
                      /home/rosetta/archive/rosetta3/general/str.pf \
                      /home/rosetta/archive/rosetta3/general/string.pf \
                      /home/rosetta/archive/rosetta3/general/strtokey.pf \
                      /home/rosetta/archive/rosetta3/general/strtomkey.pf \
                      /home/rosetta/archive/rosetta3/general/wnd.pf \
                      /home/rosetta/archive/rosetta3/Xw/Xid.h \
                      /home/rosetta/archive/rosetta3/Xw/Sid.h \
                      /home/rosetta/archive/rosetta3/general/mem.pf \
                      /home/rosetta/archive/rosetta3/general/loop.pf \
                      /home/rosetta/archive/rosetta3/general/error.pf \
                      /home/rosetta/archive/rosetta3/general/superdtree.pf \
                      /home/rosetta/archive/rosetta3/general/hyperdtree.pf \
                      /home/rosetta/archive/rosetta3/general/hiltree.pf \
                      /home/rosetta/archive/rosetta3/general/listree.pf \
                      /home/rosetta/archive/rosetta3/interlingua/liilrules.pf \
                      /home/rosetta/archive/rosetta3/general/rectoscreen.pf \
                      /home/rosetta/archive/rosetta3/general/ldmrules.pf \
                      /home/rosetta/archive/rosetta3/general/ldconvrec.pf \
                      /home/rosetta/archive/rosetta3/general/globdef.pf \
                      /home/rosetta/archive/rosetta3/general/ldtypetostr.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general oldtree
  
  
  
  
#!!-----------------module lstypetostr---------------------------  
  
  
/home/rosetta/archive/rosetta3/dutch/lstypetostr.o : /home/rosetta/archive/rosetta3/dutch/lstypetostr.p  \
                              /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf  \
                              /home/rosetta/archive/rosetta3/dutch/lstypetostr.pf  \
                              /home/rosetta/archive/rosetta3/general/str.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) lstypetostr
  
  
#!!-----------------module lsstrtotype---------------------------  
  
  
/home/rosetta/archive/rosetta3/dutch/lsstrtotype.o : /home/rosetta/archive/rosetta3/dutch/lsstrtotype.p  \
                              /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf  \
                              /home/rosetta/archive/rosetta3/dutch/lsstrtotype.pf  \
                              /home/rosetta/archive/rosetta3/general/str.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) lsstrtotype
  
  
#!!!!!!!!!!!!!!!!!!!ldconvrec!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
/home/rosetta/archive/rosetta3/dutch/ldconvrec.o : /home/rosetta/archive/rosetta3/dutch/ldconvrec.p \
                            /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf \
                            /home/rosetta/archive/rosetta3/general/ldconvrec.pf \
                            /home/rosetta/archive/rosetta3/general/ldtypetostr.pf \
                            /home/rosetta/archive/rosetta3/general/listree.pf \
                            /home/rosetta/archive/rosetta3/general/mem.pf  \
                            /home/rosetta/archive/rosetta3/general/lsstree.pf \
                            /home/rosetta/archive/rosetta3/dutch/lsconvattr.pf \
                            /home/rosetta/archive/rosetta3/dutch/lsconvrec.pf \
                            /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldconvrec
  
  
  
#!!-----------------module lsconvrec---------------------------  
  
  
/home/rosetta/archive/rosetta3/dutch/lsconvrec.o : /home/rosetta/archive/rosetta3/dutch/lsconvrec.p  \
                            /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf  \
                            /home/rosetta/archive/rosetta3/dutch/lsconvrec.pf  \
                            /home/rosetta/archive/rosetta3/dutch/lstypetostr.pf  \
                            /home/rosetta/archive/rosetta3/general/mem.pf  \
                            /home/rosetta/archive/rosetta3/general/ldconvrec.pf \
                            /home/rosetta/archive/rosetta3/general/str.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) lsconvrec
  
  
#!!-----------------module lsconvattr---------------------------!!  
  
  
/home/rosetta/archive/rosetta3/dutch/lsconvattr.o : /home/rosetta/archive/rosetta3/dutch/lsconvattr.p  \
                            /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf  \
                            /home/rosetta/archive/rosetta3/dutch/lsconvattr.pf  \
                            /home/rosetta/archive/rosetta3/dutch/maket.pf  \
                            /home/rosetta/archive/rosetta3/dutch/lsstrtotype.pf  \
                            /home/rosetta/archive/rosetta3/general/ldconvrec.pf \
                            /home/rosetta/archive/rosetta3/general/str.pf  \
                            /home/rosetta/archive/rosetta3/general/lidomaint.pf  \
                            /home/rosetta/archive/rosetta3/general/ldstrtotype.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) lsconvattr
  
  
#!! ------------- surface parser and surface rules ------------------  
#!!                         $(language):liownmem.opt  
#!!    @actions:merge_opt $(language) surfparser $(language) liownmem  
  
  
  
/home/rosetta/archive/rosetta3/general/surfparser.o : /home/rosetta/archive/rosetta3/general/surfparser.p  \
                          /home/rosetta/archive/rosetta3/general/surfparser.pf  \
                          /home/rosetta/archive/rosetta3/general/ldsurfswitch.pf  \
                          /home/rosetta/archive/rosetta3/general/lidomaint.pf  \
                          /home/rosetta/archive/rosetta3/general/ldmeasuresize.pf  \
                          /home/rosetta/archive/rosetta3/general/mem.pf  \
                          /home/rosetta/archive/rosetta3/general/awhere.pf  \
                          /home/rosetta/archive/rosetta3/general/alayout.pf  \
                          /home/rosetta/archive/rosetta3/general/interfaces.pf  \
                          /home/rosetta/archive/rosetta3/general/interface1.pf  \
                          /home/rosetta/archive/rosetta3/general/interface2.pf  \
                          /home/rosetta/archive/rosetta3/general/liprims.pf  \
                          /home/rosetta/archive/rosetta3/general/ldprims.pf  \
                          /home/rosetta/archive/rosetta3/general/items.pf  \
                          /home/rosetta/archive/rosetta3/general/surfrules.pf  \
                          /home/rosetta/archive/rosetta3/general/ldtypetostr.pf  \
                          /home/rosetta/archive/rosetta3/general/ldcatsets.pf  \
                          /home/rosetta/archive/rosetta3/general/ldequal.pf  \
                          /home/rosetta/archive/rosetta3/general/drawstree.pf  \
                          /home/rosetta/archive/rosetta3/general/surfrulesgraphs.pf  \
                          /home/rosetta/archive/rosetta3/general/debug.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general surfparser
  
  
  
  
dutch/target/ldownmem.o : dutch/target/ldownmem.p  \
                       general/target/ldownmem.pf  \
                       /home/rosetta/archive/rosetta3/general/lidomaint.pf  \
                       /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldownmem
  
  
  
/home/rosetta/archive/rosetta3/general/liprims.o : /home/rosetta/archive/rosetta3/general/liprims.p  \
                      /home/rosetta/archive/rosetta3/general/liprims.pf  \
                      /home/rosetta/archive/rosetta3/general/ldprims.pf  \
                      /home/rosetta/archive/rosetta3/general/mem.pf  \
                      /home/rosetta/archive/rosetta3/general/lidomaint.pf  \
                      /home/rosetta/archive/rosetta3/general/items.pf  \
                      /home/rosetta/archive/rosetta3/general/listree.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general liprims
  
  
  
  
/home/rosetta/archive/rosetta3/dutch/ldprims.o : /home/rosetta/archive/rosetta3/dutch/ldprims.p  \
                          /home/rosetta/archive/rosetta3/general/ldprims.pf  \
                          /home/rosetta/archive/rosetta3/general/liprims.pf  \
                          /home/rosetta/archive/rosetta3/general/items.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldprims
  
  
  
/home/rosetta/archive/rosetta3/dutch/surfrulesgraphs.o : /home/rosetta/archive/rosetta3/dutch/surfrulesgraphs.p  \
                                  /home/rosetta/archive/rosetta3/general/surfrulesgraphs.pf  \
                                  /home/rosetta/archive/rosetta3/general/lidomaint.pf  \
                                  /home/rosetta/archive/rosetta3/general/liprims.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) surfrulesgraphs
  
  
  
/home/rosetta/archive/rosetta3/dutch/surfrules.o : /home/rosetta/archive/rosetta3/dutch/surfrules.p  \
                            /home/rosetta/archive/rosetta3/general/surfrules.pf  \
                            /home/rosetta/archive/rosetta3/dutch/lssurfquo.pf  \
                            /home/rosetta/archive/rosetta3/general/liprims.pf  \
                            /home/rosetta/archive/rosetta3/general/listree.pf  \
                            /home/rosetta/archive/rosetta3/general/strtokey.pf  \
                            /home/rosetta/archive/rosetta3/general/lsstree.pf  \
                            /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf  \
                            /home/rosetta/archive/rosetta3/dutch/maket.pf  \
                            /home/rosetta/archive/rosetta3/dutch/copyt.pf  \
                            /home/rosetta/archive/rosetta3/dutch/lsauxdom.pf  \
                            /home/rosetta/archive/rosetta3/general/lidomaint.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) surfrules
  
  
  
/home/rosetta/archive/rosetta3/dutch/ldsurfswitch.o : /home/rosetta/archive/rosetta3/dutch/ldsurfswitch.p  \
                               /home/rosetta/archive/rosetta3/general/ldsurfswitch.pf  \
                               /home/rosetta/archive/rosetta3/general/items.pf  \
                               /home/rosetta/archive/rosetta3/general/mem.pf  \
                               /home/rosetta/archive/rosetta3/general/ldsurfswitch.pf  \
                               /home/rosetta/archive/rosetta3/dutch/lsrulepars.pf  \
                               /home/rosetta/archive/rosetta3/general/liprims.pf  \
                               /home/rosetta/archive/rosetta3/general/listree.pf  \
                               /home/rosetta/archive/rosetta3/general/lsstree.pf  \
                               /home/rosetta/archive/rosetta3/dutch/surfrulesblocks.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldsurfswitch                               
  
  
  
  
/home/rosetta/archive/rosetta3/dutch/surfrulesblocks.o : /home/rosetta/archive/rosetta3/dutch/surfrulesblocks.p  \
                                  /home/rosetta/archive/rosetta3/dutch/surfrulesblocks.pf  \
                                  /home/rosetta/archive/rosetta3/general/listree.pf  \
                                  /home/rosetta/archive/rosetta3/dutch/lsrulepars.pf  \
                                  /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf  \
                                  /home/rosetta/archive/rosetta3/general/lsstree.pf  \
                                  /home/rosetta/archive/rosetta3/dutch/maket.pf  \
                                  /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf  \
                                  /home/rosetta/archive/rosetta3/dutch/lsauxdom.pf  \
                                  /home/rosetta/archive/rosetta3/general/lsmatches.pf  \
                                  /home/rosetta/archive/rosetta3/dutch/lssurfquo.pf  \
                                  /home/rosetta/archive/rosetta3/general/debug.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) surfrulesblocks
  
  
  
/home/rosetta/archive/rosetta3/dutch/lssurfquo.o : /home/rosetta/archive/rosetta3/dutch/lssurfquo.p  \
                            /home/rosetta/archive/rosetta3/dutch/lssurfquo.pf  \
                            /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf  \
                            /home/rosetta/archive/rosetta3/general/lsstree.pf  \
                            /home/rosetta/archive/rosetta3/dutch/lsrulepars.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) lssurfquo
  
  
#!  
#! transfer rules  
#!   
  
  
/home/rosetta/archive/rosetta3/dutch/ldanilrules.o : /home/rosetta/archive/rosetta3/dutch/ldanilrules.p  \
                              /home/rosetta/archive/rosetta3/general/ldanilrules.pf  \
                              /home/rosetta/archive/rosetta3/general/hiltree.pf  \
                              /home/rosetta/archive/rosetta3/interlingua/liilrules.pf  \
                              /home/rosetta/archive/rosetta3/general/ldmrules.pf  \
                              /home/rosetta/archive/rosetta3/dutch/lsparams.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldanilrules
  
  
  
/home/rosetta/archive/rosetta3/dutch/ldgenilrules.o : /home/rosetta/archive/rosetta3/dutch/ldgenilrules.p  \
                              /home/rosetta/archive/rosetta3/general/ldgenilrules.pf  \
                              /home/rosetta/archive/rosetta3/general/mem.pf  \
                              /home/rosetta/archive/rosetta3/general/hyperdtree.pf  \
                              /home/rosetta/archive/rosetta3/interlingua/liilrules.pf  \
                              /home/rosetta/archive/rosetta3/general/ldmrules.pf  \
                              /home/rosetta/archive/rosetta3/dutch/lsparams.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldgenilrules
  
  
  
  
general/target/morftestquestion.o : general/target/morftestquestion.p  \
                                /home/rosetta/archive/rosetta3/general/files.pf  \
                                /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general morftestquestion
  
#  
#----------------ldmeasuresize-------  
#  
  
  
/home/rosetta/archive/rosetta3/dutch/ldmeasuresize.o : /home/rosetta/archive/rosetta3/general/ldmeasuresize.p  \
                            /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general ldmeasuresize $(language)
  
  
#  
#------------toggle.opt--------------------  
#  
  
  
# list the integration targets of this component  
integrate_interlingua : 
	@ ! no action needed
  
integrate_interlingua_2 : /home/rosetta/archive/rosetta3/interlingua/liilrules.o;
	@ ! no action needed
  
# include the description files of the parts of this component  
  
  
  
/home/rosetta/archive/rosetta3/interlingua/liilrules.o : /home/rosetta/archive/rosetta3/interlingua/liilrules.p  \
                            /home/rosetta/archive/rosetta3/interlingua/liilrules.pf  \
                            /home/rosetta/archive/rosetta3/general/rectoscreen.pf  \
                            /home/rosetta/archive/rosetta3/general/ldconvrec.pf \
                            /home/rosetta/archive/rosetta3/general/str.pf \
                            /home/rosetta/archive/rosetta3/general/mem.pf  \
                            /home/rosetta/archive/rosetta3/general/wnd.pf \
                            /home/rosetta/archive/rosetta3/Xw/Xid.h \
                            /home/rosetta/archive/rosetta3/Xw/Sid.h;
	@/home/rosetta/archive/rosetta3/actions/pas interlingua liilrules
  
  
#!! list the integration targets of this component  
  
integrate_lexicon : 
	@ ! no action needed yet
  
integrate_lexicon_2 : lexicon/target/select.exe  \
                      lexicon/target/vandale.opt   \
                      lexicon/target/setnr.exe  \
                      lexicon/target/categories.exe  \
                      lexicon/target/splitdic.exe  \
                      lexicon/target/setadjs.exe  \
                      lexicon/target/skipxtra.exe  \
                      lexicon/target/addreverse.exe  \
                      lexicon/target/countgperletter.exe  \
                      lexicon/target/printretro.exe  \
                      lexicon/target/setplural.exe  \
                      lexicon/target/setconj.exe  \
                      lexicon/target/withoutaccent.exe  \
                      lexicon/target/wordlength.exe  \
                      lexicon/target/vandaletolatex.exe  \
                      lexicon/target/vandalesheets.exe  \
                      lexicon/target/createlex.exe  \
                      lexicon/target/listlabbrev.exe  \
                      lexicon/target/whichone.exe  \
                      lexicon/target/combine.exe  \
                      lexicon/target/tr_check.exe  \
                      lexicon/target/make_vd_lemma.exe  \
                      lexicon/target/genr3noundicts.exe  \
                      lexicon/target/genr3verbdicts.exe  \
                      lexicon/target/expand_english_blex.exe   \
                      lexicon/target/genr3adjdicts.exe  \
                      lexicon/target/genr3advdicts.exe  \
                      lexicon/target/r2_subset.exe;
	@ ! no action needed yet
  
#!! include the description files of the parts of this component  
  
#!! the dependencies of this component  
  
  
  
lexicon/target/tst.o : lexicon/target/tst.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf  \
                     lexicon/target/vandale.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon tst
  
#!! the dependencies of this component  
  
  
  
lexicon/target/whichone.o : lexicon/target/whichone.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf  \
                     lexicon/target/vandale.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon whichone
  
#!! the dependencies of this component  
  
  
  
lexicon/target/wordok.o : lexicon/target/wordok.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon wordok
  
#!! the dependencies of this component  
  
  
  
lexicon/target/allwordscat.o : lexicon/target/allwordscat.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf  \
                     lexicon/target/vandale.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon allwordscat
  
  
#!! the dependencies of the program select  
  
  
  
lexicon/target/select.o : lexicon/target/select.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon select
  
#!! the dependencies of the program listlabbrev  
  
  
  
lexicon/target/listlabbrev.o : lexicon/target/listlabbrev.p  \
                     /home/rosetta/archive/rosetta3/general/files.pf  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon listlabbrev
  
#!! the dependencies of the program getmeanings  
  
  
  
lexicon/target/getmeanings.o : lexicon/target/getmeanings.p  \
                     /home/rosetta/archive/rosetta3/general/files.pf  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon getmeanings
  
#!! the dependencies of the program getidioms  
  
  
  
lexicon/target/getidioms.o : lexicon/target/getidioms.p  \
                     /home/rosetta/archive/rosetta3/general/files.pf  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon getidioms
  
#!! the dependencies of the program createlex  
  
  
  
lexicon/target/createlex.o : lexicon/target/createlex.p  \
                     /home/rosetta/archive/rosetta3/general/files.pf  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     /home/rosetta/archive/rosetta3/unix/cisam.pf  \
                     lexicon/target/vandale.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon createlex
  
#!! the dependencies of the program vandaletolatex  
  
  
  
lexicon/target/vandaletolatex.o : lexicon/target/vandaletolatex.p  \
                     /home/rosetta/archive/rosetta3/general/files.pf  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon vandaletolatex
  
#!! the dependencies of the program vandalesheets  
  
  
  
lexicon/target/vandalesheets.o : lexicon/target/vandalesheets.p  \
                     /home/rosetta/archive/rosetta3/general/files.pf  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon vandalesheets
  
#!! the dependencies of the program wordlength  
  
  
  
lexicon/target/wordlength.o : lexicon/target/wordlength.p  \
                     /home/rosetta/archive/rosetta3/general/files.pf  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon wordlength
  
#!! the dependencies of the program withoutaccent  
  
  
  
lexicon/target/withoutaccent.o : lexicon/target/withoutaccent.p  \
                     /home/rosetta/archive/rosetta3/general/files.pf  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon withoutaccent
  
#!! the dependencies of the program addreverse  
  
  
  
lexicon/target/addreverse.o : lexicon/target/addreverse.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf  \
                     lexicon/target/vandale.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon addreverse
  
#!! the dependencies of the program countgperletter  
  
  
  
lexicon/target/countgperletter.o : lexicon/target/countgperletter.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf  \
                     lexicon/target/vandale.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon countgperletter
  
#!! the dependencies of the program printretro  
  
  
  
lexicon/target/printretro.o : lexicon/target/printretro.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf  \
                     lexicon/target/vandale.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon printretro
  
#!! the dependencies of the program setnr  
  
  
  
lexicon/target/setnr.o : lexicon/target/setnr.p  \
                     /home/rosetta/archive/rosetta3/general/log.pf  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon setnr
  
#!! the dependencies of the program splitdic  
  
  
  
lexicon/target/splitdic.o : lexicon/target/splitdic.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon splitdic
  
#!! the dependencies of the program setadjs  
  
  
  
lexicon/target/setadjs.o : lexicon/target/setadjs.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf  \
                     /home/rosetta/archive/rosetta3/general/windows.pf  \
                     lexicon/target/vandale.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon setadjs
  
#!! the dependencies of the program categories  
  
  
  
lexicon/target/categories.o : lexicon/target/categories.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon categories
  
#!! the dependencies of the program skipxtra  
  
  
  
lexicon/target/skipxtra.o : lexicon/target/skipxtra.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon skipxtra
  
#!! the dependencies of the program setplural  
  
  
  
lexicon/target/setplural.o : lexicon/target/setplural.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon setplural
  
#!! the dependencies of the program setconj  
  
  
  
lexicon/target/setconj.o : lexicon/target/setconj.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon setconj
  
#!! the dependencies of the program combine  
  
  
  
lexicon/target/combine.o : lexicon/target/combine.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon combine
  
#!! the dependencies of the program r2_subset  
  
  
  
lexicon/target/r2_subset.o : lexicon/target/r2_subset.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon r2_subset
  
#!! the dependencies of the program genr3noundicts  
  
  
  
lexicon/target/genr3noundicts.o : lexicon/target/genr3noundicts.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon genr3noundicts
  
#!! the dependencies of the program genr3verbdicts  
  
  
  
lexicon/target/genr3verbdicts.o : lexicon/target/genr3verbdicts.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon genr3verbdicts
  
#!! the dependencies of the program genr3advdicts  
  
  
  
lexicon/target/genr3advdicts.o : lexicon/target/genr3advdicts.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon genr3advdicts
  
#!! the dependencies of the program genr3adjdicts  
  
  
  
lexicon/target/genr3adjdicts.o : lexicon/target/genr3adjdicts.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon genr3adjdicts
  
#!! the dependencies of the program tr_check  
  
  
  
lexicon/target/tr_check.o : lexicon/target/tr_check.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon tr_check
  
#!! the dependencies of the program make_vd_lemma  
  
  
  
lexicon/target/make_vd_lemma.o : lexicon/target/make_vd_lemma.p;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon make_vd_lemma
  
#!! the dependencies of the environment vandale  
  
  
lexicon/target/vandale.o : lexicon/target/vandale.p  \
                     lexicon/target/vandale.pf  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon vandale
  
#!!  
  
  
#!! the dependencies of the program expand_english_blex  
  
  
  
lexicon/target/expand_english_blex.o : lexicon/target/expand_english_blex.p  \
                     /home/rosetta/archive/rosetta3/general/str.pf  \
                     lexicon/target/vandale.pf  \
                     /home/rosetta/archive/rosetta3/general/files.pf  \
                     lexicon/target/getrecord.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon expand_english_blex
  
  
lexicon/target/getrecord.o : lexicon/target/getrecord.p  \
                        lexicon/target/getrecord.pf  \
                        /home/rosetta/archive/rosetta3/general/str.pf  \
                        /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf  \
                        /home/rosetta/archive/rosetta3/general/globdef.pf  \
                        /home/rosetta/archive/rosetta3/general/mem.pf  \
                        dutch/target/lsstree.pf  \
                        /home/rosetta/archive/rosetta3/general/listree.pf  \
                        lexicon/target/lexblex.pf  \
                        /home/rosetta/archive/rosetta3/general/liildict.pf  \
                        /home/rosetta/archive/rosetta3/general/string.pf  \
                        /home/rosetta/archive/rosetta3/general/strtomkey.pf  \
                        /home/rosetta/archive/rosetta3/general/strtokey.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon getrecord
  
  
  
  
#!!!!!!!!!!!!!!!!!!!lexblex!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
  
  
  
dutch/target/lexblex.o : lexicon/target/lexblex.p \
                         lexicon/target/lexblex.pf \
                         /home/rosetta/archive/rosetta3/general/listree.pf \
                         /home/rosetta/archive/rosetta3/general/lsstree.pf \
                         /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf \
                         /home/rosetta/archive/rosetta3/dutch/maket.pf \
                         /home/rosetta/archive/rosetta3/unix/cisam.pf \
                         /home/rosetta/archive/rosetta3/general/mem.pf  \
                         /home/rosetta/archive/rosetta3/general/ldgetkey.pf;
	@/home/rosetta/archive/rosetta3/actions/pas lexicon lexblex $(language) 
  
  
  
  
#!! list the integration targets of this component  
  
integrate_spanish : 
	@ ! no action needed yet
  
integrate_spanish_2 : spanish/target/toggle.opt \
                      spanish/target/morftest.exe \
                      /home/rosetta/archive/rosetta3/spanish/amglue.sro \
                      /home/rosetta/archive/rosetta3/spanish/arglue.sro \
                      /home/rosetta/archive/rosetta3/spanish/asuffix.sro \
                      /home/rosetta/archive/rosetta3/spanish/sdict.dat \
                      /home/rosetta/archive/rosetta3/spanish/fixid.dat \
                      /home/rosetta/archive/rosetta3/spanish/mdict.dat \
                      /home/rosetta/archive/rosetta3/spanish/blex.dat \
                      /home/rosetta/archive/rosetta3/spanish/generation.exe \
                      spanish/target/lexview.exe  \
                      /home/rosetta/archive/rosetta3/spanish/lexed.exe  \
                      spanish/target/isfmerge.exe  \
                      configspa;
	@ ! no action needed yet
  
#!! the dependencies of this component  
  
configspa : /home/rosetta/archive/rosetta3/spanish/config.sys;
	@actions/sys spanish config
  
# list the integration targets of this component  
integrate_text : 
	@ ! no action needed
  
# include the description files of the parts of this component  
  
  
#!! list the integration targets of this component  
  
integrate_tools : 
	@ ! no action needed yet
  
#!! below dictgen.exe, domcom.exe are mentioned  
#!! because they have .toggle files and must be built first if necessary   
#!!  
  
integrate_tools_2 : vandale  \
                    tools/target/edtcom.exe  \
                    /home/rosetta/archive/rosetta3/tools/domcom.exe  \
                    dutch/target/newdictgen.exe \
                    english/target/newdictgen.exe \
                    spanish/target/newdictgen.exe \
                    tools/target/dict_tuner.exe  \
                    /home/rosetta/archive/rosetta3/tools/lexedcontrol.exe  \
                    tools/target/initdutch.exe  \
                    tools/target/initenglish.exe  \
                    tools/target/initspanish.exe  \
                    tools/target/lockinit.exe;
	@ ! no action needed yet
  
  
#!! include the description files of the parts of this component  
  
  
  
/home/rosetta/archive/rosetta3/tools/asegcom.o : /home/rosetta/archive/rosetta3/tools/asegcom.p \
                    /home/rosetta/archive/rosetta3/tools/segcomscanner.pf \
                    /home/rosetta/archive/rosetta3/tools/segcomparser.pf \
                    /home/rosetta/archive/rosetta3/tools/segcomrules.pf \
                    /home/rosetta/archive/rosetta3/tools/segcomlangspec.pf \
                    /home/rosetta/archive/rosetta3/tools/segcomdecl.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools asegcom
  
  
  
/home/rosetta/archive/rosetta3/tools/gsegcom.o : /home/rosetta/archive/rosetta3/tools/gsegcom.p \
                    /home/rosetta/archive/rosetta3/tools/segcomscanner.pf \
                    /home/rosetta/archive/rosetta3/tools/segcomparser.pf \
                    /home/rosetta/archive/rosetta3/tools/segcomrules.pf \
                    /home/rosetta/archive/rosetta3/tools/segcomlangspec.pf \
                    /home/rosetta/archive/rosetta3/tools/segcomdecl.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools gsegcom
  
  
  
/home/rosetta/archive/rosetta3/tools/gencomp.o : /home/rosetta/archive/rosetta3/tools/gencomp.p  \
                    /home/rosetta/archive/rosetta3/general/files.pf  \
                    /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools gencomp
  
  
  
  
/home/rosetta/archive/rosetta3/dutch/lduniquerels.o : /home/rosetta/archive/rosetta3/general/lduniquerels.p  \
                               /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf  \
                               /home/rosetta/archive/rosetta3/dutch/lsauxdom.pf \
                               /home/rosetta/archive/rosetta3/general/lduniquerels.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general lduniquerels $(language) 
  
  
  
/home/rosetta/archive/rosetta3/tools/tldstrtostr.o : /home/rosetta/archive/rosetta3/tools/tldstrtostr.p  \
                       /home/rosetta/archive/rosetta3/general/ldstrtostr.pf  \
                       /home/rosetta/archive/rosetta3/tools/tstring.pf  \
                       /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools tldstrtostr
  
  
  
/home/rosetta/archive/rosetta3/tools/tldconvrec.o : /home/rosetta/archive/rosetta3/tools/tldconvrec.p  \
                       /home/rosetta/archive/rosetta3/general/ldconvrec.pf  \
                       /home/rosetta/archive/rosetta3/tools/tstring.pf  \
                       /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools tldconvrec
  
  
  
/home/rosetta/archive/rosetta3/tools/tfiles.o : /home/rosetta/archive/rosetta3/tools/tfiles.p  \
                    /home/rosetta/archive/rosetta3/tools/tfiles.pf  \
                    /home/rosetta/archive/rosetta3/tools/tstring.pf  \
                    /home/rosetta/archive/rosetta3/general/str.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools tfiles
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/tstring.o : /home/rosetta/archive/rosetta3/tools/tstring.p \
                     /home/rosetta/archive/rosetta3/tools/tstring.pf  \
                     /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools tstring
  
  
#!!  
  
#--------------------module lexlink-------------------  
  
  
  
/home/rosetta/archive/rosetta3/tools/lexlink.o : /home/rosetta/archive/rosetta3/tools/lexlink.p  \
                    /home/rosetta/archive/rosetta3/general/files.pf  \
                    /home/rosetta/archive/rosetta3/general/string.pf  \
                    /home/rosetta/archive/rosetta3/general/str.pf  \
                    /home/rosetta/archive/rosetta3/general/ldstrtotype.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools lexlink
  
  
  
#--------------------module mrulelink-------------------  
  
  
  
/home/rosetta/archive/rosetta3/tools/mrulelink.o : /home/rosetta/archive/rosetta3/tools/mrulelink.p  \
                    /home/rosetta/archive/rosetta3/general/files.pf  \
                    /home/rosetta/archive/rosetta3/general/string.pf  \
                    /home/rosetta/archive/rosetta3/general/str.pf  \
                    /home/rosetta/archive/rosetta3/general/ldstrtotype.pf  \
                    /home/rosetta/archive/rosetta3/general/ldstrtostr.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools mrulelink
  
#-----------surface rule compiler---------------  
  
surcom : /home/rosetta/archive/rosetta3/dutch/surcom.exe;
	@ ! integration target
  
  
  
/home/rosetta/archive/rosetta3/tools/surcom.o : /home/rosetta/archive/rosetta3/tools/surcom.p  \
   	/home/rosetta/archive/rosetta3/tools/surcomparser.pf \
	/home/rosetta/archive/rosetta3/tools/surcomdecl.pf \
	/home/rosetta/archive/rosetta3/tools/surcomscanner.pf \
	/home/rosetta/archive/rosetta3/tools/surcomcode.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools surcom 
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/surcomcode.o : /home/rosetta/archive/rosetta3/tools/surcomcode.p  \
                       /home/rosetta/archive/rosetta3/tools/surcomcode.pf  \
                       /home/rosetta/archive/rosetta3/tools/surcomdecl.pf  \
                       /home/rosetta/archive/rosetta3/general/lidomaint.pf ;
	@/home/rosetta/archive/rosetta3/actions/pas tools surcomcode 
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/surcomdecl.o : /home/rosetta/archive/rosetta3/tools/surcomdecl.p  \
                       /home/rosetta/archive/rosetta3/tools/surcomdecl.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools surcomdecl 
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/surcomrules.o : /home/rosetta/archive/rosetta3/tools/surcomrules.p  \
        /home/rosetta/archive/rosetta3/tools/surcomrules.pf \
	/home/rosetta/archive/rosetta3/tools/surcomdecl.pf ;
	@/home/rosetta/archive/rosetta3/actions/pas tools surcomrules 
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/surcomparser.o : /home/rosetta/archive/rosetta3/tools/surcomparser.p  \
                          /home/rosetta/archive/rosetta3/tools/surcomdecl.pf  \
                          /home/rosetta/archive/rosetta3/tools/surcomgraphdef.pf  \
                          /home/rosetta/archive/rosetta3/tools/surcomrules.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools surcomparser 
  
  
  
/home/rosetta/archive/rosetta3/tools/surcomgraph.o : /home/rosetta/archive/rosetta3/tools/surcomgraph.p \
                        /home/rosetta/archive/rosetta3/tools/surcomgraph.pf \
                        /home/rosetta/archive/rosetta3/tools/surcomdecl.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools surcomgraph
  
  
  
/home/rosetta/archive/rosetta3/tools/surcomgraphdef.o : /home/rosetta/archive/rosetta3/tools/surcomgraphdef.p  \
                         /home/rosetta/archive/rosetta3/tools/surcomgraph.pf \
	/home/rosetta/archive/rosetta3/tools/surcomdecl.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools surcomgraphdef 
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/surcomscanner.o : /home/rosetta/archive/rosetta3/tools/surcomscanner.p  \
                          /home/rosetta/archive/rosetta3/tools/surcomscanner.pf  \
                          /home/rosetta/archive/rosetta3/tools/surcomdecl.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools surcomscanner 
  
  
  
tools/target/edtcomrules.o : tools/target/edtcomrules.p \
                        /home/rosetta/archive/rosetta3/tools/domcomrules.pf \
                        /home/rosetta/archive/rosetta3/tools/domcomlangspec.pf \
                        /home/rosetta/archive/rosetta3/tools/domcomdecl.pf \
                        /home/rosetta/archive/rosetta3/general/files.pf \
                        /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools edtcomrules
   
  
  
/home/rosetta/archive/rosetta3/tools/mrudomcom.o : /home/rosetta/archive/rosetta3/tools/mrudomcom.p \
                   /home/rosetta/archive/rosetta3/tools/mrudomcomscanner.pf \
                   /home/rosetta/archive/rosetta3/tools/mrudomcomparser.pf \
                   /home/rosetta/archive/rosetta3/tools/mrudomcomlangspec.pf \
                   /home/rosetta/archive/rosetta3/tools/mrudomcomrules.pf \
                   /home/rosetta/archive/rosetta3/tools/mrudomcomdecl.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools mrudomcom 
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/mrudomcomscanner.o : /home/rosetta/archive/rosetta3/tools/mrudomcomscanner.p \
                          /home/rosetta/archive/rosetta3/tools/mrudomcomscanner.pf \
                          /home/rosetta/archive/rosetta3/tools/mrudomcomlangspec.pf \
                          /home/rosetta/archive/rosetta3/tools/mrudomcomdecl.pf \
                          /home/rosetta/archive/rosetta3/tools/tstring.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools mrudomcomscanner 
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/mrudomcomparser.o : /home/rosetta/archive/rosetta3/tools/mrudomcomparser.p \
                         /home/rosetta/archive/rosetta3/tools/mrudomcomparser.pf \
                         /home/rosetta/archive/rosetta3/tools/mrudomcomgraphdef.pf \
                         /home/rosetta/archive/rosetta3/tools/mrudomcomrules.pf \
                         /home/rosetta/archive/rosetta3/tools/mrudomcomlangspec.pf \
                         /home/rosetta/archive/rosetta3/tools/mrudomcomdecl.pf  \
                         /home/rosetta/archive/rosetta3/tools/tstring.pf  \
                         /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/pas tools mrudomcomparser 
 
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/mrudomcomdecl.o : /home/rosetta/archive/rosetta3/tools/mrudomcomdecl.p \
                       /home/rosetta/archive/rosetta3/tools/mrudomcomdecl.pf \
                       /home/rosetta/archive/rosetta3/tools/mrudomcomlangspec.pf \
                       /home/rosetta/archive/rosetta3/tools/tstring.pf  \
                       /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/pas tools mrudomcomdecl 
 
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/mrudomcomlangspec.o : /home/rosetta/archive/rosetta3/tools/mrudomcomlangspec.p \
                           /home/rosetta/archive/rosetta3/tools/mrudomcomlangspec.pf \
                           /home/rosetta/archive/rosetta3/tools/tstring.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools mrudomcomlangspec 
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/mrudomcomgraph.o : /home/rosetta/archive/rosetta3/tools/mrudomcomgraph.p \
                        /home/rosetta/archive/rosetta3/tools/mrudomcomgraph.pf \
                        /home/rosetta/archive/rosetta3/tools/mrudomcomlangspec.pf \
                        /home/rosetta/archive/rosetta3/tools/mrudomcomdecl.pf  \
                        /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/pas tools mrudomcomgraph 
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/mrudomcomgraphdef.o : /home/rosetta/archive/rosetta3/tools/mrudomcomgraphdef.p \
                           /home/rosetta/archive/rosetta3/tools/mrudomcomgraphdef.pf \
                           /home/rosetta/archive/rosetta3/tools/mrudomcomgraph.pf \
                           /home/rosetta/archive/rosetta3/tools/mrudomcomlangspec.pf \
                           /home/rosetta/archive/rosetta3/tools/mrudomcomdecl.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools mrudomcomgraphdef 
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/mrudomcomrules.o : /home/rosetta/archive/rosetta3/tools/mrudomcomrules.p \
                        /home/rosetta/archive/rosetta3/tools/mrudomcomrules.pf \
                        /home/rosetta/archive/rosetta3/tools/mrudomcomlangspec.pf \
                        /home/rosetta/archive/rosetta3/tools/mrudomcomdecl.pf \
                        /home/rosetta/archive/rosetta3/general/files.pf \
                        /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools mrudomcomrules 
  
  
  
#!!  
#!! program dict_tuner, written by harm smit:  
#!!  
  
  
  
tools/target/dict_tuner.o : tools/target/dict_tuner.p \
                       /home/rosetta/archive/rosetta3/unix/cisam.pf \
                       /home/rosetta/archive/rosetta3/general/liildict.pf \
                       /home/rosetta/archive/rosetta3/general/strtokey.pf \
                       /home/rosetta/archive/rosetta3/general/strkeyrecdef.pf \
                       /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools dict_tuner
  
#!!  
#!! program mkeycheck written by jan odijk (variant of dict_tuner)  
#!!  
  
  
  
tools/target/mkeycheck.o : tools/target/mkeycheck.p \
                       /home/rosetta/archive/rosetta3/unix/cisam.pf \
                       /home/rosetta/archive/rosetta3/general/liildict.pf \
                       /home/rosetta/archive/rosetta3/general/strtokey.pf \
                       /home/rosetta/archive/rosetta3/general/strkeyrecdef.pf \
                       /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools mkeycheck
  
  
   
  
  
tools/target/findmkey.o : tools/target/findmkey.p \
                      /home/rosetta/archive/rosetta3/general/strtomkey.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools findmkey
  
  
#!! the dependencies of this component  
  
  
  
/home/rosetta/archive/rosetta3/tools/domcom.o : /home/rosetta/archive/rosetta3/tools/domcom.p \
                   /home/rosetta/archive/rosetta3/tools/domcomscanner.pf \
                   /home/rosetta/archive/rosetta3/tools/domcomparser.pf \
                   /home/rosetta/archive/rosetta3/tools/domcomlangspec.pf \
                   /home/rosetta/archive/rosetta3/tools/domcomrules.pf \
                   /home/rosetta/archive/rosetta3/tools/domcomdecl.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools domcom
  
#!!  
  
  
dutch/target/testconstraints.o : tools/target/testconstraints.p \
                                  /home/rosetta/archive/rosetta3/general/ldblex.pf \
                                  dutch/target/testrecord.pf \
                                  /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf \
                                  /home/rosetta/archive/rosetta3/dutch/lsauxdom.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools testconstraints $(language)
  
#!!  
  
dutch/target/testrecord.o : dutch/target/testrecord.p \
                             dutch/target/testrecord.pf \
                             /home/rosetta/archive/rosetta3/dutch/lsdomaint.pf;
	@/home/rosetta/archive/rosetta3/actions/pas $(language) testrecord
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/domcomscanner.o : /home/rosetta/archive/rosetta3/tools/domcomscanner.p \
                          /home/rosetta/archive/rosetta3/tools/domcomscanner.pf \
                          /home/rosetta/archive/rosetta3/tools/domcomlangspec.pf \
                          /home/rosetta/archive/rosetta3/tools/domcomdecl.pf \
                          /home/rosetta/archive/rosetta3/tools/tstring.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools domcomscanner
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/domcomparser.o : /home/rosetta/archive/rosetta3/tools/domcomparser.p \
                         /home/rosetta/archive/rosetta3/tools/domcomparser.pf \
                         /home/rosetta/archive/rosetta3/tools/domcomgraphdef.pf \
                         /home/rosetta/archive/rosetta3/tools/domcomrules.pf \
                         /home/rosetta/archive/rosetta3/tools/domcomlangspec.pf \
                         /home/rosetta/archive/rosetta3/tools/domcomdecl.pf  \
                         /home/rosetta/archive/rosetta3/tools/tstring.pf  \
                         /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/pas tools domcomparser
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/domcomdecl.o : /home/rosetta/archive/rosetta3/tools/domcomdecl.p \
                       /home/rosetta/archive/rosetta3/tools/domcomdecl.pf \
                       /home/rosetta/archive/rosetta3/tools/domcomlangspec.pf \
                       /home/rosetta/archive/rosetta3/tools/tstring.pf  \
                       /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/pas tools domcomdecl
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/domcomlangspec.o : /home/rosetta/archive/rosetta3/tools/domcomlangspec.p \
                           /home/rosetta/archive/rosetta3/tools/domcomlangspec.pf \
                           /home/rosetta/archive/rosetta3/tools/tstring.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools domcomlangspec
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/domcomgraph.o : /home/rosetta/archive/rosetta3/tools/domcomgraph.p \
                        /home/rosetta/archive/rosetta3/tools/domcomgraph.pf \
                        /home/rosetta/archive/rosetta3/tools/domcomlangspec.pf \
                        /home/rosetta/archive/rosetta3/tools/domcomdecl.pf  \
                        /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/pas tools domcomgraph
 
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/domcomgraphdef.o : /home/rosetta/archive/rosetta3/tools/domcomgraphdef.p \
                           /home/rosetta/archive/rosetta3/tools/domcomgraphdef.pf \
                           /home/rosetta/archive/rosetta3/tools/domcomgraph.pf \
                           /home/rosetta/archive/rosetta3/tools/domcomlangspec.pf \
                           /home/rosetta/archive/rosetta3/tools/domcomdecl.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools domcomgraphdef
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/domcomrules.o : /home/rosetta/archive/rosetta3/tools/domcomrules.p \
                        /home/rosetta/archive/rosetta3/tools/domcomrules.pf \
                        /home/rosetta/archive/rosetta3/tools/domcomlangspec.pf \
                        /home/rosetta/archive/rosetta3/tools/domcomdecl.pf \
                        /home/rosetta/archive/rosetta3/general/files.pf \
                        /home/rosetta/archive/rosetta3/general/string.pf \
                        /home/rosetta/archive/rosetta3/general/str.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools domcomrules
  
  
#!!  
  
lexcomp : /home/rosetta/archive/rosetta3/dutch/lexcom.exe  \
          /home/rosetta/archive/rosetta3/dutch/lexlink.exe;
	@ ! no action
  
  
  
/home/rosetta/archive/rosetta3/tools/lexcom.o : /home/rosetta/archive/rosetta3/tools/lexcom.p  \
	/home/rosetta/archive/rosetta3/tools/lexcomdecl.pf \
	/home/rosetta/archive/rosetta3/tools/lexcomscanner.pf \
	/home/rosetta/archive/rosetta3/tools/lexcomcode.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools lexcom 
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/lexcomcode.o : /home/rosetta/archive/rosetta3/tools/lexcomcode.p  \
                       /home/rosetta/archive/rosetta3/tools/lexcomcode.pf  \
                       /home/rosetta/archive/rosetta3/tools/lexcomdecl.pf  \
                       /home/rosetta/archive/rosetta3/tools/lexcomrules.pf  \
                       /home/rosetta/archive/rosetta3/general/ldstrtostr.pf  \
                       /home/rosetta/archive/rosetta3/general/ldstrtotype.pf  \
                       /home/rosetta/archive/rosetta3/general/ldcatsets.pf  \
                       /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools lexcomcode 
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/lexcomdecl.o : /home/rosetta/archive/rosetta3/tools/lexcomdecl.p  \
                       /home/rosetta/archive/rosetta3/tools/lexcomdecl.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools lexcomdecl 
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/lexcomrules.o : /home/rosetta/archive/rosetta3/tools/lexcomrules.p  \
	/home/rosetta/archive/rosetta3/general/ldstrtotype.pf \
	/home/rosetta/archive/rosetta3/general/ldcatsets.pf \
	/home/rosetta/archive/rosetta3/tools/lexcomdecl.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools lexcomrules 
  
  
#!!  
  
lexsurfparser : /home/rosetta/archive/rosetta3/tools/lexcomparser.o;
	@ ! no action
  
  
/home/rosetta/archive/rosetta3/tools/lexcomparser.o : /home/rosetta/archive/rosetta3/tools/lexcomparser.p  \
                          /home/rosetta/archive/rosetta3/tools/lexcomdecl.pf  \
                          /home/rosetta/archive/rosetta3/tools/lexcomgraphdef.pf  \
                          /home/rosetta/archive/rosetta3/tools/lexcomrules.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools lexcomparser 
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/lexcomgraph.o : /home/rosetta/archive/rosetta3/tools/lexcomgraph.p \
                        /home/rosetta/archive/rosetta3/tools/lexcomgraph.pf \
                        /home/rosetta/archive/rosetta3/tools/lexcomdecl.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools lexcomgraph
  
  
  
/home/rosetta/archive/rosetta3/tools/lexcomgraphdef.o : /home/rosetta/archive/rosetta3/tools/lexcomgraphdef.p  \
	/home/rosetta/archive/rosetta3/tools/lexcomgraph.pf \
	/home/rosetta/archive/rosetta3/tools/lexcomdecl.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools lexcomgraphdef 
  
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/lexcomscanner.o : /home/rosetta/archive/rosetta3/tools/lexcomscanner.p  \
                          /home/rosetta/archive/rosetta3/tools/lexcomscanner.pf  \
                          /home/rosetta/archive/rosetta3/tools/lexcomdecl.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools lexcomscanner 
  
  
#!!  
  
segcomp : dutch/target/segcom.exe;
	@ ! no action
  
  
  
tools/target/segcom.o : tools/target/segcom.p \
                   /home/rosetta/archive/rosetta3/tools/segcomscanner.pf \
                   /home/rosetta/archive/rosetta3/tools/segcomparser.pf \
                   /home/rosetta/archive/rosetta3/tools/segcomrules.pf \
                   /home/rosetta/archive/rosetta3/tools/segcomlangspec.pf \
                   /home/rosetta/archive/rosetta3/tools/segcomdecl.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools segcom
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/segcomscanner.o : /home/rosetta/archive/rosetta3/tools/segcomscanner.p \
                          /home/rosetta/archive/rosetta3/tools/segcomscanner.pf \
                          /home/rosetta/archive/rosetta3/tools/segcomlangspec.pf \
                          /home/rosetta/archive/rosetta3/tools/segcomdecl.pf \
                          /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools segcomscanner
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/segcomparser.o : /home/rosetta/archive/rosetta3/tools/segcomparser.p \
                         /home/rosetta/archive/rosetta3/tools/segcomparser.pf \
                         /home/rosetta/archive/rosetta3/tools/segcomgraphdef.pf \
                         /home/rosetta/archive/rosetta3/tools/segcomrules.pf \
                         /home/rosetta/archive/rosetta3/tools/segcomlangspec.pf \
                         /home/rosetta/archive/rosetta3/tools/segcomdecl.pf  \
                         /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools segcomparser
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/segcomdecl.o : /home/rosetta/archive/rosetta3/tools/segcomdecl.p \
                       /home/rosetta/archive/rosetta3/tools/segcomdecl.pf \
                       /home/rosetta/archive/rosetta3/tools/segcomlangspec.pf \
                       /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools segcomdecl
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/segcomlangspec.o : /home/rosetta/archive/rosetta3/tools/segcomlangspec.p \
                           /home/rosetta/archive/rosetta3/tools/segcomlangspec.pf \
                           /home/rosetta/archive/rosetta3/general/string.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools segcomlangspec
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/segcomgraph.o : /home/rosetta/archive/rosetta3/tools/segcomgraph.p \
                        /home/rosetta/archive/rosetta3/tools/segcomgraph.pf \
                        /home/rosetta/archive/rosetta3/tools/segcomlangspec.pf \
                        /home/rosetta/archive/rosetta3/tools/segcomdecl.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools segcomgraph
  
  
#!!  
  
  
/home/rosetta/archive/rosetta3/tools/segcomgraphdef.o : /home/rosetta/archive/rosetta3/tools/segcomgraphdef.p \
                           /home/rosetta/archive/rosetta3/tools/segcomgraphdef.pf \
                           /home/rosetta/archive/rosetta3/tools/segcomgraph.pf \
                           /home/rosetta/archive/rosetta3/tools/segcomlangspec.pf \
                           /home/rosetta/archive/rosetta3/tools/segcomdecl.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools segcomgraphdef
  
  
#!! in the next section the opt file of segmrules is not merged  
#!! with the opt file for segcomrules, because only the definition  
#!! file of segmrules is used.  
  
  
/home/rosetta/archive/rosetta3/tools/segcomrules.o : /home/rosetta/archive/rosetta3/tools/segcomrules.p \
                        /home/rosetta/archive/rosetta3/tools/segcomrules.pf \
                        /home/rosetta/archive/rosetta3/tools/segcomlangspec.pf \
                        /home/rosetta/archive/rosetta3/tools/segcomdecl.pf \
                        /home/rosetta/archive/rosetta3/general/string.pf \
                        /home/rosetta/archive/rosetta3/general/str.pf \
                        /home/rosetta/archive/rosetta3/general/segmrules.pf \
                        /home/rosetta/archive/rosetta3/general/limorfdef.pf \
                        /home/rosetta/archive/rosetta3/general/ldstrtotype.pf;
	@/home/rosetta/archive/rosetta3/actions/pas tools segcomrules
  
  
#!!  
  
surfcom : 
	@ ! integration target
  
#!!  
  
vandale : convstart \
          tools/target/conv.exe;
	@ ! no action
  
convstart : tools/target/conv.dcl;
	@actions/dcl tools conv
  
  
  
tools/target/conv.o : tools/target/conv.p;
	@/home/rosetta/archive/rosetta3/actions/pas tools conv
  
#!!  
  
# list the integration targets of this component  
integrate_vandale : 
	@ ! no action needed
  
# include the description files of the parts of this component  
 
/home/rosetta/archive/rosetta3/general/logname.o : /home/rosetta/archive/rosetta3/general/logname.p \
                    /home/rosetta/archive/rosetta3/general/logname.pf \
                    /home/rosetta/archive/rosetta3/general/string.pf \
                    /home/rosetta/archive/rosetta3/unix/cisam.pf;
	@/home/rosetta/archive/rosetta3/actions/pas general logname
 
