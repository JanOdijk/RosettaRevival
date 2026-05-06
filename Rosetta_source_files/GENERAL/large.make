
integrate :  tools/mopttoopt.exe \
             tools/genmake.exe \
             tools/genscommentdata.exe \
             tools/genmcommenttext.exe \
             tools/genscommenttext.exe \
             tools/genmcommentdata.exe \
             tools/lexedcontrol.exe \
             tools/lockinit.exe \
             general/control.exe \
             Xw/Xw.exe \
             Xw/Xlex.exe \
             Xw/lexed.uid \
             Xw/windows.uid ; 
	$(MAKE) -f dutch/target/descrip.make dutch/target/integrate language=dutch
	$(MAKE) -f english/target/descrip.make english/target/integrate language=english
	$(MAKE) -f spanish/target/descrip.make spanish/target/integrate language=spanish



# Rosetta integration targets
# ---------------------------

dutch/integrate :   dutch/mrucom.exe \
                    dutch/amglue.sro \
                    dutch/aprefix.sro \
                    dutch/asuffix.sro \
                    dutch/alglue.sro \
                    dutch/arglue.sro \
                    dutch/analysis.exe \
                    dutch/generation.exe \
                    dutch/lexed.exe;

english/integrate : english/mrucom.exe \
                     english/amglue.sro \
                     english/arglue.sro \
                     english/asuffix.sro \
                     english/alglue.sro \
                     english/aprefix.sro \
                     english/analysis.exe \
                     english/generation.exe \
                     english/lexed.exe;

spanish/integrate : spanish/mrucom.exe \
                    spanish/amglue.sro \
                    spanish/arglue.sro \
                    spanish/asuffix.sro \
                    spanish/alglue.sro \
                    spanish/aprefix.sro \
                    spanish/generation.exe \
                    spanish/lexed.exe;



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


general/level.o : general/level.p \
                  general/level.pf \
                  general/wnd.pf \
                  Xw/Xid.h \
                  Xw/Sid.h \
                  general/interfaces.pf ;
	@actions/pas general level

general/loop.o  : general/loop.p \
                  general/loop.pf \
                  general/oldtree.pf \
                  general/wnd.pf \
                  general/rectoscreen.pf \
                  general/drawtreeset.pf \
                  general/debugmparser.pf \
                  general/debugmgenerator.pf \
                  general/drawtree.pf \
                  Xw/Xid.h \
                  Xw/Sid.h ;
	@actions/pas general loop

general/lastactive.o : general/lastactive.p \
                       general/lastactive.pf \
                       general/level.pf \
                       general/wnd.pf \
                       Xw/Xid.h \
                       Xw/Sid.h \
                       general/globdef.pf \
                       general/interfaces.pf ;
	@actions/pas general lastactive                        

general/drawtreeset.o : general/drawtreeset.p \
                        general/drawtreeset.pf \
                        general/listree.pf \
                        general/oldtree.pf \
                        general/loop.pf \
                        general/wnd.pf \
                        Xw/Xid.h \
                        Xw/Sid.h \
                        general/drawtree.pf \
                        general/drawstree.pf \
                        general/globdef.pf \
                        general/lidomaint.pf \
                        general/error.pf ;
	@actions/pas general drawtreeset                        

unix/cisam.o : unix/cisam.c \
		unix/gendef.h \
		unix/cisam.h \
		unix/paspar.h ;
	@actions/c unix cisam

tools/genmake.o : tools/genmake.p \
                  general/string.pf \
                  unix/cisam.pf \
                  general/logname.pf ;
	@actions/pas tools genmake


tools/mopttoopt.o : tools/mopttoopt.p \
                  general/string.pf \
                  unix/cisam.pf \
                  general/logname.pf ;
	@actions/pas tools mopttoopt



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
              tools/findmkey.exe \
              tools/mkeycheck.exe;
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
                     

config : dutch/config.sys;
	@actions/sys dutch config
 
 
$(language)/domain.new : $(language)/lsmruquo.opt  \
                        $(language)/lsauxdom.opt  \
                        $(language)/mrucom.exe;
	@ ! no action needed yet
 
 
#!                    dutch:testconstraints.exe 
#!! include the description files of the parts of this component 
 
 
 
#!! the dependencies of this component 
 
#!! list the integration targets of this component 
 
integrate_english : 
	@ ! no action needed yet
 
 
integrate_english_2 : english/toggle.opt  \
                      english/morftest.exe \
                      english/asuffix.sro \
                      english/arglue.sro \
                      english/amglue.sro \
                      english/sdict.dat \
                      english/fixid.dat \
                      english/mdict.dat \
                      english/blex.dat \
                      english/analysis.exe \
                      english/generation.exe \
                      english/lexview.exe  \
                      english/lexed.exe  \
                      english/isfmerge.exe  \
                      configeng;
	@ ! no action needed yet
 
#!! include the description files of the parts of this component 
 
 
configeng : english/config.sys;
	@actions/sys english config
#!! the dependencies of this component 
 
#!! list the integration targets of this component 
 
integrate_general : 
	@ ! echo "no action needed"
 
#!! 
#!!aidderiv.opt and gidderiv.opt are mentioned because including them in the 
#!!dependencies would result in a loop 
#!! 
 
integrate_general_2 : general/aidderiv.opt  \
                      general/gidderiv.opt  \
                      general/limatches.opt  \
                      general/strtokey.opt  \
                      dutch/ldblex.opt  \
                      english/ldblex.opt  \
                      spanish/ldblex.opt  \
                      general/limatches.opt  \
                      dutch/genblexisf.exe  \
                      dutch/genblexdict.exe  \
                      general/dutchdutch.opt  \
                      english/genblexisf.exe  \
                      english/genblexdict.exe  \
                      general/dutchenglish.opt  \
                      spanish/genblexisf.exe  \
                      spanish/genblexdict.exe  \
                      general/dutchspanish.opt  \
                      general/englishspanish.opt  \
                      general/englishenglish.opt  \
                      general/abort.opt  \
                      morftest  \
                      general/morftestquestion.exe  \
                      dutch/convert.opt \
                      english/convert.opt \
                      spanish/convert.opt;
	@ ! no action needed
 
 
morftest : general/morftest.dcl;
	@actions/dcl general morftest
 
 
 
 
 
 
 
 
 
#!! include the description files of the parts of this component 
 
 
 
$(language)/lexed.o : tools/lexed.p \
                                  tools/lexedaux.pf \
                                  Xw/Xid.h \
                                  $(language)/lslexed.pf \
                                  unix/mb.pf \
                                  general/globdef.pf \
                                  general/limorfdef.pf \
                                  unix/cisam.pf \
                                  unix/renamefixid.pf \
                                  $(language)/lsphondef.pf \
                                  $(language)/lsdomaint.pf \
                                  general/lidomaint.pf \
                                  $(language)/lstypetostr.pf \
                                  $(language)/lsstrtotype.pf \
                                  $(language)/maket.pf \
                                  general/interface1.pf \
                                  general/mem.pf \
                                  general/log.pf \
                                  general/string.pf \
                                  general/str.pf \
                                  general/files.pf \
                                  general/error.pf \
                                  general/windows.pf \
                                  general/ldtypetostr.pf \
                                  general/ldstrtotype.pf \
                                  general/rectoscreen.pf \
                                  general/ldconvrec.pf \
                                  general/listree.pf \
                                  general/lsstree.pf \
                                  general/strtokey.pf \
                                  general/strtomkey.pf \
                                  general/ldgetkey.pf \
                                  general/ldmdict.pf \
                                  general/lifixiddict.pf \
                                  general/ldblex.pf \
                                  general/lisdict.pf \
                                  general/lisiddict.pf \
                                  general/liiddict.pf \
                                  general/liildict.pf \
                                  general/liscomment.pf \
                                  general/limcomment.pf \
                                  general/lilock.pf;
	@actions/pas tools lexed $(language)
 
 
 
$(language)/lexview.o : tools/lexview.p \
                                  tools/lexedaux.pf \
                                  Xw/Xid.h \
                                  $(language)/lslexed.pf \
                                  unix/mb.pf \
                                  general/globdef.pf \
                                  general/limorfdef.pf \
                                  unix/cisam.pf \
                                  $(language)/lsphondef.pf \
                                  $(language)/lsdomaint.pf \
                                  general/lsconstraints.pf \
                                  general/lidomaint.pf \
                                  $(language)/lstypetostr.pf \
                                  $(language)/lsstrtotype.pf \
                                  $(language)/maket.pf \
                                  general/interface1.pf \
                                  general/mem.pf \
                                  general/log.pf \
                                  general/string.pf \
                                  general/str.pf \
                                  general/files.pf \
                                  general/error.pf \
                                  general/windows.pf \
                                  general/ldtypetostr.pf \
                                  general/ldstrtotype.pf \
                                  general/rectoscreen.pf \
                                  general/ldconvrec.pf \
                                  general/listree.pf \
                                  general/lsstree.pf \
                                  general/strtokey.pf \
                                  general/strtomkey.pf \
                                  general/ldgetkey.pf \
                                  general/ldmdict.pf \
                                  general/lifixiddict.pf \
                                  general/ldblex.pf \
                                  general/lisdict.pf \
                                  general/lisiddict.pf \
                                  general/liiddict.pf \
                                  general/liildict.pf \
                                  general/liscomment.pf \
                                  general/limcomment.pf \
                                  general/lilock.pf;
	@actions/pas tools lexview $(language)
 
#!! 
 
tools/lexedaux.o : tools/lexedaux.p \
                                  tools/lexedaux.pf \
                                  general/globdef.pf \
                                  general/mem.pf \
                                  general/log.pf \
                                  general/string.pf \
                                  Xw/Xid.h  \
                                  Xw/Sid.h  \
                                  general/str.pf \
                                  general/wnd.pf \
                                  general/windows.pf;
	@actions/pas tools lexedaux 
 
 
#!! 
 
general/liscomment.o : general/liscomment.p \
                                  general/string.pf \
                                  unix/cisam.pf;
	@actions/pas general liscomment 
 
 
#!! 
 
general/limcomment.o : general/limcomment.p \
                                  general/string.pf \
                                  unix/cisam.pf;
	@actions/pas general limcomment 
 
 
#!! 
 
$(language)/lslexed.o : $(language)/lslexed.p \
                                  $(language)/lslexed.pf \
                                  $(language)/lsphondef.pf \
                                  tools/lexedaux.pf \
                                  Xw/Xid.h \
                                  unix/mb.pf \
                                  general/wnd.pf \
                                  general/windows.pf;
	@actions/pas $(language) lslexed 
 
 
#!! 
 
 
tools/lexedcontrol.o : tools/lexedcontrol.p \
                                  tools/lexedaux.pf \
                                  Xw/Xid.h \
                                  unix/mb.pf \
                                  general/globdef.pf \
                                  general/string.pf \
                                  unix/pc.pf \
                                  unix/globbuf.pf \
                                  general/windows.pf;
	@actions/pas tools lexedcontrol 
 
#!! 
 
 
tools/initdutch.o : tools/initdutch.p \
                                  unix/mb.pf \
                                  general/globdef.pf \
                                  unix/pc.pf;
	@actions/pas tools initdutch 
 
#!! 
 
 
tools/initenglish.o : tools/initenglish.p \
                                  unix/mb.pf \
                                  general/globdef.pf \
                                  unix/pc.pf;
	@actions/pas tools initenglish 
 
#!! 
 
 
tools/initspanish.o : tools/initspanish.p \
                                  unix/mb.pf \
                                  general/globdef.pf \
                                  unix/pc.pf;
	@actions/pas tools initspanish 
 
#!! 
 
general/lilock.o : general/lilock.p \
                                  unix/cisam.pf;
	@actions/pas general lilock 
 
 
#!! 
 
 
tools/lockinit.o : tools/lockinit.p \
                                  general/logname.pf \
                                  general/lilock.pf;
	@actions/pas tools lockinit 
 
#!! 
 
 
$(language)/genblexdict.o : tools/genblexdict.p \
                                  general/globdef.pf \
                                  unix/cisam.pf \
                                  $(language)/lsdomaint.pf \
                                  general/lidomaint.pf \
                                  $(language)/lstypetostr.pf \
                                  $(language)/maket.pf \
                                  general/mem.pf \
                                  general/log.pf \
                                  general/string.pf \
                                  general/str.pf \
                                  general/files.pf \
                                  general/error.pf \
                                  general/windows.pf \
                                  general/ldtypetostr.pf \
                                  general/ldconvrec.pf \
                                  general/listree.pf \
                                  general/lsstree.pf \
                                  general/strtokey.pf \
                                  general/ldblex.pf;
	@actions/pas tools genblexdict $(language)
#!! 
 
 
 
$(language)/genblexisf.o : tools/genblexisf.p \
                                  general/globdef.pf \
                                  $(language)/lsdomaint.pf \
                                  general/lsconstraints.pf \
                                  general/interface1.pf \
                                  general/mem.pf \
                                  general/log.pf \
                                  general/string.pf \
                                  general/str.pf \
                                  general/files.pf \
                                  general/ldstrtotype.pf \
                                  general/ldidpatterns.pf \
                                  general/ldconvrec.pf \
                                  $(language)/lsconvattr.pf \
                                  general/strtokey.pf \
                                  general/ldblex.pf \
                                  general/lisdict.pf;
	@actions/pas tools genblexisf $(language)
#!! 
 
 
$(language)/ldlexconvert.o : $(language)/ldlexconvert.p \
                                  general/mdictdef.pf \
                                  $(language)/lsmorfdef.pf \
                                  general/limorfdef.pf \
                                  general/files.pf \
                                  general/string.pf;
	@actions/pas $(language) ldlexconvert 
 
 
#!! 
 
 
general/genmdicttext.o : tools/genmdicttext.p \
                                  unix/cisam.pf \
                                  general/files.pf \
                                  general/string.pf \
                                  tools/ldlexconvert.pf \
                                  general/strtokey.pf \
                                  general/ldmdict.pf \
	                          general/mdictdef.pf;
	@actions/pas tools genmdicttext $(language)
#!! 
 
 
$(language)/genmdictdata.o : tools/genmdictdata.p \
                                  unix/cisam.pf \
                                  general/files.pf \
                                  general/string.pf \
                                  general/interface1.pf \
                                  tools/ldlexconvert.pf \
                                  general/strtokey.pf \
                                  general/ldmdict.pf \
                                  general/mdictdef.pf;
	@actions/pas tools genmdictdata $(language)
#!! 
 
tools/genildicttext.o : tools/genildicttext.p \
                                  unix/cisam.pf \
                                  general/files.pf \
                                  general/string.pf \
                                  general/strtokey.pf \
                                  general/strtomkey.pf \
                                  general/liildict.pf;
	@actions/pas tools genildicttext 
#!! 
 
 
tools/genildictdata.o : tools/genildictdata.p \
                                  unix/cisam.pf \
                                  general/files.pf \
                                  general/string.pf \
                                  general/str.pf \
                                  general/strtokey.pf \
                                  general/strtomkey.pf \
                                  general/liildict.pf;
	@actions/pas tools genildictdata 
#!! 
 
tools/gensiddicttext.o : tools/gensiddicttext.p \
                                  unix/cisam.pf \
                                  general/files.pf \
                                  general/string.pf \
                                  general/strtokey.pf \
                                  general/strtomkey.pf \
                                  general/lisiddict.pf;
	@actions/pas tools gensiddicttext 
#!! 
 
tools/gensiddictdata.o : tools/gensiddictdata.p \
                                  unix/cisam.pf \
                                  general/files.pf \
                                  general/string.pf \
                                  general/str.pf \
                                  general/strtokey.pf \
                                  general/strtomkey.pf \
                                  general/lisiddict.pf;
	@actions/pas tools gensiddictdata 
#!! 
 
tools/genmcommenttext.o : tools/genmcommenttext.p \
                                  unix/cisam.pf \
                                  general/files.pf \
                                  general/string.pf \
                                  general/strtokey.pf \
                                  general/strtomkey.pf \
                                  general/limcomment.pf;
	@actions/pas tools genmcommenttext 
#!! 
 
 
tools/genmcommentdata.o : tools/genmcommentdata.p \
                                  unix/cisam.pf \
                                  general/files.pf \
                                  general/string.pf \
                                  general/str.pf \
                                  general/strtokey.pf \
                                  general/strtomkey.pf \
                                  general/limcomment.pf;
	@actions/pas tools genmcommentdata 
#!! 

tools/genscommenttext.o : tools/genscommenttext.p \
                                  unix/cisam.pf \
                                  general/files.pf \
                                  general/string.pf \
                                  general/strtokey.pf \
                                  general/liscomment.pf;
	@actions/pas tools genscommenttext 
#!! 
 
tools/genscommentdata.o : tools/genscommentdata.p \
                                  unix/cisam.pf \
                                  general/files.pf \
                                  general/string.pf \
                                  general/str.pf \
                                  general/strtokey.pf \
                                  general/liscomment.pf;
	@actions/pas tools genscommentdata 
#!! 
 
 
$(language)/geniddicttext.o : tools/geniddicttext.p \
                                  unix/cisam.pf \
                                  general/files.pf \
                                  general/string.pf \
                                  $(language)/lstypetostr.pf \
                                  $(language)/lsdomaint.pf \
                                  general/strtokey.pf \
                                  general/liiddict.pf;
	@actions/pas tools geniddicttext $(language)
#!! 
 
 
$(language)/geniddictdata.o : tools/geniddictdata.p \
                                  unix/cisam.pf \
                                  general/files.pf \
                                  general/string.pf \
                                  $(language)/lsstrtotype.pf \
                                  general/strtokey.pf \
                                  general/liiddict.pf;
	@actions/pas tools geniddictdata $(language)
#!!  
 
tools/gensdicttext.o : tools/gensdicttext.p \
                                  unix/cisam.pf \
                                  general/files.pf \
                                  general/string.pf \
                                  general/strtokey.pf \
                                  general/lisdict.pf;
	@actions/pas tools gensdicttext 
#!! 
 
 
tools/gensdictdata.o : tools/gensdictdata.p \
                                  unix/cisam.pf \
                                  general/files.pf \
                                  general/string.pf \
                                  general/str.pf \
                                  general/strtokey.pf \
                                  general/lisdict.pf;
	@actions/pas tools gensdictdata 
#!! 
 
#!! ---------------module atransfer--------------------------------!!! 
 
 
 
general/atransfer.o : general/atransfer.p  \
                  general/atransfer.pf  \
			  general/debug.pf  \
			  general/superdtree.pf \
			  general/mem.pf \
			  general/string.pf \
			  general/globdef.pf \
			  unix/mb.pf \
			  general/log.pf \
                          general/wnd.pf \
			  Xw/Xid.h \
			  Xw/Sid.h \
			  general/error.pf \
			  general/ldmdict.pf \
			  general/hiltree.pf \
			  interlingua/liilrules.pf \
			  general/liildict.pf \
			  general/ldanilrules.pf \
			  general/listree.pf \
			  general/alayout.pf \
			  general/limorfdef.pf \
			  general/interfaces.pf \
			  general/interface1.pf \
   	                  general/ldmrules.pf;
	@actions/pas general atransfer
 
 
 
#!! ---------------module gtransfer--------------------------------!!! 
 
 
 
general/gtransfer.o : general/gtransfer.p  \
         general/gtransfer.pf  \
         general/hyperdtree.pf  \
         general/debug.pf  \
         general/log.pf  \
         general/hiltree.pf  \
         general/interfaces.pf  \
         general/lidomaint.pf  \
         interlingua/liilrules.pf  \
         general/liildict.pf  \
         general/ldgenilrules.pf  \
         general/ldmrules.pf;
	@actions/pas general gtransfer
 
 
 
 
 
#!! ---------------module hiltree--------------------------------!!! 
 
 
general/hiltree.o : general/hiltree.p  \
         general/hiltree.pf  \
         interlingua/liilrules.pf  \
         unix/globbuf.pf  \
         general/log.pf  \
                        general/mem.pf  \
         general/debug.pf;
	@actions/pas general hiltree
 
 
 
#!! ---------------module liildict--------------------------------!!! 
 
 
general/liildict.o : general/liildict.p \
         unix/cisam.pf  \
         general/liildict.pf  \
         general/globdef.pf  \
         general/log.pf  \
         general/debug.pf;
	@actions/pas general liildict
 
 
 
 
#!! ---------------module lisiddict--------------------------------!! 
 
 
general/lisiddict.o : general/lisiddict.p \
         unix/cisam.pf  \
         general/lisiddict.pf  \
         general/globdef.pf  \
         general/log.pf  \
         general/debug.pf;
	@actions/pas general lisiddict
 
 
 
 
#!! ---------------module liiddict--------------------------------!! 
 
 
general/liiddict.o : general/liiddict.p \
         unix/cisam.pf  \
         general/liiddict.pf  \
         general/globdef.pf  \
         general/log.pf  \
         general/debug.pf;
	@actions/pas general liiddict
 
 
 
#!! ---------------module segmrules--------------------------------!!! 
 
 
 
general/segmrules.o : general/segmrules.p \
                        general/segmrules.pf \
                        general/log.pf \
                        general/files.pf;
	@actions/pas general segmrules
 
#!! ---------------module asegmrules--------------------------------!!! 
 
 
 
general/asegmrules.o : general/asegmrules.p \
                        general/asegmrules.pf \
                        general/segmrules.pf \
                        general/string.pf \
                        general/limorfdef.pf \
                        general/mem.pf  \
                        general/debug.pf;
	@actions/pas general asegmrules
 
#!! ---------------module gsegmrules--------------------------------!!! 
 
 
 
general/gsegmrules.o : general/gsegmrules.p \
                        general/gsegmrules.pf \
                        general/segmrules.pf \
                        general/string.pf \
                        general/limorfdef.pf \
                        general/mem.pf  \
                        general/debug.pf;
	@actions/pas general gsegmrules
 
#!!---------------------------------------------!!! 
 
 
general/test.o : general/test.p \
                   general/asegmrules.pf \
                   general/gsegmrules.pf \
                   general/globdef.pf \
                   general/string.pf \
                   general/str.pf \
                   general/printerf.pf \
                   general/log.pf \
                   general/alayout.pf \
                   general/drawstree.pf \
                   general/debug.pf \
                   general/interface0.pf \
                   general/interface1.pf \
                   general/interface7.pf \
                   general/interface8.pf \
                   general/interface1to7.pf \
                   general/interfaces.pf \
                   general/amorph.pf \
                   general/gmorph.pf \
                   general/asegm.pf \
                   general/alex.pf \
                   general/alextree.pf \
                   general/glextree.pf \
                   general/glex.pf \
                   general/gsegm.pf \
                   general/glayout.pf \
                   general/ldmdict.pf;
	@actions/pas general test
 
 
 
 
general/asegm.o : general/asegm.p \
                    general/asegm.pf \
                    general/string.pf \
                    general/config.pf \
                    general/asegmrules.pf \
                    general/segmrules.pf \
                    general/globdef.pf \
                    general/limorfdef.pf \
                    general/interface1.pf \
                    general/interface0.pf \
                    general/ldmorfdef.pf \
                    general/ldmdict.pf \
                    general/ldsucc.pf \
                    general/debug.pf \
                    general/lifixiddict.pf;
	@actions/pas general asegm
 
 
 
#!!!!!!!!!!!!!!!!!!!ldmorfdef!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
$(language)/ldmorfdef.o : $(language)/ldmorfdef.p \
                            general/ldmorfdef.pf \
                            $(language)/lsmorfdef.pf \
                            $(language)/lsphondef.pf \
                            general/limorfdef.pf \
                            general/interface0.pf \
                            general/asegm.pf \
                            general/string.pf;
	@actions/pas $(language) ldmorfdef
 
 
 
#!!!!!!!!!!!!!!!!!!!lsphondef!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
 
$(language)/lsphondef.o : $(language)/lsphondef.p \
                            $(language)/lsphondef.pf \
                            general/mem.pf  \
                            general/ldconvrec.pf;
	@actions/pas $(language) lsphondef
 
#!!!!!!!!!!!!!!!!!!!mdictdef!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
 
$(language)/mdictdef.o : general/mdictdef.p \
                           general/mdictdef.pf \
                           $(language)/lsphondef.pf \
                           general/limorfdef.pf \
                           general/interface1.pf \
                           general/ldmdict.pf \
                           general/ldconvrec.pf;
	@actions/pas general mdictdef $(language)
 
#!!!!!!!!!!!!!!!!!!!ldmdict!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
$(language)/ldmdict.o :   general/ldmdict.p \
                            general/ldmdict.pf \
                            general/limorfdef.pf \
                            $(language)/lsphondef.pf \
                            general/interface1.pf \
                            general/globdef.pf \
                            general/string.pf \
                            general/debug.pf \
                            $(language)/lsphondef.pf \
                            general/mdictdef.pf \
                            unix/cisam.pf;
	@actions/pas general ldmdict $(language)
 
 
 
#!!!!!!!!!!!!!!!!!!!ldidpatterns!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
$(language)/ldidpatterns.o :   $(language)/ldidpatterns.p \
                            general/ldidpatterns.pf \
                            $(language)/lsstrtotype.pf \
                            $(language)/lsdomaint.pf;
	@actions/pas $(language) ldidpatterns 
 
 
#!!!!!!!!!!!!!!!!!!!alex!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
general/alex.o : general/alex.p \
                   general/alex.pf \
                   general/string.pf \
                   general/ldaffixlex.pf \
                   general/ldblex.pf \
                   general/ldgluelex.pf \
                   general/listree.pf \
                   general/interface1.pf \
                   general/debug.pf \
                   general/lisdict.pf;
	@actions/pas general alex
 
 
 
#!!!!!!!!!!!!!!!!!!!alextree!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
general/alextree.o : general/alextree.p \
                       general/alextree.pf \
                       general/listree.pf \
                       general/interface0.pf \
                       general/interface1.pf \
                       general/anlexif.pf \
                       general/mem.pf \
                       general/globdef.pf \
                       general/drawstree.pf \
                       general/ldcatsets.pf \
                       general/debug.pf;
	@actions/pas general alextree
 
 
 
#!!!!!!!!!!!!!!!!!!!ldaffixlex!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
$(language)/ldaffixlex.o : general/ldaffixlex.p \
                             general/ldaffixlex.pf \
                             general/listree.pf \
                             general/lidomaint.pf \
                             general/ldblex.pf \
                             general/ldcatsets.pf \
                             general/ldgetkey.pf \
                             general/lsstree.pf \
                             $(language)/lsdomaint.pf \
                             $(language)/maket.pf;
	@actions/pas general ldaffixlex $(language)
 
 
#!!!!!!!!!!!!!!!!!!!ldgluelex!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
$(language)/ldgluelex.o :  general/ldgluelex.p \
                             general/ldgluelex.pf \
                             general/listree.pf \
                             general/lidomaint.pf \
                             general/lsstree.pf \
                             $(language)/lsdomaint.pf \
                             $(language)/maket.pf;
	@actions/pas general ldgluelex $(language)
 
 
 
#!!!!!!!!!!!!!!!!!!!ldblex!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
$(language)/ldblex.o : general/ldblex.p \
                         general/ldblex.pf \
                         general/listree.pf \
                         general/lsstree.pf \
                         $(language)/lsdomaint.pf \
                         $(language)/maket.pf \
                         unix/cisam.pf \
                         general/mem.pf  \
                         general/ldgetkey.pf;
	@actions/pas general ldblex $(language) 
 
 
 
#!!------------------amorph---------------------------!! 
 
 
general/amorph.o : general/amorph.p \
                   general/amorph.pf \
                   general/debug.pf \
                   general/error.pf \
                   general/log.pf \
                   general/interfaces.pf \
                   general/interface0.pf \
                   general/interface1.pf \
                   general/alayout.pf \
                   general/asegm.pf \
                   general/wnd.pf \
                   Xw/Xid.h \
                   Xw/Sid.h \
                   general/alex.pf \
                   general/alextree.pf;
	@actions/pas general amorph
 
 
#!!!!!!!!!!!!!!!!!!!glextree!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
general/glextree.o : general/glextree.p \
                       general/glextree.pf \
                       general/listree.pf \
                       general/interface7.pf \
                       general/genlexif.pf \
                       general/drawstree.pf \
                       general/str.pf \
                       general/ldtypetostr.pf \
                       general/ldcatsets.pf \
                       general/string.pf \
                       general/debug.pf \
                       general/ldaffixlex.pf \
                       general/ldgluelex.pf;
	@actions/pas general glextree
 
 
 
 
#!!!!!!!!!!!!!!!!!!!ldgetkey!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
$(language)/ldgetkey.o : $(language)/ldgetkey.p \
                         general/ldgetkey.pf \
                         general/listree.pf \
                         general/lsstree.pf \
                         $(language)/lsdomaint.pf;
	@actions/pas $(language) ldgetkey
 
 
#!!!!!!!!!!!!!!!!!!!glex!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
general/glex.o : general/glex.p \
                   general/glex.pf \
                   general/string.pf \
                   general/ldgetkey.pf \
                   general/listree.pf \
                   general/interface7.pf \
                   general/interface1.pf \
                   general/ldaffixlex.pf \
                   general/ldgluelex.pf \
                   general/lisdict.pf \
                   general/debug.pf;
	@actions/pas general glex
 
 
 
#!!!!!!!!!!!!!!!!!!!gsegm!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
general/gsegm.o : general/gsegm.p \
                    general/gsegm.pf \
                    general/string.pf \
                    general/config.pf \
                    general/segmrules.pf \
                    general/gsegmrules.pf \
                    general/globdef.pf \
                    general/limorfdef.pf \
                    general/interface1.pf \
                    general/interface8.pf \
                    general/interface7.pf \
                    general/ldmorfdef.pf \
                    general/ldmdict.pf \
                    general/debug.pf;
	@actions/pas general gsegm
 
 
 
#!!!!!!!!!!!!!!!!!!!!!!!!!!!drawstree!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
general/drawstree.o : general/drawstree.p \
                        general/drawstree.pf \
                        general/drawtree.pf \
                        general/oldtree.pf \
                        general/globdef.pf \
                        general/wnd.pf \
                        Xw/Xid.h \
                        Xw/Sid.h \
                        general/lidomaint.pf \
                        general/listree.pf;
	@actions/pas general drawstree
 
 
 
#!!!!!!!!!!!!!!!!!!!!!!lirectoscreen!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
general/lirectoscreen.o : general/lirectoscreen.p \
                            general/lirectoscreen.pf \
                            general/ldconvrec.pf \
                            general/windows.pf;
	@actions/pas general lirectoscreen
 
 
 
 
#!!!!!!!!!!!!!!!!!!!!!!rectoscreen!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
general/rectoscreen.o : general/rectoscreen.p \
                            general/rectoscreen.pf \
                            general/string.pf \
                            general/str.pf \
                            general/files.pf \
                            general/strtokey.pf \
                            general/strtomkey.pf \
                            general/error.pf \
                            general/listree.pf \
                            general/ldconvrec.pf \
                            general/wnd.pf \
                            Xw/Xid.h \
                            Xw/Sid.h \
                            general/globsubst.pf \
                            general/drawstree.pf \
                            general/drawtree.pf \
                            general/ldgetkey.pf \
                            general/mem.pf  \
                            general/ldcatsets.pf;
	@actions/pas general rectoscreen
 
# below, rectoscreen.opt does not depend on drawstree.opt because this 
# would introduce a cycle 
 
 
#!!!!!!!!!!!!!!!!!!!!!!testdict!!!!!!!!!!!!!! 
 
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!glayout!!!!!!!!!!!!!!!!!!! 
 
 
general/glayout.o : general/glayout.p \
                     general/glayout.pf \
                     general/string.pf \
                     general/str.pf \
                     general/globdef.pf \
                     general/wnd.pf \
                     Xw/Xid.h \
                     Xw/Sid.h \
                     general/interface8.pf \
                     general/interface1.pf \
                     general/interfaces.pf \
                     unix/globbuf.pf;
	@actions/pas general glayout
 
 
 
#!!------------------gmorph---------------------------!! 
 
 
general/gmorph.o : general/gmorph.p \
                   general/gmorph.pf \
                   general/interfaces.pf \
                   general/gsegm.pf \
                   general/glex.pf \
                   general/glextree.pf;
	@actions/pas general gmorph
 
 
 
#!!!--------------------morftest------------------------------!! 
 
 
general/morftest.o : general/morftest.p \
                   general/asegmrules.pf \
                   general/gsegmrules.pf \
                   general/globdef.pf \
                   general/printerf.pf \
                   general/config.pf \
                   general/log.pf \
                   general/alayout.pf \
                   general/drawstree.pf \
                   general/debug.pf \
                   general/interface1to7.pf \
                   general/interfaces.pf \
                   general/amorph.pf \
                   general/gmorph.pf \
                   general/glayout.pf \
                   general/ldmdict.pf \
                   general/ldsucc.pf \
                   general/ldblex.pf \
                   general/lifixiddict.pf \
                   general/lisdict.pf;
	@actions/pas general morftest
 
 
 
#!!!--------------------mgrammartest------------------------------!! 
 
 
general/mgrammartest.o : general/mgrammartest.p \
                   general/asegmrules.pf \
                   general/gsegmrules.pf \
                   general/globdef.pf \
                   general/printerf.pf \
                   general/log.pf \
                   general/alayout.pf \
                   general/drawstree.pf \
                   general/debug.pf \
                   general/interface1to7.pf \
                   general/interfaces.pf \
                   general/amorph.pf \
                   general/gmorph.pf \
                   general/glayout.pf \
                   general/ldmdict.pf \
                   general/ldsucc.pf \
                   general/ldblex.pf \
                   general/lifixiddict.pf \
                   general/lisdict.pf \
                   general/lisiddict.pf \
                   general/strtokey.pf \
                   general/limrules.pf \
                   general/ldanmrules.pf \
                   general/ldgenmrules.pf \
                   general/ldmrules.pf \
                   general/interface3to5.pf \
                   general/surfparser.pf \
                   general/mparser.pf \
                   general/debugmparser.pf \
                   general/debugmgenerator.pf \
                   general/mgenerator.pf \
                   general/linearizer.pf \
                   general/windows.pf;
	@actions/pas general mgrammartest
 
 
 
#!!!!!!!!!!!!!!!!!!!ldsucc!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
$(language)/ldsucc.o : $(language)/ldsucc.p \
                         general/mem.pf  \
                         $(language)/lsdomaint.pf;
	@actions/pas $(language) ldsucc
 
 
#!!!!!!!!!!!!!!!!!!!lisdict!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
general/lisdict.o :   general/lisdict.p \
                        general/lisdict.pf \
                        general/debug.pf \
                        unix/cisam.pf;
	@actions/pas general lisdict general
 
 
 
#!!!!!!!!!!!!!!!!!!!!!!fixiddict!!!!!!!!!!!!!! 
 
 
 
tools/fixidgen.o : tools/fixidgen.p \
                     general/files.pf \
                     general/lifixiddict.pf \
                     unix/cisam.pf;
	@actions/pas tools fixidgen
 
 
#!!!!!!!!!!!!!!!!!!!lifixiddict!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
general/lifixiddict.o : general/lifixiddict.p \
                          general/lifixiddict.pf \
                          general/debug.pf \
                          general/interface0.pf \
                          general/string.pf \
                          general/alayout.pf  \
                          unix/cisam.pf;
	@actions/pas general lifixiddict general
 
 
#!!!!!!!!!!!!!!!!!!!!!!tools:dictgen!!!!!!!!!!!!!! 
 
 
tools/dictgen.o : tools/dictgen.p \
                    general/strtokey.pf \
                    general/globdef.pf \
                    general/string.pf \
                    general/files.pf \
                    general/ldmdict.pf \
                    general/liildict.pf \
                    general/lisiddict.pf \
                    general/liiddict.pf \
                    general/ldidpatterns.pf \
                    general/str.pf \
                    unix/cisam.pf;
	@actions/pas tools dictgen
 
 
#!!!!!!!!!!!!!!!!!!!!!!tools:newdictgen!!!!!!!!!!!!!! 
 
 
$(language)/newdictgen.o : tools/newdictgen.p \
                    general/strtokey.pf \
                    general/strtomkey.pf \
                    general/globdef.pf \
                    general/string.pf \
                    general/files.pf \
                    general/ldmdict.pf \
                    general/liildict.pf \
                    general/lisiddict.pf \
                    general/lisdict.pf \
                    general/liiddict.pf \
                    general/liscomment.pf \
                    general/limcomment.pf \
                    general/ldidpatterns.pf \
                    general/ldblex.pf \
                    general/lsconstraints.pf \
                    $(language)/lsdomaint.pf \
                    $(language)/lsconvattr.pf \
                    $(language)/lsphondef.pf \
                    general/mdictdef.pf \
                    general/ldconvrec.pf \
                    general/limorfdef.pf \
                    general/ldstrtotype.pf \
                    general/interface1.pf \
                    general/str.pf \
                    general/mem.pf;
	@actions/pas tools newdictgen $(language)
 
 
#!!!!!!!!!!!!!!!!!!!!!!tools:constraintgen!!!!!!!!!!!!!! 
 
 
tools/constraintgen.o : tools/constraintgen.p \
                    general/string.pf \
                    general/files.pf \
                    general/str.pf;
	@actions/pas tools constraintgen tools
 
 
#!!!!!!!!!!!!!!!!!!!!!!language: lsconstraints!!!!!!!!!!!!!! 
 
 
$(language)/lsconstraints.o : $(language)/lsconstraints.p \
                               general/lsconstraints.pf \
                                $(language)/lsdomaint.pf \
                                $(language)/lsauxdom.pf \
                                general/files.pf;
	@actions/pas $(language) lsconstraints
 
 
#!!!!!!!!!!!!!!!!!!!!!!tools: strkey!!!!!!!!!!!!!! 
 
 
tools/strkey.o : tools/strkey.p \
                    general/strtokey.pf \
                    general/string.pf \
                    general/files.pf \
                    unix/cisam.pf;
	@actions/pas tools strkey
 
 
#!!!!!!!!!!!!!!!!!!!!!!!!!!!isfinit 
 
 
 
 
$(language)/isfinit.o : tools/isfinit.p \
                         $(language)/lsdomaint.pf \
                         general/mdictdef.pf \
                         general/lisdict.pf \
                         general/liildict.pf \
                         general/lisiddict.pf \
                         general/liiddict.pf \
                         general/liscomment.pf \
                         general/limcomment.pf \
                         unix/cisam.pf;
	@actions/pas tools isfinit $(language)
 
 
#!!!!!!!!!!!!!!!!!!!!!!!!!!!isfmerge 
 
 
 
 
$(language)/isfmerge.o : tools/isfmerge.p \
                         $(language)/lsdomaint.pf \
                         general/mdictdef.pf \
                         general/strtokey.pf \
                         general/lisdict.pf \
                         general/liildict.pf \
                         general/lisiddict.pf \
                         general/liiddict.pf \
                         general/liscomment.pf \
                         general/limcomment.pf \
                         unix/cisam.pf;
	@actions/pas tools isfmerge $(language)
 
 
 
#!!!!!!!!!!!!!!!!!!!!!!!!!!!kdfmerge 
 
 
 
 
tools/kdfmerge.o : tools/kdfmerge.p \
                         general/string.pf \
                         general/strkeyrecdef.pf \
                         unix/cisam.pf;
	@actions/pas tools kdfmerge 
 
 
#!!!!!!!!!!!!!!!!!!!!!!!!!!!mkdfmerge 
 
 
 
 
tools/mkdfmerge.o : tools/mkdfmerge.p \
                         general/string.pf \
                         general/strtomkey.pf \
                         unix/cisam.pf;
	@actions/pas tools mkdfmerge
 
 
#!!-------------------------ildictdef--------!! 
 
 
 
 
#!! -------------------limrules-------------------!! 
 
 
 
general/limrules.o : general/limrules.p \
                       general/limrules.pf \
                       general/mem.pf  \
                       general/ldmrules.pf;
	@actions/pas general limrules
 
 
 
#!!-------------------------strkeyrecdef--------!! 
 
 
 
 
#!! -------------------strtokey-------------------!! 
 
 
 
general/strtokey.o : general/strtokey.p \
                       general/strtokey.pf \
                       general/string.pf \
                       general/strkeyrecdef.pf \
                       general/globdef.pf \
                       unix/cisam.pf;
	@actions/pas general strtokey
 
#!! -------------------mem-------------------!! 
 
 
 
general/mem.o : general/mem.p \
                  general/mem.pf \
                  general/log.pf;
	@actions/pas general mem
 
#!! -------------------awhere-------------------!! 
 
 
 
general/awhere.o : general/awhere.p \
                  general/awhere.pf \
                  general/wnd.pf \
                  Xw/Xid.h \
                  Xw/Sid.h \
                  general/globdef.pf;
	@actions/pas general awhere
 
 
 
#!! -------------------gwhere-------------------!! 
 
 
 
general/gwhere.o : general/gwhere.p \
                  general/gwhere.pf \
                  general/wnd.pf \
                  Xw/Xid.h \
                  Xw/Sid.h \
                  general/globdef.pf;
	@actions/pas general gwhere
 
 
 
#!! -------------------batch-------------------!! 
 
 
 
general/batch.o : general/batch.p \
                  general/batch.pf \
                  general/files.pf \
                  unix/globbuf.pf;
	@actions/pas general batch
 
 
 
#!! -------------------help-------------------!! 
 
 
 
general/help.o : general/help.p \
                   general/help.pf \
                   general/wnd.pf \
                   Xw/Xid.h \
                   Xw/Sid.h \
                   general/globdef.pf;
	@actions/pas general help
 
 
 
#!!!!!!!!!!!!!!!!!!!!!!tools: strmkey!!!!!!!!!!!!!! 
 
 
tools/strmkey.o : tools/strmkey.p \
                    general/strtomkey.pf \
                    general/liildict.pf \
                    general/string.pf \
                    general/files.pf \
                    unix/cisam.pf;
	@actions/pas tools strmkey
 
 
#!! -------------------strtomkey-------------------!! 
 
 
 
general/strtomkey.o : general/strtomkey.p \
                       general/strtomkey.pf \
                       general/string.pf \
                       general/liildict.pf \
                       general/globdef.pf \
                       unix/cisam.pf;
	@actions/pas general strtomkey
 
#!! -------------------config-------------------!! 
 
 
 
general/config.o : general/config.p \
                     general/config.pf \
                     general/str.pf \
                     general/files.pf \
                     general/globdef.pf \
                     general/log.pf;
	@actions/pas general config
 
 
 
 
#!!------------------linearizer--------------------------- 
 
 
general/linearizer.o : general/linearizer.p \
                      general/linearizer.pf \
                      general/interfaces.pf \
                      general/interface6.pf \
                      general/interface7.pf \
                      general/listree.pf  \
                      general/debug.pf  \
                      general/error.pf  \
                      general/log.pf  \
                      general/ldcatsets.pf;
	@actions/pas general linearizer
 
 
 
#!!------------------mparser--------------------------- 
 
 
general/mparser.o : general/mparser.p \
                      general/mparser.pf \
                      general/interfaces.pf \
                      general/interface2.pf \
                      general/interface3.pf \
                      general/listree.pf  \
                      general/superdtree.pf  \
                      general/ldgetkey.pf  \
                      general/ldmrules.pf  \
                      general/ldanmrules.pf  \
                      general/debug.pf  \
                      general/error.pf  \
                      general/log.pf  \
                      general/mem.pf  \
                      general/awhere.pf  \
                      general/wnd.pf  \
                      Xw/Xid.h \
                      Xw/Sid.h \
                      general/limrules.pf  \
                      general/ldcatsets.pf  \
                      general/debugmparser.pf  \
                      general/mpstatistics.pf \
                      general/globsubst.pf \
                      general/drawstree.pf;
	@actions/pas general mparser
 
 
 
#!!------------------mgenerator--------------------------- 
 
 
general/mgenerator.o : general/mgenerator.p \
                      general/mgenerator.pf \
                      general/interfaces.pf \
                      general/interface5.pf \
                      general/interface6.pf \
                      general/listree.pf  \
                      general/hyperdtree.pf  \
                      general/ldgetkey.pf  \
                      general/ldmrules.pf  \
                      general/ldgenmrules.pf  \
                      general/debug.pf  \
                      general/error.pf  \
                      general/log.pf  \
                      general/mem.pf  \
                      general/limrules.pf  \
                      general/ldblex.pf \
                      general/ldsubsttovar.pf \
                      general/debugmgenerator.pf \
                      general/globsubst.pf;
	@actions/pas general mgenerator
 
 
 
#!! --------------module superdtree------------------------------ 
 
 
general/superdtree.o : general/superdtree.p  \
                        general/mem.pf  \
                      general/superdtree.pf;
	@actions/pas general superdtree
 
 
 
#!! --------------module hyperdtree------------------------------ 
 
 
general/hyperdtree.o : general/hyperdtree.p  \
                        general/mem.pf  \
                      general/hyperdtree.pf;
	@actions/pas general hyperdtree
 
 
 
#!!------------------ldmrules--------------------------- 
 
 
$(language)/ldmrules.o : $(language)/ldmrules.p \
                           general/ldmrules.pf \
                           general/limatches.pf \
                           general/mem.pf  \
                           general/ldconvrec.pf \
                           $(language)/lsparams.pf \
                           general/rectoscreen.pf \
                           $(language)/lstypetostr.pf \
                           general/globdef.pf \
                           general/windows.pf \
                           $(language)/lsmruquo.pf \
                           $(language)/lsdomaint.pf \
                           general/ldsubgrammars.pf;
	@actions/pas $(language) ldmrules
 
 
#!! above mrules107 and mrules117 contain idiom rules, all such files should be added. 
#!! in general:rene.mms these files are also handled somewhat differently 
 
#!!------------------ldanmrules--------------------------- 
 
 
$(language)/ldanmrules.o : $(language)/ldanmrules.p \
                           general/ldanmrules.pf \
                           general/ldmrules.pf \
                           general/mem.pf  \
                           general/limatches.pf \
                           general/listree.pf \
                           general/lidomaint.pf \
                           $(language)/lsdomaint.pf \
                           $(language)/lsparams.pf;
	@actions/pas $(language) ldanmrules
 
#! i left out dependencies of decommrulesi.pf, i=1..50, because  
#! already ldanmrules.p is taken to depend on these. 
 
 
 
#!!------------------ldgenmrules--------------------------- 
 
 
$(language)/ldgenmrules.o : $(language)/ldgenmrules.p \
                           general/ldgenmrules.pf \
                           general/ldmrules.pf \
                           general/listree.pf \
                           general/lidomaint.pf \
                           $(language)/lsdomaint.pf \
                           $(language)/lsparams.pf;
	@actions/pas $(language) ldgenmrules
 
#! i left out dependencies of commrulesi.pf, i=1..50, because  
#! already ldgenmrules.p is taken to depend on these. 
 
 
 
#!!!!!!!!!!!!!!!!!!!interfaces!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
 
#!!!!!!!!!!!!!!!!!!!interface0!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
general/interface0.o : general/interface0.p \
                         general/interface0.pf \
                         general/mem.pf  \
                         general/string.pf \
                         general/limorfdef.pf \
                         general/interface1.pf;
	@actions/pas general interface0
 
 
 
#!!!!!!!!!!!!!!!!!!!interface1!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
general/interface1.o : general/interface1.p \
                         general/interface1.pf \
                         general/mem.pf  \
                         general/limorfdef.pf;
	@actions/pas general interface1
 
 
 
#!!!!!!!!!!!!!!!!!!!interface2!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
 
#!!!!!!!!!!!!!!!!!!!interface3!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
 
#!!!!!!!!!!!!!!!!!!!interface4!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
 
#!!!!!!!!!!!!!!!!!!!interface5!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
 
#!!!!!!!!!!!!!!!!!!!interface6!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
 
#!!!!!!!!!!!!!!!!!!!interface7!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
general/interface7.o : general/interface7.p \
                         general/interface7.pf \
                         general/mem.pf  \
                         general/interface1.pf;
	@actions/pas general interface7
 
 
 
#!!!!!!!!!!!!!!!!!!!interface8!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
general/interface8.o : general/interface8.p \
                         general/interface8.pf \
                         general/string.pf \
                         general/mem.pf  \
                         general/limorfdef.pf;
	@actions/pas general interface8
 
 
 
#!!!!!!!!!!!!!!!!!!!interface1to7!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
general/interface1to7.o : general/interface1to7.p \
                            general/interface1to7.pf \
                            general/interfaces.pf \
                            general/interface7.pf \
                            general/interface1.pf;
	@actions/pas general interface1to7
 
 
#!!!!!!!!!!!!!!!!!!!interface2to6!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
general/interface2to6.o : general/interface2to6.p \
                            general/interface2to6.pf \
                            general/interfaces.pf \
                            general/interface6.pf \
                            general/interface2.pf;
	@actions/pas general interface2to6
 
 
#!!!!!!!!!!!!!!!!!!!interface3to5!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
general/interface3to5.o : general/interface3to5.p \
                            general/interface3to5.pf \
                            general/interfaces.pf \
                            general/interface5.pf \
                            general/interface3.pf \
                            general/hyperdtree.pf \
                            general/superdtree.pf;
	@actions/pas general interface3to5
 
 
#!!!!!!!!!!!!!!!!!!!interface4to4!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
general/interface4to4.o : general/interface4to4.p \
                            general/interface4to4.pf \
                            general/interfaces.pf \
                            general/interface4.pf;
	@actions/pas general interface4to4
 
 
#!!!!!!!!!!!-----------------printerf------------------------------ 
 
 
general/printerf.o : general/printerf.p \
                       general/printerf.pf \
                       general/printerf1.pf \
                       general/printerf2.pf  \
                       general/printerf3.pf  \
                       general/printerf4.pf  \
                       general/printerf5.pf  \
                       general/printerf6.pf  \
                       general/printerf7.pf \
                       general/wnd.pf \
                       Xw/Xid.h \
                       Xw/Sid.h \
                       general/interfaces.pf;
	@actions/pas general printerf
 
 
 
#!!!!!!!!!!!-----------------printerf1------------------------------ 
 
 
general/printerf1.o : general/printerf1.p \
                        general/printerf1.pf \
                        general/drawstree.pf \
                        general/interface1.pf \
                        general/interfaces.pf \
                        general/wnd.pf \
                        Xw/Xid.h \
                        Xw/Sid.h \
                        general/globdef.pf;
	@actions/pas general printerf1
 
 
 
#!!!!!!!!!!!-----------------printerf2------------------------------ 
 
 
general/printerf2.o : general/printerf2.p \
                        general/printerf2.pf \
                        general/drawstree.pf \
                        general/listree.pf  \
                        general/interface2.pf \
                        general/interfaces.pf;
	@actions/pas general printerf2
 
 
 
#!!!!!!!!!!!-----------------printerf3------------------------------ 
 
 
general/printerf3.o : general/printerf3.p \
                        general/printerf3.pf \
                        general/drawsuperdtree.pf \
                        general/interface3.pf \
                        general/interfaces.pf;
	@actions/pas general printerf3
 
 
 
#!!!!!!!!!!!-----------------printerf4------------------------------ 
 
 
general/printerf4.o : general/printerf4.p \
                        general/printerf4.pf \
                        general/drawhiltree.pf \
                        general/interface4.pf \
                        general/interfaces.pf;
	@actions/pas general printerf4
 
 
 
#!!!!!!!!!!!-----------------printerf5------------------------------ 
 
 
general/printerf5.o : general/printerf5.p \
                        general/printerf5.pf \
                        general/drawhyperdtree.pf \
                        general/interface5.pf \
                        general/interfaces.pf;
	@actions/pas general printerf5
 
 
 
#!!!!!!!!!!!-----------------printerf6------------------------------ 
 
 
general/printerf6.o : general/printerf6.p \
                        general/printerf6.pf \
                        general/drawstree.pf \
                        general/interface6.pf \
                        general/interfaces.pf;
	@actions/pas general printerf6
 
 
 
#!!!!!!!!!!!-----------------printerf7------------------------------ 
 
 
general/printerf7.o : general/printerf7.p \
                        general/printerf7.pf \
                        general/drawstree.pf \
                        general/interface7.pf \
                        general/interfaces.pf;
	@actions/pas general printerf7
 
 
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!error!!!!!!!!!!!!!!!!!!! 
 
 
general/error.o : general/error.p \
                    general/error.pf \
                    general/globdef.pf \
                    general/string.pf \
                    general/wnd.pf \
                    Xw/Xid.h \
                    Xw/Sid.h;
	@actions/pas general error
 
 
#!!!!!!!!!!!-----------------debug------------------------------ 
 
 
general/debug.o : general/debug.p \
                    general/debug.pf \
                    general/globdef.pf \
                    general/string.pf \
                    general/wnd.pf \
                    Xw/Xid.h \
                    Xw/Sid.h;
	@actions/pas general debug
 
 
 
#!!!!!!!!!!!!!!!!!!!prproc!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
$(language)/prproc.o : $(language)/prproc.p \
                         general/prproc.pf \
                         general/listree.pf \
                         general/lsstree.pf \
                         $(language)/lsdomaint.pf;
	@actions/pas $(language) prproc
 
 
 
#!!!!!!!!!!!!!!!!!!!!!!!!!!!drawsuperdtree!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
general/drawsuperdtree.o : general/drawsuperdtree.p \
                        general/drawsuperdtree.pf \
                        general/drawtree.pf \
                        general/oldtree.pf \
                        general/mem.pf  \
                        general/globdef.pf \
                        general/superdtree.pf;
	@actions/pas general drawsuperdtree
 
 
 
#!!!!!!!!!!!!!!!!!!!!!!!!!!!drawhyperdtree!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
general/drawhyperdtree.o : general/drawhyperdtree.p \
                        general/drawhyperdtree.pf \
                        general/drawtree.pf \
                        general/mem.pf  \
                        general/oldtree.pf \
                        general/globdef.pf \
                        general/hyperdtree.pf;
	@actions/pas general drawhyperdtree
 
 
 
#!!!!!!!!!!!!!!!!!!!!!!!!!!!drawhiltree!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
general/drawhiltree.o : general/drawhiltree.p  \
                          general/oldtree.pf   \
   			general/drawtree.pf   \
			general/drawhiltree.pf  \
			general/hiltree.pf  \
  			general/globdef.pf;
	@actions/pas general drawhiltree
 
 
 
#!!------------------debugmparser--------------------------- 
 
 
general/debugmparser.o : general/debugmparser.p \
                      general/debugmparser.pf \
                      general/listree.pf  \
                      general/ldmrules.pf  \
                      general/drawstree.pf  \
                      general/drawtreeset.pf  \
                      general/error.pf  \
                      general/loop.pf  \
                      general/wnd.pf  \
                      Xw/Xid.h  \
                      Xw/Sid.h  \
                      general/globdef.pf  \
                      general/string.pf \
                      general/str.pf;
	@actions/pas general debugmparser
 
 
#!!------------------debugmgenerator--------------------------- 
 
 
general/debugmgenerator.o : general/debugmgenerator.p \
                      general/debugmgenerator.pf \
                      general/listree.pf  \
                      general/ldmrules.pf  \
                      general/drawtreeset.pf  \
                      general/error.pf  \
                      general/loop.pf  \
                      general/wnd.pf  \
                      Xw/Xid.h  \
                      Xw/Sid.h  \
                      general/globdef.pf  \
                      general/string.pf \
                      general/str.pf;
	@actions/pas general debugmgenerator
 
 
#!!------------------mpstatistics--------------------------- 
 
 
general/mpstatistics.o : general/mpstatistics.p \
                      general/mpstatistics.pf \
                      general/wnd.pf  \
                      Xw/Xid.h  \
                      Xw/Sid.h  \
                      general/globdef.pf;
	@actions/pas general mpstatistics
 
 
#!!------------------globsubst--------------------------- 
 
 
general/globsubst.o : general/globsubst.p \
                      general/globsubst.pf \
                      general/listree.pf;
	@actions/pas general globsubst
 
 
 
general/aidderiv.o : general/aidderiv.p  \
                      general/aidderiv.pf  \
                      general/mparser.o;
	@actions/pas general aidderiv
 
 
 
general/gidderiv.o : general/gidderiv.p  \
                      general/gidderiv.pf  \
                      general/mgenerator.o;
	@actions/pas general gidderiv
 
 
 
 
$(language)/ldsubgrammars.o : $(language)/ldsubgrammars.p \
                           general/ldsubgrammars.pf  \
                           $(language)/helpsubgrammars.pf  \
                           general/ldmrules.pf;
	@actions/pas $(language) ldsubgrammars
 
 
 
 
$(language)/helpsubgrammars.o : $(language)/helpsubgrammars.p \
                           $(language)/helpsubgrammars.pf  \
                           general/ldmrules.pf;
	@actions/pas $(language) helpsubgrammars
 
 
 
 
# -----------generation of the modules lsparams,ldmrules,ldanmrules ldgenmrules and--- 
# ---------- ldsubgrammars the sources are really commrules"i".env, but are taken to be---- 
# ---------- the .pf versions of these so that these files need not be ----- 
# ---------- repeated as sources of ldgenmrules.obj, ldmrules.obj, ldanmrules.obj-- 
 
 
 
 
#--removed from dependencies of decommrulesa.opt:  general:limatches.opt 
#                                                  general:strtokey.opt 
 
 
 
 
#--removed from dependencies of commrulesa.opt:  general:limatches.opt 
#                                                general:strtokey.opt 
 
 
 
#!!_________module lsmruquo, pascal procedures for mrules------------- 
 
 
$(language)/lsmruquo.o : $(language)/lsmruquo.p  \
                           $(language)/lsmruquo.pf  \
                        $(language)/lsdomaint.pf  \
                        general/lsstree.pf  \
                        $(language)/maket.pf  \
                        $(language)/lsauxdom.pf  \
                        general/ldcatsets.pf \
                        general/strtokey.pf \
                        $(language)/copyt.pf  \
                        general/ldgetkey.pf  \
                        general/liiddict.pf;
	@actions/pas $(language) lsmruquo
 
 
 
#!!_________module lsmatches, limatches, matching functions for mrules------------- 
 
 
$(language)/lsmatches.o : general/lsmatches.p  \
                         general/lsmatches.pf  \
                         $(language)/lsmruquo.pf  \
                         general/lsstree.pf  \
                         general/string.pf  \
                         general/strtokey.pf  \
                         general/ldmeasuresize.pf  \
                         $(language)/lsdomaint.pf  \
                         general/limatches.pf;
	@actions/pas general lsmatches $(language)
 
 
 
general/limatches.o : general/limatches.p  \
                        general/limatches.pf  \
                        general/lidomaint.pf  \
                        general/lisiddict.pf  \
                        general/liiddict.pf  \
                        general/listree.pf;
	@actions/pas general limatches
 
 
 
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
 
general/analysis.o : general/analysis.p \
                       general/awhere.pf \
                       general/help.pf \
                       unix/mb.pf \
                       unix/pc.pf \
                       unix/sockipc.pf \
                       unix/globbuf.pf \
                       general/log.pf \
                       general/mem.pf \
                       general/string.pf \
                       general/config.pf \
                       general/asegmrules.pf \
                       general/wnd.pf \
                       Xw/Xid.h \
                       Xw/Sid.h \
                       general/liiddict.pf \
                       general/liildict.pf \
                       general/lisdict.pf \
                       general/lisiddict.pf \
                       general/logname.pf \
                       general/level.pf \
                       general/lastactive.pf \
                       general/interfaces.pf \
                       general/strtokey.pf \
                       general/strtomkey.pf \
                       general/lifixiddict.pf \
                       general/ldmdict.pf \
                       general/ldblex.pf \
                       general/printerf.pf \
                       general/debug.pf \
                       general/drawstree.pf \
                       general/alayout.pf \
                       general/amorph.pf \
                       general/globdef.pf \
                       general/surfparser.pf  \
                       general/mparser.pf  \
                       general/debugmparser.pf  \
                       general/ldsucc.pf  \
                       general/limrules.pf  \
                       general/ldmrules.pf \
                       general/ldanmrules.pf \
                       general/atransfer.pf \
                       general/drawtree.pf  \
                       general/oldtree.pf  \
                       general/loop.pf  \
                       general/hiltree.pf;
	@actions/pas general analysis
 
#!!!!!!!!!!!!!!!!! 
 
 
 
general/globdef.o : general/globdef.p \
                      general/globdef.pf;
	@actions/pas general globdef
 
#!!! 
 
 
general/alayout.o : general/alayout.p \
                     general/alayout.pf \
                     general/string.pf \
                     general/help.pf \
                     general/str.pf \
                     unix/globbuf.pf \
                     general/globdef.pf \
                     general/wnd.pf \
                     Xw/Xid.h \
                     Xw/Sid.h \
                     general/interface0.pf \
                     general/interfaces.pf;
	@actions/pas general alayout
 
 
 
 
#!! the dependencies of this component  
 
#!! 
 
 
# waarom staat hier het rijtje van lisdict tot en met ldblex???? 
 
general/generation.o : general/generation.p \
                       unix/mb.pf \
                       unix/pc.pf \
                       unix/sockipc.pf \
                       unix/globbuf.pf \
                       general/log.pf \
                       general/logname.pf \
                       general/config.pf \
                       general/mem.pf \
                       general/gwhere.pf \
                       general/string.pf \
                       general/gsegmrules.pf \
                       general/wnd.pf \
                       Xw/Xid.h \
                       Xw/Sid.h \
                       general/liiddict.pf \
                       general/liildict.pf \
                       general/lisdict.pf \
                       general/lisiddict.pf \
                       general/strtokey.pf \
                       general/strtomkey.pf \
                       general/lifixiddict.pf \
                       general/lastactive.pf \
                       general/interfaces.pf \
                       general/ldmdict.pf \
                       general/ldblex.pf \
                       general/printerf.pf \
                       general/debug.pf \
                       general/drawstree.pf \
                       general/glayout.pf \
                       general/gmorph.pf \
                       general/globdef.pf \
                       general/linearizer.pf  \
                       general/debugmgenerator.pf  \
                       general/mgenerator.pf  \
                       general/ldsucc.pf  \
                       general/limrules.pf  \
                       general/ldgenmrules.pf \
                       general/ldmrules.pf \
                       general/gtransfer.pf \
                       general/hiltree.pf  \
                       general/drawtree.pf  \
                       general/oldtree.pf  \
                       general/loop.pf  \
                       general/hyperdtree.pf  \
                       general/listree.pf;
	@actions/pas general generation
 
#!! 
 
 
 
#!! 
 
 
general/clock.o : general/clock.p \
                    general/clock.pf;
	@actions/pas general clock
 
 
#!! 
 
 
general/abort.o : general/abort.p \
                    general/abort.pf  \
                    general/files.pf;
	@actions/pas general abort
 
 
#!! 
 
control : general/control.exe;
	@ ! no action needed
 
 
 
general/control.o : general/control.p \
                      unix/mb.pf \
                      unix/pc.pf \
                      unix/sockipc.pf \
                      general/log.pf \
                      general/interfaces.pf \
                      general/logname.pf \
                      general/str.pf \
                      general/wnd.pf \
                      Xw/Xid.h \
                      Xw/Sid.h \
                      general/globdef.pf \
                      general/batch.pf \
                      general/level.pf \
                      general/lastactive.pf;
	@actions/pas general control
 
#!! 
 
 
general/files.o : general/files.p  \
                    general/files.pf  \
                    general/string.pf  \
                    general/str.pf;
	@actions/pas general files
 
 
#!! 
 
 
general/log.o : general/log.p \
                  general/log.pf \
                  general/files.pf \
                  general/globdef.pf;
	@actions/pas general log
 
 
#!! 
 
 
unix/mb.o : unix/mb.c \
                 unix/mb.h \
                 unix/gendef.h \
                 unix/logc.h \
		 unix/globdef.h \
		 unix/sockipc.h \
		 unix/paspar.h ;
	@actions/c unix mb
 
 
#!! 
 
unix/globbuf.o : unix/globbuf.c \
                 unix/globbuf.h \
		 unix/gendef.h \
		 unix/logc.h \
		 unix/mkkey.h ;
	@actions/c unix globbuf

 
 
#!! 
 
unix/renamefixid.o : unix/renamefixid.c \
                 unix/renamefixid.h \
		 unix/gendef.h \
		 unix/logc.h \
		 unix/mkkey.h \
		 unix/paspar.h ;
	@actions/c unix renamefixid

 
 
#!! 
 
unix/logc.o : unix/logc.c \
              unix/logc.h \
              unix/gendef.h \
              unix/paspar.h ;
	@actions/c unix logc

 
 
#!! 
 
unix/mkkey.o : unix/mkkey.c \
              unix/mkkey.h \
              unix/gendef.h \
              unix/logc.h ;
	@actions/c unix mkkey

 
#!! 
 
unix/paspar.o : unix/paspar.c \
              unix/paspar.h \
              unix/gendef.h ;
	@actions/c unix paspar
 
#!! 
 
unix/wch.o : unix/wch.c \
              unix/wch.h \
	      unix/wchdef.h \
              unix/gendef.h \
	      unix/logc.h ;
	@actions/c unix wch

unix/wchdef.h : unix/wchdef.def ;
	@rm -f $@
	@actions/stripdef unix wchdef
 
#!! 

unix/wipc.o : unix/wipc.c \
              unix/wipc.h \
              unix/sockipc.h \
              unix/gendef.h \
	      unix/mkkey.h \
	      unix/logc.h ;
	@actions/c unix wipc

 
#!! 

unix/sockipc.o : unix/sockipc.c \
              unix/sockipc.h \
              unix/gendef.h \
	      unix/mkkey.h \
	      unix/logc.h ;
	@actions/c unix sockipc

 
#!! 
 
 
unix/pc.o : unix/pc.c \
                 unix/pc.h \
                 unix/gendef.h \
                 unix/globdef.h \
                 unix/paspar.h \
                 unix/logc.h ;
	@actions/c unix pc
 
 
#!! 
 
 
general/str.o : general/str.p \
                  general/str.pf;
	@actions/pas general str
 
 
#!! 
 
 
general/string.o : general/string.p \
                     general/string.pf;
	@actions/pas general string
 
 
#!! 
 
 
general/windows.o : general/windows.p  \
                      general/wnd.pf  \
                      Xw/Xid.h  \
                      Xw/Sid.h  \
                      general/string.pf  \
                      general/str.pf;
	@actions/pas general windows


general/wnd.o : general/wnd.p  \
                general/wnd.pf \
                Xw/Xid.h  \
                Xw/Sid.h  \
                unix/wch.pf \
                unix/wchdef.h \
                unix/logc.pf \
                general/string.pf;
	@actions/pas general wnd
 
 
 
$(language)/ldstrtotype.o : $(language)/ldstrtotype.p \
                              general/ldstrtotype.pf \
                              general/limorfdef.pf \
                              general/str.pf \
                              general/lidomaint.pf \
                              $(language)/lsdomaint.pf;
	@actions/pas $(language) ldstrtotype $(language) 
 
 
 
#!! --------------module ldtypetostr------------------------------ 
 
 
$(language)/ldtypetostr.o : $(language)/ldtypetostr.p \
                              general/ldtypetostr.pf \
                              general/limorfdef.pf \
                              general/str.pf \
                              general/lidomaint.pf \
                              $(language)/lsdomaint.pf;
	@actions/pas $(language) ldtypetostr $(language) "/nooptimize"
 
 
 
#!! --------------module ldcatsets------------------------------ 
 
 
$(language)/ldcatsets.o : $(language)/ldcatsets.p \
                              general/ldcatsets.pf \
                              general/lidomaint.pf;
	@actions/pas $(language) ldcatsets $(language) "/nooptimize"
 
 
#!! --------------module ldequal------------------------------ 
 
 
$(language)/ldequal.o : $(language)/ldequal.p \
                              general/ldequal.pf \
                              $(language)/lsdomaint.pf  \
                              general/lsstree.pf  \
                              general/listree.pf;
	@actions/pas $(language) ldequal $(language) "/nooptimize"
 
 
#!!----------------module ldstrtostr-------------------- 
 
 
$(language)/ldstrtostr.o : $(language)/ldstrtostr.p  \
                             general/ldstrtostr.pf  \
                             general/string.pf;
	@actions/pas $(language) ldstrtostr
 
 
#!!-----------------module maket--------------------------- 
 
 
$(language)/maket.o : $(language)/maket.p  \
                        $(language)/maket.pf  \
                        $(language)/lsdomaint.pf  \
                        general/mem.pf  \
                        general/lsstree.pf  \
                        general/listree.pf;
	@actions/pas $(language) maket
 
 
#!!-----------------module copyt--------------------------- 
 
 
$(language)/copyt.o : $(language)/copyt.p  \
                        $(language)/copyt.pf  \
                        $(language)/lsdomaint.pf;
	@actions/pas $(language) copyt
 
 
 
#!! --------------module lidomaint------------------------------ 
 
 
 
 
#!! --------------module lsdomaint------------------------------ 
 
 
 
 
 
 
 
 
#!! --------------auxiliary domain ------------------------------ 
 
 
$(language)/lsauxdom.o : $(language)/lsauxdom.p \
                            $(language)/lsauxdom.pf \
                            general/string.pf \
                            general/strtokey.pf \
                            general/files.pf \
                            $(language)/lsdomaint.pf;
	@actions/pas $(language) lsauxdom
 
 
 
$(language)/ldsubsttovar.o : $(language)/ldsubsttovar.p \
                               general/listree.pf \
                               $(language)/maket.pf \
                               general/lsstree.pf \
                               $(language)/lsdomaint.pf;
	@actions/pas $(language) ldsubsttovar
 
 
#!! -------------module limorfdef------------------------------- 
 
 
 
 
#!! -------------module lsmorfdef------------------------------- 
 
 
 
 
#!! --------------module listree------------------------------ 
 
 
general/listree.o : general/listree.p  \
                      general/mem.pf  \
                      general/listree.pf;
	@actions/pas general listree
 
 
#!! --------------module lsstree------------------------------ 
 
 
 
 
 
#!!------------------modules lexrules----------------------- 
 
 
 
$(language)/comlexrules1.o : $(language)/comlexrules1.p  \
                            $(language)/comlexrules1.pf  \
                            $(language)/lsdomaint.pf  \
                            $(language)/maket.pf  \
                            $(language)/copyt.pf  \
                            general/listree.pf  \
                            general/ldblex.pf \
                            general/strtokey.pf \
                            general/lsstree.pf;
	@actions/pas $(language) comlexrules1
 
$(language)/decomlexrules1.o : $(language)/decomlexrules1.p  \
                              $(language)/decomlexrules1.pf  \
                              $(language)/lsdomaint.pf  \
                              $(language)/maket.pf  \
                              $(language)/copyt.pf  \
                              general/listree.pf  \
                              general/ldblex.pf \
                              general/strtokey.pf \
                              general/lsstree.pf;
	@actions/pas $(language) decomlexrules1
 
 
 
 
 
$(language)/comlexrules2.o : $(language)/comlexrules2.p  \
                            $(language)/comlexrules2.pf  \
                            $(language)/lsdomaint.pf  \
                            $(language)/maket.pf  \
                            $(language)/copyt.pf  \
                            general/ldblex.pf \
                            general/strtokey.pf \
                            general/listree.pf  \
                            general/lsstree.pf;
	@actions/pas $(language) comlexrules2
 
$(language)/decomlexrules2.o : $(language)/decomlexrules2.p  \
                              $(language)/decomlexrules2.pf  \
                              $(language)/lsdomaint.pf  \
                              $(language)/maket.pf  \
                              $(language)/copyt.pf  \
                              general/ldblex.pf \
                              general/strtokey.pf \
                              general/listree.pf  \
                              general/lsstree.pf;
	@actions/pas $(language) decomlexrules2
 
 
 
 
 
$(language)/comlexrules3.o : $(language)/comlexrules3.p  \
                            $(language)/comlexrules3.pf  \
                            $(language)/lsdomaint.pf  \
                            $(language)/maket.pf  \
                            $(language)/copyt.pf  \
                            general/ldblex.pf \
                            general/strtokey.pf \
                            general/listree.pf  \
                            general/lsstree.pf;
	@actions/pas $(language) comlexrules3
 
$(language)/decomlexrules3.o : $(language)/decomlexrules3.p  \
                              $(language)/decomlexrules3.pf  \
                              $(language)/lsdomaint.pf  \
                              $(language)/maket.pf  \
                              general/ldblex.pf \
                              general/strtokey.pf \
                              $(language)/copyt.pf  \
                              general/listree.pf  \
                              general/lsstree.pf;
	@actions/pas $(language) decomlexrules3
 
 
 
# -------------------modules anlexif and genlexif---------------------- 
 
 
 
$(language)/anlexif.o : $(language)/anlexif.p  \
                      general/anlexif.pf  \
                      general/mem.pf  \
                      $(language)/comlexrules1.pf  \
                      $(language)/comlexrules2.pf  \
                      $(language)/comlexrules3.pf  \
                      general/listree.pf  \
                      general/lidomaint.pf;
	@actions/pas $(language) anlexif
 
$(language)/genlexif.o : $(language)/genlexif.p  \
                      general/genlexif.pf  \
                      general/mem.pf  \
                      $(language)/decomlexrules1.pf  \
                      $(language)/decomlexrules2.pf  \
                      $(language)/decomlexrules3.pf  \
                      general/listree.pf  \
                      general/lidomaint.pf;
	@actions/pas $(language) genlexif
 
 
 
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
 
general/drawtree.o : general/drawtree.p \
                       general/drawtree.pf \
                       general/oldtree.pf \
                       general/wnd.pf \
                       general/loop.pf \
                       Xw/Xid.h \
                       Xw/Sid.h \
                       general/mem.pf  \
                       general/error.pf  \
                       general/string.pf;
	@actions/pas general drawtree
 
 
 
#                      $(language):ldmrules.opt 
 
 
 
 
#                      general:ldmrules.pf 
 
general/oldtree.o : general/oldtree.p \
                      general/oldtree.pf \
                      general/str.pf \
                      general/string.pf \
                      general/strtokey.pf \
                      general/strtomkey.pf \
                      general/wnd.pf \
                      Xw/Xid.h \
                      Xw/Sid.h \
                      general/mem.pf \
                      general/loop.pf \
                      general/error.pf \
                      general/superdtree.pf \
                      general/hyperdtree.pf \
                      general/hiltree.pf \
                      general/listree.pf \
                      interlingua/liilrules.pf \
                      general/rectoscreen.pf \
                      general/ldmrules.pf \
                      general/ldconvrec.pf \
                      general/globdef.pf \
                      general/ldtypetostr.pf;
	@actions/pas general oldtree
 
 
 
 
#!!-----------------module lstypetostr--------------------------- 
 
 
$(language)/lstypetostr.o : $(language)/lstypetostr.p  \
                              $(language)/lsdomaint.pf  \
                              $(language)/lstypetostr.pf  \
                              general/str.pf;
	@actions/pas $(language) lstypetostr
 
 
#!!-----------------module lsstrtotype--------------------------- 
 
 
$(language)/lsstrtotype.o : $(language)/lsstrtotype.p  \
                              $(language)/lsdomaint.pf  \
                              $(language)/lsstrtotype.pf  \
                              general/str.pf;
	@actions/pas $(language) lsstrtotype
 
 
#!!!!!!!!!!!!!!!!!!!ldconvrec!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
$(language)/ldconvrec.o : $(language)/ldconvrec.p \
                            $(language)/lsdomaint.pf \
                            general/ldconvrec.pf \
                            general/ldtypetostr.pf \
                            general/listree.pf \
                            general/mem.pf  \
                            general/lsstree.pf \
                            $(language)/lsconvattr.pf \
                            $(language)/lsconvrec.pf \
                            general/string.pf;
	@actions/pas $(language) ldconvrec
 
 
 
#!!-----------------module lsconvrec--------------------------- 
 
 
$(language)/lsconvrec.o : $(language)/lsconvrec.p  \
                            $(language)/lsdomaint.pf  \
                            $(language)/lsconvrec.pf  \
                            $(language)/lstypetostr.pf  \
                            general/mem.pf  \
                            general/ldconvrec.pf \
                            general/str.pf;
	@actions/pas $(language) lsconvrec
 
 
#!!-----------------module lsconvattr---------------------------!! 
 
 
$(language)/lsconvattr.o : $(language)/lsconvattr.p  \
                            $(language)/lsdomaint.pf  \
                            $(language)/lsconvattr.pf  \
                            $(language)/maket.pf  \
                            $(language)/lsstrtotype.pf  \
                            general/ldconvrec.pf \
                            general/str.pf  \
                            general/lidomaint.pf  \
                            general/ldstrtotype.pf;
	@actions/pas $(language) lsconvattr
 
 
#!! ------------- surface parser and surface rules ------------------ 
#!!                         $(language):liownmem.opt 
#!!    @actions:merge_opt $(language) surfparser $(language) liownmem 
 
 
 
general/surfparser.o : general/surfparser.p  \
                          general/surfparser.pf  \
                          general/ldsurfswitch.pf  \
                          general/lidomaint.pf  \
                          general/ldmeasuresize.pf  \
                          general/mem.pf  \
                          general/awhere.pf  \
                          general/alayout.pf  \
                          general/interfaces.pf  \
                          general/interface1.pf  \
                          general/interface2.pf  \
                          general/liprims.pf  \
                          general/ldprims.pf  \
                          general/items.pf  \
                          general/surfrules.pf  \
                          general/ldtypetostr.pf  \
                          general/ldcatsets.pf  \
                          general/ldequal.pf  \
                          general/drawstree.pf  \
                          general/surfrulesgraphs.pf  \
                          general/debug.pf;
	@actions/pas general surfparser
 
 
 
 
$(language)/ldownmem.o : $(language)/ldownmem.p  \
                       general/ldownmem.pf  \
                       general/lidomaint.pf  \
                       $(language)/lsdomaint.pf;
	@actions/pas $(language) ldownmem
 
 
 
general/liprims.o : general/liprims.p  \
                      general/liprims.pf  \
                      general/ldprims.pf  \
                      general/mem.pf  \
                      general/lidomaint.pf  \
                      general/items.pf  \
                      general/listree.pf;
	@actions/pas general liprims
 
 
 
 
$(language)/ldprims.o : $(language)/ldprims.p  \
                          general/ldprims.pf  \
                          general/liprims.pf  \
                          general/items.pf;
	@actions/pas $(language) ldprims
 
 
 
$(language)/surfrulesgraphs.o : $(language)/surfrulesgraphs.p  \
                                  general/surfrulesgraphs.pf  \
                                  general/lidomaint.pf  \
                                  general/liprims.pf;
	@actions/pas $(language) surfrulesgraphs
 
 
 
$(language)/surfrules.o : $(language)/surfrules.p  \
                            general/surfrules.pf  \
                            $(language)/lssurfquo.pf  \
                            general/liprims.pf  \
                            general/listree.pf  \
                            general/strtokey.pf  \
                            general/lsstree.pf  \
                            $(language)/lsdomaint.pf  \
                            $(language)/maket.pf  \
                            $(language)/copyt.pf  \
                            $(language)/lsauxdom.pf  \
                            general/lidomaint.pf;
	@actions/pas $(language) surfrules
 
 
 
$(language)/ldsurfswitch.o : $(language)/ldsurfswitch.p  \
                               general/ldsurfswitch.pf  \
                               general/items.pf  \
                               general/mem.pf  \
                               general/ldsurfswitch.pf  \
                               $(language)/lsrulepars.pf  \
                               general/liprims.pf  \
                               general/listree.pf  \
                               general/lsstree.pf  \
                               $(language)/surfrulesblocks.pf;
	@actions/pas $(language) ldsurfswitch                               
 
 
 
 
$(language)/surfrulesblocks.o : $(language)/surfrulesblocks.p  \
                                  $(language)/surfrulesblocks.pf  \
                                  general/listree.pf  \
                                  $(language)/lsrulepars.pf  \
                                  $(language)/lsdomaint.pf  \
                                  general/lsstree.pf  \
                                  $(language)/maket.pf  \
                                  $(language)/lsdomaint.pf  \
                                  $(language)/lsauxdom.pf  \
                                  general/lsmatches.pf  \
                                  $(language)/lssurfquo.pf  \
                                  general/debug.pf;
	@actions/pas $(language) surfrulesblocks
 
 
 
$(language)/lssurfquo.o : $(language)/lssurfquo.p  \
                            $(language)/lssurfquo.pf  \
                            $(language)/lsdomaint.pf  \
                            general/lsstree.pf  \
                            $(language)/lsrulepars.pf;
	@actions/pas $(language) lssurfquo
 
 
#! 
#! transfer rules 
#!  
 
 
$(language)/ldanilrules.o : $(language)/ldanilrules.p  \
                              general/ldanilrules.pf  \
                              general/hiltree.pf  \
                              interlingua/liilrules.pf  \
                              general/ldmrules.pf  \
                              $(language)/lsparams.pf;
	@actions/pas $(language) ldanilrules
 
 
 
$(language)/ldgenilrules.o : $(language)/ldgenilrules.p  \
                              general/ldgenilrules.pf  \
                              general/mem.pf  \
                              general/hyperdtree.pf  \
                              interlingua/liilrules.pf  \
                              general/ldmrules.pf  \
                              $(language)/lsparams.pf;
	@actions/pas $(language) ldgenilrules
 
 
 
 
general/morftestquestion.o : general/morftestquestion.p  \
                                general/files.pf  \
                                general/string.pf;
	@actions/pas general morftestquestion
 
# 
#----------------ldmeasuresize------- 
# 
 
 
$(language)/ldmeasuresize.o : general/ldmeasuresize.p  \
                            $(language)/lsdomaint.pf;
	@actions/pas general ldmeasuresize $(language)
 
 
# 
#------------toggle.opt-------------------- 
# 
 
 
# list the integration targets of this component 
integrate_interlingua : 
	@ ! no action needed
 
integrate_interlingua_2 : interlingua/liilrules.o;
	@ ! no action needed
 
# include the description files of the parts of this component 
 
 
 
interlingua/liilrules.o : interlingua/liilrules.p  \
                            interlingua/liilrules.pf  \
                            general/rectoscreen.pf  \
                            general/ldconvrec.pf \
                            general/str.pf \
                            general/mem.pf  \
                            general/wnd.pf \
                            Xw/Xid.h \
                            Xw/Sid.h;
	@actions/pas interlingua liilrules
 
 
#!! list the integration targets of this component 
 
integrate_lexicon : 
	@ ! no action needed yet
 
integrate_lexicon_2 : lexicon/select.exe  \
                      lexicon/vandale.opt   \
                      lexicon/setnr.exe  \
                      lexicon/categories.exe  \
                      lexicon/splitdic.exe  \
                      lexicon/setadjs.exe  \
                      lexicon/skipxtra.exe  \
                      lexicon/addreverse.exe  \
                      lexicon/countgperletter.exe  \
                      lexicon/printretro.exe  \
                      lexicon/setplural.exe  \
                      lexicon/setconj.exe  \
                      lexicon/withoutaccent.exe  \
                      lexicon/wordlength.exe  \
                      lexicon/vandaletolatex.exe  \
                      lexicon/vandalesheets.exe  \
                      lexicon/createlex.exe  \
                      lexicon/listlabbrev.exe  \
                      lexicon/whichone.exe  \
                      lexicon/combine.exe  \
                      lexicon/tr_check.exe  \
                      lexicon/make_vd_lemma.exe  \
                      lexicon/genr3noundicts.exe  \
                      lexicon/genr3verbdicts.exe  \
                      lexicon/expand_english_blex.exe   \
                      lexicon/genr3adjdicts.exe  \
                      lexicon/genr3advdicts.exe  \
                      lexicon/r2_subset.exe;
	@ ! no action needed yet
 
#!! include the description files of the parts of this component 
 
#!! the dependencies of this component 
 
 
 
lexicon/tst.o : lexicon/tst.p  \
                     general/str.pf  \
                     general/files.pf  \
                     lexicon/vandale.pf;
	@actions/pas lexicon tst
 
#!! the dependencies of this component 
 
 
 
lexicon/whichone.o : lexicon/whichone.p  \
                     general/str.pf  \
                     general/files.pf  \
                     lexicon/vandale.pf;
	@actions/pas lexicon whichone
 
#!! the dependencies of this component 
 
 
 
lexicon/wordok.o : lexicon/wordok.p  \
                     general/str.pf  \
                     general/files.pf;
	@actions/pas lexicon wordok
 
#!! the dependencies of this component 
 
 
 
lexicon/allwordscat.o : lexicon/allwordscat.p  \
                     general/str.pf  \
                     general/files.pf  \
                     lexicon/vandale.pf;
	@actions/pas lexicon allwordscat
 
 
#!! the dependencies of the program select 
 
 
 
lexicon/select.o : lexicon/select.p  \
                     general/str.pf  \
                     general/files.pf;
	@actions/pas lexicon select
 
#!! the dependencies of the program listlabbrev 
 
 
 
lexicon/listlabbrev.o : lexicon/listlabbrev.p  \
                     general/files.pf  \
                     general/str.pf  \
                     lexicon/vandale.pf;
	@actions/pas lexicon listlabbrev
 
#!! the dependencies of the program getmeanings 
 
 
 
lexicon/getmeanings.o : lexicon/getmeanings.p  \
                     general/files.pf  \
                     general/str.pf  \
                     lexicon/vandale.pf;
	@actions/pas lexicon getmeanings
 
#!! the dependencies of the program getidioms 
 
 
 
lexicon/getidioms.o : lexicon/getidioms.p  \
                     general/files.pf  \
                     general/str.pf  \
                     lexicon/vandale.pf;
	@actions/pas lexicon getidioms
 
#!! the dependencies of the program createlex 
 
 
 
lexicon/createlex.o : lexicon/createlex.p  \
                     general/files.pf  \
                     general/str.pf  \
                     unix/cisam.pf  \
                     lexicon/vandale.pf;
	@actions/pas lexicon createlex
 
#!! the dependencies of the program vandaletolatex 
 
 
 
lexicon/vandaletolatex.o : lexicon/vandaletolatex.p  \
                     general/files.pf  \
                     general/str.pf  \
                     lexicon/vandale.pf;
	@actions/pas lexicon vandaletolatex
 
#!! the dependencies of the program vandalesheets 
 
 
 
lexicon/vandalesheets.o : lexicon/vandalesheets.p  \
                     general/files.pf  \
                     general/str.pf  \
                     lexicon/vandale.pf;
	@actions/pas lexicon vandalesheets
 
#!! the dependencies of the program wordlength 
 
 
 
lexicon/wordlength.o : lexicon/wordlength.p  \
                     general/files.pf  \
                     general/str.pf  \
                     lexicon/vandale.pf;
	@actions/pas lexicon wordlength
 
#!! the dependencies of the program withoutaccent 
 
 
 
lexicon/withoutaccent.o : lexicon/withoutaccent.p  \
                     general/files.pf  \
                     general/str.pf  \
                     lexicon/vandale.pf;
	@actions/pas lexicon withoutaccent
 
#!! the dependencies of the program addreverse 
 
 
 
lexicon/addreverse.o : lexicon/addreverse.p  \
                     general/str.pf  \
                     general/files.pf  \
                     lexicon/vandale.pf;
	@actions/pas lexicon addreverse
 
#!! the dependencies of the program countgperletter 
 
 
 
lexicon/countgperletter.o : lexicon/countgperletter.p  \
                     general/str.pf  \
                     general/files.pf  \
                     lexicon/vandale.pf;
	@actions/pas lexicon countgperletter
 
#!! the dependencies of the program printretro 
 
 
 
lexicon/printretro.o : lexicon/printretro.p  \
                     general/str.pf  \
                     general/files.pf  \
                     lexicon/vandale.pf;
	@actions/pas lexicon printretro
 
#!! the dependencies of the program setnr 
 
 
 
lexicon/setnr.o : lexicon/setnr.p  \
                     general/log.pf  \
                     general/str.pf  \
                     lexicon/vandale.pf  \
                     general/files.pf;
	@actions/pas lexicon setnr
 
#!! the dependencies of the program splitdic 
 
 
 
lexicon/splitdic.o : lexicon/splitdic.p  \
                     general/str.pf  \
                     lexicon/vandale.pf;
	@actions/pas lexicon splitdic
 
#!! the dependencies of the program setadjs 
 
 
 
lexicon/setadjs.o : lexicon/setadjs.p  \
                     general/str.pf  \
                     general/files.pf  \
                     general/windows.pf  \
                     lexicon/vandale.pf;
	@actions/pas lexicon setadjs
 
#!! the dependencies of the program categories 
 
 
 
lexicon/categories.o : lexicon/categories.p  \
                     general/str.pf  \
                     lexicon/vandale.pf;
	@actions/pas lexicon categories
 
#!! the dependencies of the program skipxtra 
 
 
 
lexicon/skipxtra.o : lexicon/skipxtra.p  \
                     general/str.pf  \
                     lexicon/vandale.pf;
	@actions/pas lexicon skipxtra
 
#!! the dependencies of the program setplural 
 
 
 
lexicon/setplural.o : lexicon/setplural.p  \
                     general/str.pf  \
                     lexicon/vandale.pf  \
                     general/files.pf;
	@actions/pas lexicon setplural
 
#!! the dependencies of the program setconj 
 
 
 
lexicon/setconj.o : lexicon/setconj.p  \
                     general/str.pf  \
                     lexicon/vandale.pf  \
                     general/files.pf;
	@actions/pas lexicon setconj
 
#!! the dependencies of the program combine 
 
 
 
lexicon/combine.o : lexicon/combine.p  \
                     general/str.pf  \
                     lexicon/vandale.pf  \
                     general/files.pf;
	@actions/pas lexicon combine
 
#!! the dependencies of the program r2_subset 
 
 
 
lexicon/r2_subset.o : lexicon/r2_subset.p  \
                     general/str.pf  \
                     lexicon/vandale.pf  \
                     general/files.pf;
	@actions/pas lexicon r2_subset
 
#!! the dependencies of the program genr3noundicts 
 
 
 
lexicon/genr3noundicts.o : lexicon/genr3noundicts.p  \
                     general/str.pf  \
                     lexicon/vandale.pf  \
                     general/files.pf;
	@actions/pas lexicon genr3noundicts
 
#!! the dependencies of the program genr3verbdicts 
 
 
 
lexicon/genr3verbdicts.o : lexicon/genr3verbdicts.p  \
                     general/str.pf  \
                     lexicon/vandale.pf  \
                     general/files.pf;
	@actions/pas lexicon genr3verbdicts
 
#!! the dependencies of the program genr3advdicts 
 
 
 
lexicon/genr3advdicts.o : lexicon/genr3advdicts.p  \
                     general/str.pf  \
                     lexicon/vandale.pf  \
                     general/files.pf;
	@actions/pas lexicon genr3advdicts
 
#!! the dependencies of the program genr3adjdicts 
 
 
 
lexicon/genr3adjdicts.o : lexicon/genr3adjdicts.p  \
                     general/str.pf  \
                     lexicon/vandale.pf  \
                     general/files.pf;
	@actions/pas lexicon genr3adjdicts
 
#!! the dependencies of the program tr_check 
 
 
 
lexicon/tr_check.o : lexicon/tr_check.p  \
                     general/str.pf  \
                     lexicon/vandale.pf  \
                     general/files.pf;
	@actions/pas lexicon tr_check
 
#!! the dependencies of the program make_vd_lemma 
 
 
 
lexicon/make_vd_lemma.o : lexicon/make_vd_lemma.p;
	@actions/pas lexicon make_vd_lemma
 
#!! the dependencies of the environment vandale 
 
 
lexicon/vandale.o : lexicon/vandale.p  \
                     lexicon/vandale.pf  \
                     general/str.pf  \
                     general/files.pf;
	@actions/pas lexicon vandale
 
#!! 
 
 
#!! the dependencies of the program expand_english_blex 
 
 
 
lexicon/expand_english_blex.o : lexicon/expand_english_blex.p  \
                     general/str.pf  \
                     lexicon/vandale.pf  \
                     general/files.pf  \
                     lexicon/getrecord.pf;
	@actions/pas lexicon expand_english_blex
 
 
lexicon/getrecord.o : lexicon/getrecord.p  \
                        lexicon/getrecord.pf  \
                        general/str.pf  \
                        dutch/lsdomaint.pf  \
                        general/globdef.pf  \
                        general/mem.pf  \
                        dutch/lsstree.pf  \
                        general/listree.pf  \
                        lexicon/lexblex.pf  \
                        general/liildict.pf  \
                        general/string.pf  \
                        general/strtomkey.pf  \
                        general/strtokey.pf;
	@actions/pas lexicon getrecord
 
 
 
 
#!!!!!!!!!!!!!!!!!!!lexblex!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
 
 
$(language)/lexblex.o : lexicon/lexblex.p \
                         lexicon/lexblex.pf \
                         general/listree.pf \
                         general/lsstree.pf \
                         $(language)/lsdomaint.pf \
                         $(language)/maket.pf \
                         unix/cisam.pf \
                         general/mem.pf  \
                         general/ldgetkey.pf;
	@actions/pas lexicon lexblex $(language) 
 
 
 
 
#!! list the integration targets of this component 
 
integrate_spanish : 
	@ ! no action needed yet
 
integrate_spanish_2 : spanish/toggle.opt \
                      spanish/morftest.exe \
                      spanish/amglue.sro \
                      spanish/arglue.sro \
                      spanish/asuffix.sro \
                      spanish/sdict.dat \
                      spanish/fixid.dat \
                      spanish/mdict.dat \
                      spanish/blex.dat \
                      spanish/generation.exe \
                      spanish/lexview.exe  \
                      spanish/lexed.exe  \
                      spanish/isfmerge.exe  \
                      configspa;
	@ ! no action needed yet
 
#!! the dependencies of this component 
 
configspa : spanish/config.sys;
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
                    tools/edtcom.exe  \
                    tools/domcom.exe  \
                    dutch/newdictgen.exe \
                    english/newdictgen.exe \
                    spanish/newdictgen.exe \
                    tools/dict_tuner.exe  \
                    tools/lexedcontrol.exe  \
                    tools/initdutch.exe  \
                    tools/initenglish.exe  \
                    tools/initspanish.exe  \
                    tools/lockinit.exe;
	@ ! no action needed yet
 
 
#!! include the description files of the parts of this component 
 
 
 
tools/asegcom.o : tools/asegcom.p \
                    tools/segcomscanner.pf \
                    tools/segcomparser.pf \
                    tools/segcomrules.pf \
                    tools/segcomlangspec.pf \
                    tools/segcomdecl.pf;
	@actions/pas tools asegcom
 
 
 
tools/gsegcom.o : tools/gsegcom.p \
                    tools/segcomscanner.pf \
                    tools/segcomparser.pf \
                    tools/segcomrules.pf \
                    tools/segcomlangspec.pf \
                    tools/segcomdecl.pf;
	@actions/pas tools gsegcom
 
 
 
tools/gencomp.o : tools/gencomp.p  \
                    general/files.pf  \
                    general/string.pf;
	@actions/pas tools gencomp
 
 
 
 
$(language)/lduniquerels.o : general/lduniquerels.p  \
                               $(language)/lsdomaint.pf  \
                               $(language)/lsauxdom.pf \
                               general/lduniquerels.pf;
	@actions/pas general lduniquerels $(language) 
 
 
 
tools/tldstrtostr.o : tools/tldstrtostr.p  \
                       general/ldstrtostr.pf  \
                       tools/tstring.pf  \
                       general/string.pf;
	@actions/pas tools tldstrtostr
 
 
 
tools/tldconvrec.o : tools/tldconvrec.p  \
                       general/ldconvrec.pf  \
                       tools/tstring.pf  \
                       general/string.pf;
	@actions/pas tools tldconvrec
 
 
 
tools/tfiles.o : tools/tfiles.p  \
                    tools/tfiles.pf  \
                    tools/tstring.pf  \
                    general/str.pf;
	@actions/pas tools tfiles
 
 
#!! 
 
 
tools/tstring.o : tools/tstring.p \
                     tools/tstring.pf  \
                     general/string.pf;
	@actions/pas tools tstring
 
 
#!! 
 
#--------------------module lexlink------------------- 
 
 
 
tools/lexlink.o : tools/lexlink.p  \
                    general/files.pf  \
                    general/string.pf  \
                    general/str.pf  \
                    general/ldstrtotype.pf;
	@actions/pas tools lexlink
 
 
 
#--------------------module mrulelink------------------- 
 
 
 
tools/mrulelink.o : tools/mrulelink.p  \
                    general/files.pf  \
                    general/string.pf  \
                    general/str.pf  \
                    general/ldstrtotype.pf  \
                    general/ldstrtostr.pf;
	@actions/pas tools mrulelink
 
#-----------surface rule compiler--------------- 
 
surcom : $(language)/surcom.exe;
	@ ! integration target
 
 
 
tools/surcom.o : tools/surcom.p  \
   	tools/surcomparser.pf \
	tools/surcomdecl.pf \
	tools/surcomscanner.pf \
	tools/surcomcode.pf;
	@actions/pas tools surcom 
 
#!! 
 
 
tools/surcomcode.o : tools/surcomcode.p  \
                       tools/surcomcode.pf  \
                       tools/surcomdecl.pf  \
                       general/lidomaint.pf ;
	@actions/pas tools surcomcode 
 
 
#!! 
 
 
tools/surcomdecl.o : tools/surcomdecl.p  \
                       tools/surcomdecl.pf;
	@actions/pas tools surcomdecl 
 
 
#!! 
 
 
tools/surcomrules.o : tools/surcomrules.p  \
        tools/surcomrules.pf \
	tools/surcomdecl.pf ;
	@actions/pas tools surcomrules 
 
 
#!! 
 
 
tools/surcomparser.o : tools/surcomparser.p  \
                          tools/surcomdecl.pf  \
                          tools/surcomgraphdef.pf  \
                          tools/surcomrules.pf;
	@actions/pas tools surcomparser 
 
 
 
tools/surcomgraph.o : tools/surcomgraph.p \
                        tools/surcomgraph.pf \
                        tools/surcomdecl.pf;
	@actions/pas tools surcomgraph
 
 
 
tools/surcomgraphdef.o : tools/surcomgraphdef.p  \
                         tools/surcomgraph.pf \
	tools/surcomdecl.pf;
	@actions/pas tools surcomgraphdef 
 
 
#!! 
 
 
tools/surcomscanner.o : tools/surcomscanner.p  \
                          tools/surcomscanner.pf  \
                          tools/surcomdecl.pf;
	@actions/pas tools surcomscanner 
 
 
 
tools/edtcomrules.o : tools/edtcomrules.p \
                        tools/domcomrules.pf \
                        tools/domcomlangspec.pf \
                        tools/domcomdecl.pf \
                        general/files.pf \
                        general/string.pf;
	@actions/pas tools edtcomrules
  
 
 
tools/mrudomcom.o : tools/mrudomcom.p \
                   tools/mrudomcomscanner.pf \
                   tools/mrudomcomparser.pf \
                   tools/mrudomcomlangspec.pf \
                   tools/mrudomcomrules.pf \
                   tools/mrudomcomdecl.pf;
	@actions/pas tools mrudomcom 
 
#!! 
 
 
tools/mrudomcomscanner.o : tools/mrudomcomscanner.p \
                          tools/mrudomcomscanner.pf \
                          tools/mrudomcomlangspec.pf \
                          tools/mrudomcomdecl.pf \
                          tools/tstring.pf;
	@actions/pas tools mrudomcomscanner 
 
#!! 
 
 
tools/mrudomcomparser.o : tools/mrudomcomparser.p \
                         tools/mrudomcomparser.pf \
                         tools/mrudomcomgraphdef.pf \
                         tools/mrudomcomrules.pf \
                         tools/mrudomcomlangspec.pf \
                         tools/mrudomcomdecl.pf  \
                         tools/tstring.pf  \
                         tools/gencomp.exe;
	@actions/pas tools mrudomcomparser 

 
#!! 
 
 
tools/mrudomcomdecl.o : tools/mrudomcomdecl.p \
                       tools/mrudomcomdecl.pf \
                       tools/mrudomcomlangspec.pf \
                       tools/tstring.pf  \
                       tools/gencomp.exe;
	@actions/pas tools mrudomcomdecl 

 
#!! 
 
 
tools/mrudomcomlangspec.o : tools/mrudomcomlangspec.p \
                           tools/mrudomcomlangspec.pf \
                           tools/tstring.pf;
	@actions/pas tools mrudomcomlangspec 
 
 
#!! 
 
 
tools/mrudomcomgraph.o : tools/mrudomcomgraph.p \
                        tools/mrudomcomgraph.pf \
                        tools/mrudomcomlangspec.pf \
                        tools/mrudomcomdecl.pf  \
                        tools/gencomp.exe;
	@actions/pas tools mrudomcomgraph 
 
 
#!! 
 
 
tools/mrudomcomgraphdef.o : tools/mrudomcomgraphdef.p \
                           tools/mrudomcomgraphdef.pf \
                           tools/mrudomcomgraph.pf \
                           tools/mrudomcomlangspec.pf \
                           tools/mrudomcomdecl.pf;
	@actions/pas tools mrudomcomgraphdef 
 
 
#!! 
 
 
tools/mrudomcomrules.o : tools/mrudomcomrules.p \
                        tools/mrudomcomrules.pf \
                        tools/mrudomcomlangspec.pf \
                        tools/mrudomcomdecl.pf \
                        general/files.pf \
                        general/string.pf;
	@actions/pas tools mrudomcomrules 
 
 
 
#!! 
#!! program dict_tuner, written by harm smit: 
#!! 
 
 
 
tools/dict_tuner.o : tools/dict_tuner.p \
                       unix/cisam.pf \
                       general/liildict.pf \
                       general/strtokey.pf \
                       general/strkeyrecdef.pf \
                       general/string.pf;
	@actions/pas tools dict_tuner
 
#!! 
#!! program mkeycheck written by jan odijk (variant of dict_tuner) 
#!! 
 
 
 
tools/mkeycheck.o : tools/mkeycheck.p \
                       unix/cisam.pf \
                       general/liildict.pf \
                       general/strtokey.pf \
                       general/strkeyrecdef.pf \
                       general/string.pf;
	@actions/pas tools mkeycheck
 
 
  
 
 
tools/findmkey.o : tools/findmkey.p \
                      general/strtomkey.pf;
	@actions/pas tools findmkey
 
 
#!! the dependencies of this component 
 
 
 
tools/domcom.o : tools/domcom.p \
                   tools/domcomscanner.pf \
                   tools/domcomparser.pf \
                   tools/domcomlangspec.pf \
                   tools/domcomrules.pf \
                   tools/domcomdecl.pf;
	@actions/pas tools domcom
 
#!! 
 
 
$(language)/testconstraints.o : tools/testconstraints.p \
                                  general/ldblex.pf \
                                  $(language)/testrecord.pf \
                                  $(language)/lsdomaint.pf \
                                  $(language)/lsauxdom.pf;
	@actions/pas tools testconstraints $(language)
 
#!! 
 
$(language)/testrecord.o : $(language)/testrecord.p \
                             $(language)/testrecord.pf \
                             $(language)/lsdomaint.pf;
	@actions/pas $(language) testrecord
 
 
#!! 
 
 
tools/domcomscanner.o : tools/domcomscanner.p \
                          tools/domcomscanner.pf \
                          tools/domcomlangspec.pf \
                          tools/domcomdecl.pf \
                          tools/tstring.pf;
	@actions/pas tools domcomscanner
 
 
#!! 
 
 
tools/domcomparser.o : tools/domcomparser.p \
                         tools/domcomparser.pf \
                         tools/domcomgraphdef.pf \
                         tools/domcomrules.pf \
                         tools/domcomlangspec.pf \
                         tools/domcomdecl.pf  \
                         tools/tstring.pf  \
                         tools/gencomp.exe;
	@actions/pas tools domcomparser
 
 
#!! 
 
 
tools/domcomdecl.o : tools/domcomdecl.p \
                       tools/domcomdecl.pf \
                       tools/domcomlangspec.pf \
                       tools/tstring.pf  \
                       tools/gencomp.exe;
	@actions/pas tools domcomdecl
 
 
#!! 
 
 
tools/domcomlangspec.o : tools/domcomlangspec.p \
                           tools/domcomlangspec.pf \
                           tools/tstring.pf;
	@actions/pas tools domcomlangspec
 
 
#!! 
 
 
tools/domcomgraph.o : tools/domcomgraph.p \
                        tools/domcomgraph.pf \
                        tools/domcomlangspec.pf \
                        tools/domcomdecl.pf  \
                        tools/gencomp.exe;
	@actions/pas tools domcomgraph

#!! 
 
 
tools/domcomgraphdef.o : tools/domcomgraphdef.p \
                           tools/domcomgraphdef.pf \
                           tools/domcomgraph.pf \
                           tools/domcomlangspec.pf \
                           tools/domcomdecl.pf;
	@actions/pas tools domcomgraphdef
 
 
#!! 
 
 
tools/domcomrules.o : tools/domcomrules.p \
                        tools/domcomrules.pf \
                        tools/domcomlangspec.pf \
                        tools/domcomdecl.pf \
                        general/files.pf \
                        general/string.pf \
                        general/str.pf;
	@actions/pas tools domcomrules
 
 
#!! 
 
lexcomp : $(language)/lexcom.exe  \
          $(language)/lexlink.exe;
	@ ! no action
 
 
 
tools/lexcom.o : tools/lexcom.p  \
	tools/lexcomdecl.pf \
	tools/lexcomscanner.pf \
	tools/lexcomcode.pf;
	@actions/pas tools lexcom 
 
#!! 
 
 
tools/lexcomcode.o : tools/lexcomcode.p  \
                       tools/lexcomcode.pf  \
                       tools/lexcomdecl.pf  \
                       tools/lexcomrules.pf  \
                       general/ldstrtostr.pf  \
                       general/ldstrtotype.pf  \
                       general/ldcatsets.pf  \
                       general/string.pf;
	@actions/pas tools lexcomcode 
 
 
#!! 
 
 
tools/lexcomdecl.o : tools/lexcomdecl.p  \
                       tools/lexcomdecl.pf;
	@actions/pas tools lexcomdecl 
 
 
#!! 
 
 
tools/lexcomrules.o : tools/lexcomrules.p  \
	general/ldstrtotype.pf \
	general/ldcatsets.pf \
	tools/lexcomdecl.pf;
	@actions/pas tools lexcomrules 
 
 
#!! 
 
lexsurfparser : tools/lexcomparser.o;
	@ ! no action
 
 
tools/lexcomparser.o : tools/lexcomparser.p  \
                          tools/lexcomdecl.pf  \
                          tools/lexcomgraphdef.pf  \
                          tools/lexcomrules.pf;
	@actions/pas tools lexcomparser 
 
 
#!! 
 
 
tools/lexcomgraph.o : tools/lexcomgraph.p \
                        tools/lexcomgraph.pf \
                        tools/lexcomdecl.pf;
	@actions/pas tools lexcomgraph
 
 
 
tools/lexcomgraphdef.o : tools/lexcomgraphdef.p  \
	tools/lexcomgraph.pf \
	tools/lexcomdecl.pf;
	@actions/pas tools lexcomgraphdef 
 
 
 
#!! 
 
 
tools/lexcomscanner.o : tools/lexcomscanner.p  \
                          tools/lexcomscanner.pf  \
                          tools/lexcomdecl.pf;
	@actions/pas tools lexcomscanner 
 
 
#!! 
 
segcomp : $(language)/segcom.exe;
	@ ! no action
 
 
 
tools/segcom.o : tools/segcom.p \
                   tools/segcomscanner.pf \
                   tools/segcomparser.pf \
                   tools/segcomrules.pf \
                   tools/segcomlangspec.pf \
                   tools/segcomdecl.pf;
	@actions/pas tools segcom
 
#!! 
 
 
tools/segcomscanner.o : tools/segcomscanner.p \
                          tools/segcomscanner.pf \
                          tools/segcomlangspec.pf \
                          tools/segcomdecl.pf \
                          general/string.pf;
	@actions/pas tools segcomscanner
 
 
#!! 
 
 
tools/segcomparser.o : tools/segcomparser.p \
                         tools/segcomparser.pf \
                         tools/segcomgraphdef.pf \
                         tools/segcomrules.pf \
                         tools/segcomlangspec.pf \
                         tools/segcomdecl.pf  \
                         general/string.pf;
	@actions/pas tools segcomparser
 
 
#!! 
 
 
tools/segcomdecl.o : tools/segcomdecl.p \
                       tools/segcomdecl.pf \
                       tools/segcomlangspec.pf \
                       general/string.pf;
	@actions/pas tools segcomdecl
 
 
#!! 
 
 
tools/segcomlangspec.o : tools/segcomlangspec.p \
                           tools/segcomlangspec.pf \
                           general/string.pf;
	@actions/pas tools segcomlangspec
 
 
#!! 
 
 
tools/segcomgraph.o : tools/segcomgraph.p \
                        tools/segcomgraph.pf \
                        tools/segcomlangspec.pf \
                        tools/segcomdecl.pf;
	@actions/pas tools segcomgraph
 
 
#!! 
 
 
tools/segcomgraphdef.o : tools/segcomgraphdef.p \
                           tools/segcomgraphdef.pf \
                           tools/segcomgraph.pf \
                           tools/segcomlangspec.pf \
                           tools/segcomdecl.pf;
	@actions/pas tools segcomgraphdef
 
 
#!! in the next section the opt file of segmrules is not merged 
#!! with the opt file for segcomrules, because only the definition 
#!! file of segmrules is used. 
 
 
tools/segcomrules.o : tools/segcomrules.p \
                        tools/segcomrules.pf \
                        tools/segcomlangspec.pf \
                        tools/segcomdecl.pf \
                        general/string.pf \
                        general/str.pf \
                        general/segmrules.pf \
                        general/limorfdef.pf \
                        general/ldstrtotype.pf;
	@actions/pas tools segcomrules
 
 
#!! 
 
surfcom : 
	@ ! integration target
 
#!! 
 
vandale : convstart \
          tools/conv.exe;
	@ ! no action
 
convstart : tools/conv.dcl;
	@actions/dcl tools conv
 
 
 
tools/conv.o : tools/conv.p;
	@actions/pas tools conv
 
#!! 
 
# list the integration targets of this component 
integrate_vandale : 
	@ ! no action needed
 
# include the description files of the parts of this component 

general/logname.o : general/logname.p \
                    general/logname.pf \
                    general/string.pf \
                    unix/cisam.pf;
	@actions/pas general logname

