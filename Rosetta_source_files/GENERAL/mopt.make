$(language)/asegcom.exe : general/string.o \
tools/segcomlangspec.o \
tools/segcomdecl.o \
tools/segcomscanner.o \
general/str.o \
general/logname.o \
$(language)/ldstrtotype.o \
tools/segcomrules.o \
tools/segcomgraph.o \
tools/segcomgraphdef.o \
tools/segcomparser.o \
tools/asegcom.o \
unix/cisam.o \
unix/paspar.o \
/home/informix/lib/libisam.a;
	@actions/opt $(language) asegcom

tools/constraintgen.exe : general/string.o \
general/str.o \
general/logname.o \
general/files.o \
tools/constraintgen.o \
unix/cisam.o \
unix/paspar.o \
/home/informix/lib/libisam.a;
	@actions/opt tools constraintgen

tools/domcom.exe : general/string.o \
tools/tstring.o \
general/mem.o \
general/log.o \
general/str.o \
general/logname.o \
general/files.o \
tools/domcomlangspec.o \
tools/domcomdecl.o \
tools/domcomrules.o \
tools/domcomscanner.o \
tools/domcomgraph.o \
tools/domcomgraphdef.o \
tools/domcomparser.o \
tools/domcom.o \
unix/cisam.o \
unix/paspar.o \
/home/informix/lib/libisam.a;
	@actions/opt tools domcom

tools/fixidgen.exe : general/files.o \
general/globdef.o \
general/str.o \
general/string.o \
general/mem.o \
general/debug.o \
general/strtokey.o \
general/interface0.o \
tools/fixidgen.o \
general/logname.o \
general/lifixiddict.o \
general/windows.o \
general/wnd.o \
unix/wch.o \
unix/logc.o \
unix/cisam.o \
unix/paspar.o \
unix/wipc.o \
general/error.o \
general/level.o \
general/log.o \
unix/sockipc.o \
/home/informix/lib/libisam.a;
	@actions/opt tools fixidgen

$(language)/genblexdict.exe : $(language)/genblexdict.o \
$(language)/ldblex.o \
$(language)/ldconvrec.o \
$(language)/ldgetkey.o \
$(language)/ldstrtotype.o \
$(language)/ldtypetostr.o \
$(language)/lsconvattr.o \
$(language)/lsconvrec.o \
$(language)/lsstrtotype.o \
$(language)/lstypetostr.o \
$(language)/maket.o \
general/debug.o \
general/files.o \
general/globdef.o \
general/interface1.o \
general/lisdict.o \
general/listree.o \
general/log.o \
general/mem.o \
general/str.o \
general/string.o \
general/strtokey.o \
general/windows.o \
general/wnd.o \
unix/wch.o \
unix/logc.o \
general/logname.o \
unix/cisam.o \
unix/paspar.o \
unix/wipc.o \
general/error.o \
general/level.o \
unix/sockipc.o \
/home/informix/lib/libisam.a;
	@actions/opt $(language) genblexdict

$(language)/genblexisf.exe : $(language)/genblexisf.o \
$(language)/ldblex.o \
$(language)/ldconvrec.o \
$(language)/ldgetkey.o \
$(language)/ldstrtotype.o \
$(language)/ldtypetostr.o \
$(language)/lsconvattr.o \
$(language)/lsconvrec.o \
$(language)/lsstrtotype.o \
$(language)/lstypetostr.o \
$(language)/maket.o \
general/debug.o \
general/files.o \
general/globdef.o \
general/interface1.o \
general/lisdict.o \
general/listree.o \
general/log.o \
general/mem.o \
general/str.o \
general/string.o \
general/strtokey.o \
general/windows.o \
general/wnd.o \
unix/wch.o \
unix/logc.o \
general/logname.o \
unix/cisam.o \
unix/paspar.o \
unix/wipc.o \
general/error.o \
general/level.o \
unix/sockipc.o \
/home/informix/lib/libisam.a;
	@actions/opt $(language) genblexisf

tools/gencomp.exe : general/string.o \
general/str.o \
general/logname.o \
general/files.o \
tools/gencomp.o \
unix/cisam.o \
unix/paspar.o \
/home/informix/lib/libisam.a ;
	@actions/opt tools gencomp

$(language)/geniddictdata.exe : $(language)/geniddictdata.o \
$(language)/ldblex.o \
$(language)/ldconvrec.o \
$(language)/ldgetkey.o \
$(language)/ldstrtotype.o \
$(language)/ldtypetostr.o \
$(language)/lsconvattr.o \
$(language)/lsconvrec.o \
$(language)/lsstrtotype.o \
$(language)/lstypetostr.o \
$(language)/maket.o \
general/debug.o \
general/files.o \
general/globdef.o \
general/interface1.o \
general/lisdict.o \
general/listree.o \
general/log.o \
general/mem.o \
general/str.o \
general/string.o \
general/strtokey.o \
general/windows.o \
general/wnd.o \
unix/wch.o \
unix/logc.o \
general/logname.o \
unix/cisam.o \
unix/paspar.o \
unix/wipc.o \
general/error.o \
general/level.o \
unix/sockipc.o \
/home/informix/lib/libisam.a;
	@actions/opt $(language) geniddictdata

$(language)/geniddicttext.exe : $(language)/geniddicttext.o \
$(language)/ldblex.o \
$(language)/ldconvrec.o \
$(language)/ldgetkey.o \
$(language)/ldstrtotype.o \
$(language)/ldtypetostr.o \
$(language)/lsconvattr.o \
$(language)/lsconvrec.o \
$(language)/lsstrtotype.o \
$(language)/lstypetostr.o \
$(language)/maket.o \
general/debug.o \
general/files.o \
general/globdef.o \
general/interface1.o \
general/lisdict.o \
general/listree.o \
general/log.o \
general/mem.o \
general/str.o \
general/string.o \
general/strtokey.o \
general/windows.o \
general/wnd.o \
unix/wch.o \
unix/logc.o \
general/logname.o \
unix/cisam.o \
unix/paspar.o \
unix/wipc.o \
general/error.o \
general/level.o \
unix/sockipc.o \
/home/informix/lib/libisam.a;
	@actions/opt $(language) geniddicttext

tools/genildicttext.exe : general/debug.o \
general/files.o \
general/globdef.o \
general/liildict.o \
general/log.o \
general/str.o \
general/string.o \
general/strtokey.o \
general/strtomkey.o \
general/windows.o \
tools/genildicttext.o \
general/logname.o \
unix/cisam.o \
unix/paspar.o \
unix/wipc.o \
general/error.o \
general/level.o \
unix/sockipc.o \
/home/informix/lib/libisam.a;
	@actions/opt tools genildicttext

tools/genmake.exe : general/string.o \
general/str.o \
general/logname.o \
tools/genmake.o \
unix/cisam.o \
unix/paspar.o \
/home/informix/lib/libisam.a;
	@actions/opt tools genmake

$(language)/genmdictdata.exe : $(language)/genmdictdata.o \
$(language)/ldblex.o \
$(language)/ldconvrec.o \
$(language)/ldgetkey.o \
$(language)/ldstrtotype.o \
$(language)/ldtypetostr.o \
$(language)/lsconvattr.o \
$(language)/lsconvrec.o \
$(language)/lsstrtotype.o \
$(language)/lstypetostr.o \
$(language)/maket.o \
general/debug.o \
general/files.o \
general/globdef.o \
general/interface1.o \
general/lisdict.o \
general/listree.o \
general/log.o \
general/mem.o \
general/str.o \
general/string.o \
general/strtokey.o \
general/windows.o \
general/wnd.o \
unix/wch.o \
unix/logc.o \
general/logname.o \
$(language)/ldlexconvert.o \
unix/cisam.o \
unix/paspar.o \
unix/wipc.o \
general/error.o \
general/level.o \
unix/sockipc.o \
/home/informix/lib/libisam.a;
	@actions/opt $(language) genmdictdata

$(language)/genmdicttext.exe : general/genmdicttext.o \
$(language)/ldblex.o \
$(language)/ldconvrec.o \
$(language)/ldgetkey.o \
$(language)/ldstrtotype.o \
$(language)/ldtypetostr.o \
$(language)/lsconvattr.o \
$(language)/lsconvrec.o \
$(language)/lsstrtotype.o \
$(language)/lstypetostr.o \
$(language)/maket.o \
general/debug.o \
general/files.o \
general/globdef.o \
general/interface1.o \
general/lisdict.o \
general/listree.o \
general/log.o \
general/mem.o \
general/str.o \
general/string.o \
general/strtokey.o \
general/windows.o \
general/wnd.o \
unix/wch.o \
unix/logc.o \
general/logname.o \
$(language)/ldlexconvert.o \
unix/cisam.o \
unix/paspar.o \
unix/wipc.o \
general/error.o \
general/level.o \
unix/sockipc.o \
/home/informix/lib/libisam.a;
	@actions/opt $(language) genmdicttext

tools/gensdictdata.exe : tools/gensdictdata.o \
general/files.o \
general/globdef.o \
general/lisdict.o \
general/debug.o \
general/windows.o \
general/wnd.o \
unix/wch.o \
unix/logc.o \
general/str.o \
general/string.o \
general/strtokey.o \
general/logname.o \
unix/cisam.o \
unix/paspar.o \
unix/wipc.o \
general/error.o \
general/level.o \
unix/sockipc.o \
/home/informix/lib/libisam.a;
	@actions/opt tools gensdictdata

tools/genildictdata.exe : tools/genildictdata.o \
general/files.o \
general/globdef.o \
general/liildict.o \
general/str.o \
general/debug.o \
general/windows.o \
general/wnd.o \
unix/wch.o \
unix/logc.o \
general/string.o \
general/strtokey.o \
general/strtomkey.o \
general/logname.o \
unix/cisam.o \
unix/paspar.o \
unix/wipc.o \
general/error.o \
general/level.o \
unix/sockipc.o \
/home/informix/lib/libisam.a;
	@actions/opt tools genildictdata



tools/gensiddictdata.exe : tools/gensiddictdata.o \
general/files.o \
general/globdef.o \
general/lisiddict.o \
general/str.o \
general/debug.o \
general/windows.o \
general/wnd.o \
unix/wch.o \
unix/logc.o \
general/string.o \
general/strtokey.o \
general/strtomkey.o \
general/logname.o \
unix/cisam.o \
unix/paspar.o \
unix/wipc.o \
general/error.o \
general/level.o \
unix/sockipc.o \
/home/informix/lib/libisam.a;
	@actions/opt tools gensiddictdata

tools/gensiddicttext.exe : tools/gensiddicttext.o \
general/files.o \
general/globdef.o \
general/lisiddict.o \
general/str.o \
general/string.o \
general/strtokey.o \
general/strtomkey.o \
general/logname.o \
unix/cisam.o \
unix/paspar.o \
unix/wipc.o \
general/error.o \
general/level.o \
unix/sockipc.o \
/home/informix/lib/libisam.a;
	@actions/opt tools gensiddicttext

tools/genscommentdata.exe : tools/genscommentdata.o \
general/files.o \
general/globdef.o \
general/liscomment.o \
general/str.o \
general/string.o \
general/strtokey.o \
general/strtomkey.o \
general/logname.o \
general/wnd.o \
unix/wch.o \
unix/logc.o \
unix/cisam.o \
unix/paspar.o \
unix/wipc.o \
general/error.o \
general/level.o \
unix/sockipc.o \
/home/informix/lib/libisam.a;
	@actions/opt tools genscommentdata

tools/genscommenttext.exe : tools/genscommenttext.o \
general/files.o \
general/globdef.o \
general/liscomment.o \
general/str.o \
general/string.o \
general/strtokey.o \
general/strtomkey.o \
general/logname.o \
general/wnd.o \
unix/wch.o \
unix/logc.o \
unix/cisam.o \
unix/paspar.o \
unix/wipc.o \
general/error.o \
general/level.o \
unix/sockipc.o \
/home/informix/lib/libisam.a;
	@actions/opt tools genscommenttext

tools/genmcommenttext.exe : tools/genmcommenttext.o \
general/files.o \
general/globdef.o \
general/limcomment.o \
general/str.o \
general/string.o \
general/strtokey.o \
general/strtomkey.o \
general/logname.o \
general/wnd.o \
unix/wch.o \
unix/logc.o \
unix/cisam.o \
unix/paspar.o \
unix/wipc.o \
general/error.o \
general/level.o \
unix/sockipc.o \
/home/informix/lib/libisam.a;
	@actions/opt tools genmcommenttext

tools/genmcommentdata.exe : tools/genmcommentdata.o \
general/files.o \
general/globdef.o \
general/limcomment.o \
general/str.o \
general/string.o \
general/strtokey.o \
general/strtomkey.o \
general/logname.o \
general/wnd.o \
unix/wch.o \
unix/logc.o \
unix/cisam.o \
unix/paspar.o \
unix/wipc.o \
general/error.o \
general/level.o \
unix/sockipc.o \
/home/informix/lib/libisam.a;
	@actions/opt tools genmcommentdata

$(language)/gsegcom.exe : general/string.o \
tools/segcomlangspec.o \
tools/segcomdecl.o \
tools/segcomscanner.o \
general/str.o \
general/logname.o \
$(language)/ldstrtotype.o \
tools/segcomrules.o \
tools/segcomgraph.o \
tools/segcomgraphdef.o \
tools/segcomparser.o \
tools/gsegcom.o \
unix/cisam.o \
unix/paspar.o \
/home/informix/lib/libisam.a;
	@actions/opt $(language) gsegcom

$(language)/lexcom.exe : tools/lexcomdecl.o \
tools/lexcomscanner.o \
tools/lexcomrules.o \
tools/lexcomgraphdef.o \
tools/lexcomgraph.o \
tools/lexcomparser.o \
tools/lexcomcode.o \
general/str.o \
$(language)/ldstrtotype.o \
$(language)/ldcatsets.o \
general/string.o \
$(language)/ldstrtostr.o \
general/logname.o \
tools/lexcom.o \
unix/cisam.o \
unix/paspar.o \
/home/informix/lib/libisam.a;
	@actions/opt $(language) lexcom

$(language)/lexlink.exe : general/string.o \
general/str.o \
general/logname.o \
general/files.o \
$(language)/ldstrtotype.o \
tools/lexlink.o \
unix/cisam.o \
unix/paspar.o \
/home/informix/lib/libisam.a;
	@actions/opt $(language) lexlink

tools/mmstomake.exe : general/string.o \
general/str.o \
general/logname.o \
tools/mmstomake.o \
unix/cisam.o \
unix/paspar.o \
/home/informix/lib/libisam.a;
	@actions/opt tools mmstomake

tools/mopttoopt.exe : general/string.o \
general/str.o \
general/logname.o \
tools/mopttoopt.o \
unix/cisam.o \
unix/paspar.o \
/home/informix/lib/libisam.a;
	@actions/opt tools mopttoopt

$(language)/mrulelink.exe : general/string.o \
general/str.o \
general/logname.o \
general/files.o \
$(language)/ldstrtotype.o \
$(language)/ldstrtostr.o \
tools/mrulelink.o \
unix/cisam.o \
unix/paspar.o \
/home/informix/lib/libisam.a;
	@actions/opt $(language) mrulelink

tools/strkey.exe : general/files.o \
general/globdef.o \
general/str.o \
general/string.o \
general/strtokey.o \
general/logname.o \
general/windows.o \
general/error.o \
tools/strkey.o \
general/wnd.o \
unix/wch.o \
unix/wipc.o \
unix/sockipc.o \
unix/logc.o \
unix/cisam.o \
unix/paspar.o \
/home/informix/lib/libisam.a;
	@actions/opt tools strkey

tools/strmkey.exe : general/files.o \
general/globdef.o \
general/str.o \
general/string.o \
general/strtomkey.o \
general/logname.o \
general/windows.o \
general/error.o \
tools/strmkey.o \
general/wnd.o \
unix/wch.o \
unix/wipc.o \
unix/sockipc.o \
unix/logc.o \
unix/cisam.o \
unix/paspar.o \
/home/informix/lib/libisam.a;
	@actions/opt tools strmkey

$(language)/surcom.exe : tools/surcomdecl.o \
tools/surcomrules.o \
tools/surcomgraph.o \
tools/surcomgraphdef.o \
tools/surcomparser.o \
$(language)/ldstrtotype.o \
general/str.o \
tools/surcomcode.o \
tools/surcomscanner.o \
general/logname.o \
tools/surcom.o \
unix/cisam.o \
unix/paspar.o \
/home/informix/lib/libisam.a;
	@actions/opt $(language) surcom

$(language)/analysis.exe : $(language)/anlexif.o \
$(language)/comlexrules1.o \
$(language)/comlexrules2.o \
$(language)/comlexrules3.o \
$(language)/copyt.o \
$(language)/decommrules1.o \
$(language)/decommrules10.o \
$(language)/decommrules100.o \
$(language)/decommrules101.o \
$(language)/decommrules102.o \
$(language)/decommrules103.o \
$(language)/decommrules104.o \
$(language)/decommrules105.o \
$(language)/decommrules106.o \
$(language)/decommrules107.o \
$(language)/decommrules108.o \
$(language)/decommrules109.o \
$(language)/decommrules11.o \
$(language)/decommrules110.o \
$(language)/decommrules111.o \
$(language)/decommrules112.o \
$(language)/decommrules113.o \
$(language)/decommrules114.o \
$(language)/decommrules115.o \
$(language)/decommrules116.o \
$(language)/decommrules117.o \
$(language)/decommrules118.o \
$(language)/decommrules119.o \
$(language)/decommrules12.o \
$(language)/decommrules120.o \
$(language)/decommrules121.o \
$(language)/decommrules122.o \
$(language)/decommrules123.o \
$(language)/decommrules124.o \
$(language)/decommrules125.o \
$(language)/decommrules126.o \
$(language)/decommrules127.o \
$(language)/decommrules128.o \
$(language)/decommrules129.o \
$(language)/decommrules13.o \
$(language)/decommrules130.o \
$(language)/decommrules131.o \
$(language)/decommrules132.o \
$(language)/decommrules133.o \
$(language)/decommrules134.o \
$(language)/decommrules135.o \
$(language)/decommrules136.o \
$(language)/decommrules137.o \
$(language)/decommrules138.o \
$(language)/decommrules139.o \
$(language)/decommrules14.o \
$(language)/decommrules140.o \
$(language)/decommrules15.o \
$(language)/decommrules16.o \
$(language)/decommrules17.o \
$(language)/decommrules18.o \
$(language)/decommrules19.o \
$(language)/decommrules2.o \
$(language)/decommrules20.o \
$(language)/decommrules21.o \
$(language)/decommrules22.o \
$(language)/decommrules23.o \
$(language)/decommrules24.o \
$(language)/decommrules25.o \
$(language)/decommrules26.o \
$(language)/decommrules27.o \
$(language)/decommrules28.o \
$(language)/decommrules29.o \
$(language)/decommrules3.o \
$(language)/decommrules30.o \
$(language)/decommrules31.o \
$(language)/decommrules32.o \
$(language)/decommrules33.o \
$(language)/decommrules34.o \
$(language)/decommrules35.o \
$(language)/decommrules36.o \
$(language)/decommrules37.o \
$(language)/decommrules38.o \
$(language)/decommrules39.o \
$(language)/decommrules4.o \
$(language)/decommrules40.o \
$(language)/decommrules41.o \
$(language)/decommrules42.o \
$(language)/decommrules43.o \
$(language)/decommrules44.o \
$(language)/decommrules45.o \
$(language)/decommrules46.o \
$(language)/decommrules47.o \
$(language)/decommrules48.o \
$(language)/decommrules49.o \
$(language)/decommrules5.o \
$(language)/decommrules50.o \
$(language)/decommrules51.o \
$(language)/decommrules52.o \
$(language)/decommrules53.o \
$(language)/decommrules54.o \
$(language)/decommrules55.o \
$(language)/decommrules56.o \
$(language)/decommrules57.o \
$(language)/decommrules58.o \
$(language)/decommrules59.o \
$(language)/decommrules6.o \
$(language)/decommrules60.o \
$(language)/decommrules61.o \
$(language)/decommrules62.o \
$(language)/decommrules63.o \
$(language)/decommrules64.o \
$(language)/decommrules65.o \
$(language)/decommrules66.o \
$(language)/decommrules67.o \
$(language)/decommrules68.o \
$(language)/decommrules69.o \
$(language)/decommrules7.o \
$(language)/decommrules70.o \
$(language)/decommrules71.o \
$(language)/decommrules72.o \
$(language)/decommrules73.o \
$(language)/decommrules74.o \
$(language)/decommrules75.o \
$(language)/decommrules76.o \
$(language)/decommrules77.o \
$(language)/decommrules78.o \
$(language)/decommrules79.o \
$(language)/decommrules8.o \
$(language)/decommrules80.o \
$(language)/decommrules81.o \
$(language)/decommrules82.o \
$(language)/decommrules83.o \
$(language)/decommrules84.o \
$(language)/decommrules85.o \
$(language)/decommrules86.o \
$(language)/decommrules87.o \
$(language)/decommrules88.o \
$(language)/decommrules89.o \
$(language)/decommrules9.o \
$(language)/decommrules90.o \
$(language)/decommrules91.o \
$(language)/decommrules92.o \
$(language)/decommrules93.o \
$(language)/decommrules94.o \
$(language)/decommrules95.o \
$(language)/decommrules96.o \
$(language)/decommrules97.o \
$(language)/decommrules98.o \
$(language)/decommrules99.o \
$(language)/helpsubgrammars.o \
$(language)/ldaffixlex.o \
$(language)/ldanilrules.o \
$(language)/ldanmrules.o \
$(language)/ldblex.o \
$(language)/ldcatsets.o \
$(language)/ldconvrec.o \
$(language)/ldequal.o \
$(language)/ldgetkey.o \
$(language)/ldgluelex.o \
$(language)/ldmdict.o \
$(language)/ldmeasuresize.o \
$(language)/ldmrules.o \
$(language)/ldprims.o \
$(language)/ldstrtotype.o \
$(language)/ldsubgrammars.o \
$(language)/ldsucc.o \
$(language)/ldsurfswitch.o \
$(language)/ldtypetostr.o \
$(language)/lsauxdom.o \
$(language)/lsconvattr.o \
$(language)/lsconvrec.o \
$(language)/lsmruquo.o \
$(language)/lsstrtotype.o \
$(language)/lssurfquo.o \
$(language)/lstypetostr.o \
$(language)/maket.o \
$(language)/surfrules.o \
$(language)/surfrulesblocks.o \
$(language)/surfrulesgraphs.o \
$(language)/ldmorfdef.o \
$(language)/lsmatches.o \
$(language)/lsphondef.o \
general/aidderiv.o \
general/alayout.o \
general/alex.o \
general/alextree.o \
general/amorph.o \
general/analysis.o \
general/asegm.o \
general/asegmrules.o \
general/atransfer.o \
general/awhere.o \
general/config.o \
general/debug.o \
general/debugmparser.o \
general/debugmgenerator.o \
general/loop.o \
general/drawhiltree.o \
general/drawhyperdtree.o \
general/drawstree.o \
general/drawsuperdtree.o \
general/drawtree.o \
general/drawtreeset.o \
general/level.o \
general/lastactive.o \
general/error.o \
general/files.o \
general/globdef.o \
general/globsubst.o \
general/hiltree.o \
general/hyperdtree.o \
general/interface0.o \
general/interface1.o \
general/interface7.o \
general/lifixiddict.o \
general/liiddict.o \
general/liildict.o \
general/limatches.o \
general/limrules.o \
general/liprims.o \
general/lisdict.o \
general/lisiddict.o \
general/listree.o \
general/log.o \
general/logname.o \
general/mem.o \
general/mparser.o \
general/mpstatistics.o \
general/oldtree.o \
general/printerf.o \
general/printerf1.o \
general/printerf2.o \
general/printerf3.o \
general/printerf4.o \
general/printerf5.o \
general/printerf6.o \
general/printerf7.o \
general/rectoscreen.o \
general/lirectoscreen.o \
general/segmrules.o \
general/str.o \
general/string.o \
general/strtokey.o \
general/strtomkey.o \
general/superdtree.o \
general/surfparser.o \
general/windows.o \
general/wnd.o \
interlingua/liilrules.o \
unix/paspar.o \
unix/logc.o \
unix/mb.o \
unix/pc.o \
unix/wch.o \
unix/wipc.o \
unix/globbuf.o \
unix/mkkey.o \
unix/sockipc.o \
unix/cisam.o \
/home/informix/lib/libisam.a;
	@actions/opt $(language) analysis

$(language)/generation.exe : $(language)/commrules1.o \
$(language)/commrules10.o \
$(language)/commrules100.o \
$(language)/commrules101.o \
$(language)/commrules102.o \
$(language)/commrules103.o \
$(language)/commrules104.o \
$(language)/commrules105.o \
$(language)/commrules106.o \
$(language)/commrules107.o \
$(language)/commrules108.o \
$(language)/commrules109.o \
$(language)/commrules11.o \
$(language)/commrules110.o \
$(language)/commrules111.o \
$(language)/commrules112.o \
$(language)/commrules113.o \
$(language)/commrules114.o \
$(language)/commrules115.o \
$(language)/commrules116.o \
$(language)/commrules117.o \
$(language)/commrules118.o \
$(language)/commrules119.o \
$(language)/commrules12.o \
$(language)/commrules120.o \
$(language)/commrules121.o \
$(language)/commrules122.o \
$(language)/commrules123.o \
$(language)/commrules124.o \
$(language)/commrules125.o \
$(language)/commrules126.o \
$(language)/commrules127.o \
$(language)/commrules128.o \
$(language)/commrules129.o \
$(language)/commrules13.o \
$(language)/commrules130.o \
$(language)/commrules131.o \
$(language)/commrules132.o \
$(language)/commrules133.o \
$(language)/commrules134.o \
$(language)/commrules135.o \
$(language)/commrules136.o \
$(language)/commrules137.o \
$(language)/commrules138.o \
$(language)/commrules139.o \
$(language)/commrules14.o \
$(language)/commrules140.o \
$(language)/commrules15.o \
$(language)/commrules16.o \
$(language)/commrules17.o \
$(language)/commrules18.o \
$(language)/commrules19.o \
$(language)/commrules2.o \
$(language)/commrules20.o \
$(language)/commrules21.o \
$(language)/commrules22.o \
$(language)/commrules23.o \
$(language)/commrules24.o \
$(language)/commrules25.o \
$(language)/commrules26.o \
$(language)/commrules27.o \
$(language)/commrules28.o \
$(language)/commrules29.o \
$(language)/commrules3.o \
$(language)/commrules30.o \
$(language)/commrules31.o \
$(language)/commrules32.o \
$(language)/commrules33.o \
$(language)/commrules34.o \
$(language)/commrules35.o \
$(language)/commrules36.o \
$(language)/commrules37.o \
$(language)/commrules38.o \
$(language)/commrules39.o \
$(language)/commrules4.o \
$(language)/commrules40.o \
$(language)/commrules41.o \
$(language)/commrules42.o \
$(language)/commrules43.o \
$(language)/commrules44.o \
$(language)/commrules45.o \
$(language)/commrules46.o \
$(language)/commrules47.o \
$(language)/commrules48.o \
$(language)/commrules49.o \
$(language)/commrules5.o \
$(language)/commrules50.o \
$(language)/commrules51.o \
$(language)/commrules52.o \
$(language)/commrules53.o \
$(language)/commrules54.o \
$(language)/commrules55.o \
$(language)/commrules56.o \
$(language)/commrules57.o \
$(language)/commrules58.o \
$(language)/commrules59.o \
$(language)/commrules6.o \
$(language)/commrules60.o \
$(language)/commrules61.o \
$(language)/commrules62.o \
$(language)/commrules63.o \
$(language)/commrules64.o \
$(language)/commrules65.o \
$(language)/commrules66.o \
$(language)/commrules67.o \
$(language)/commrules68.o \
$(language)/commrules69.o \
$(language)/commrules7.o \
$(language)/commrules70.o \
$(language)/commrules71.o \
$(language)/commrules72.o \
$(language)/commrules73.o \
$(language)/commrules74.o \
$(language)/commrules75.o \
$(language)/commrules76.o \
$(language)/commrules77.o \
$(language)/commrules78.o \
$(language)/commrules79.o \
$(language)/commrules8.o \
$(language)/commrules80.o \
$(language)/commrules81.o \
$(language)/commrules82.o \
$(language)/commrules83.o \
$(language)/commrules84.o \
$(language)/commrules85.o \
$(language)/commrules86.o \
$(language)/commrules87.o \
$(language)/commrules88.o \
$(language)/commrules89.o \
$(language)/commrules9.o \
$(language)/commrules90.o \
$(language)/commrules91.o \
$(language)/commrules92.o \
$(language)/commrules93.o \
$(language)/commrules94.o \
$(language)/commrules95.o \
$(language)/commrules96.o \
$(language)/commrules97.o \
$(language)/commrules98.o \
$(language)/commrules99.o \
$(language)/copyt.o \
$(language)/decomlexrules1.o \
$(language)/decomlexrules2.o \
$(language)/decomlexrules3.o \
$(language)/genlexif.o \
$(language)/helpsubgrammars.o \
$(language)/ldaffixlex.o \
$(language)/ldblex.o \
$(language)/ldcatsets.o \
$(language)/ldconvrec.o \
$(language)/ldgenmrules.o \
$(language)/ldgetkey.o \
$(language)/ldgluelex.o \
$(language)/ldmdict.o \
$(language)/ldmeasuresize.o \
$(language)/ldmorfdef.o \
$(language)/ldmrules.o \
$(language)/ldstrtotype.o \
$(language)/ldsubgrammars.o \
$(language)/ldsubsttovar.o \
$(language)/ldsucc.o \
$(language)/ldtypetostr.o \
$(language)/lsauxdom.o \
$(language)/lsconvattr.o \
$(language)/lsconvrec.o \
$(language)/lsmatches.o \
$(language)/lsmruquo.o \
$(language)/lsphondef.o \
$(language)/lsstrtotype.o \
$(language)/lstypetostr.o \
$(language)/maket.o \
general/config.o \
general/debug.o \
general/loop.o \
general/debugmparser.o \
general/debugmgenerator.o \
general/drawhiltree.o \
general/drawhyperdtree.o \
general/drawstree.o \
general/drawsuperdtree.o \
general/drawtree.o \
general/drawtreeset.o \
general/level.o \
general/lastactive.o \
general/error.o \
general/files.o \
general/generation.o \
general/gidderiv.o \
general/glayout.o \
general/glex.o \
general/glextree.o \
general/globdef.o \
general/globsubst.o \
general/gmorph.o \
general/gsegm.o \
general/gsegmrules.o \
general/gtransfer.o \
general/gwhere.o \
general/hiltree.o \
general/hyperdtree.o \
general/interface0.o \
general/interface1.o \
general/interface7.o \
general/interface8.o \
general/lifixiddict.o \
general/liiddict.o \
general/liildict.o \
general/limatches.o \
general/limrules.o \
general/linearizer.o \
general/lisdict.o \
general/lisiddict.o \
general/listree.o \
general/log.o \
general/logname.o \
general/mem.o \
general/mgenerator.o \
general/oldtree.o \
general/printerf.o \
general/printerf1.o \
general/printerf2.o \
general/printerf3.o \
general/printerf4.o \
general/printerf5.o \
general/printerf6.o \
general/printerf7.o \
general/rectoscreen.o \
general/lirectoscreen.o \
general/segmrules.o \
general/str.o \
general/string.o \
general/strtokey.o \
general/strtomkey.o \
general/superdtree.o \
general/windows.o \
general/wnd.o \
interlingua/liilrules.o \
$(language)/ldgenilrules.o \
unix/paspar.o \
unix/logc.o \
unix/mb.o \
unix/pc.o \
unix/wch.o \
unix/wipc.o \
unix/sockipc.o \
unix/globbuf.o \
unix/mkkey.o \
unix/cisam.o \
/home/informix/lib/libisam.a;
	@actions/opt $(language) generation

general/control.exe : general/batch.o \
general/files.o \
general/globdef.o \
general/log.o \
general/str.o \
general/string.o \
general/logname.o \
general/windows.o \
general/wnd.o \
general/level.o \
general/error.o \
general/lastactive.o \
unix/paspar.o \
unix/logc.o \
unix/mb.o \
unix/wch.o \
unix/wipc.o \
unix/sockipc.o \
unix/pc.o \
unix/globbuf.o \
unix/mkkey.o \
general/control.o \
unix/cisam.o \
/home/informix/lib/libisam.a;
	@actions/opt general control

tools/mrudomcom.exe : general/string.o \
tools/tstring.o \
general/mem.o \
general/log.o \
general/str.o \
general/logname.o \
general/files.o \
tools/mrudomcomlangspec.o \
tools/mrudomcomdecl.o \
tools/mrudomcomrules.o \
tools/mrudomcomscanner.o \
tools/mrudomcomgraph.o \
tools/mrudomcomgraphdef.o \
tools/mrudomcomparser.o \
unix/cisam.o \
unix/paspar.o \
/home/informix/lib/libisam.a \
tools/mrudomcom.o;
	@actions/opt tools mrudomcom

tools/afxpr.exe : tools/afxpr.gensur \
tools/afxpr.gendom \
tools/neededforcompiler.pf ;
	@actions/gen tools afxpr

tools/ilacom.exe : tools/ilacom.gensur \
tools/ilacom.gendom \
tools/neededforcompiler.pf ;
	@actions/gen tools ilacom

$(language)/mrucom.exe : tools/mrucom.gensur \
tools/mrucom.gendom \
$(language)/lduniquerels.o \
$(language)/lsauxdom.o \
$(language)/neededforcompiler.pf ;
	@actions/gen $(language) mrucom

$(language)/surfcom.exe : tools/surfcom.gensur \
tools/surfcom.gendom \
$(language)/neededforcompiler.pf ;
	@actions/gen $(language) surfcom

$(language)/surflink.exe : tools/surflink.gensur \
tools/surflink.gendom \
$(language)/neededforcompiler.pf ;
	@actions/gen $(language) surflink

$(language)/auxcom.exe : tools/auxcom.gensur \
tools/auxcom.gendom \
$(language)/neededforcompiler.pf ;
	@actions/gen $(language) auxcom

$(language)/tracom.exe : tools/tracom.gensur \
tools/tracom.gendom \
$(language)/ldmrules.o \
$(language)/lsauxdom.o \
$(language)/ldsubgrammars.o \
$(language)/helpsubgrammars.o \
interlingua/liilrules.o \
$(language)/neededforcompiler.pf ;
	@actions/gen $(language) tracom

tools/lexedcontrol.exe : tools/lexedcontrol.o \
general/globdef.o \
general/log.o \
general/str.o \
general/string.o \
general/logname.o \
general/files.o \
general/windows.o \
general/wnd.o \
general/error.o \
tools/lexedaux.o \
unix/paspar.o \
unix/logc.o \
unix/mb.o \
unix/wch.o \
unix/wipc.o \
unix/sockipc.o \
unix/pc.o \
unix/globbuf.o \
unix/mkkey.o \
unix/cisam.o \
/home/informix/lib/libisam.a;
	@actions/opt tools lexedcontrol

$(language)/lexed.exe : $(language)/lexed.o \
$(language)/copyt.o \
$(language)/decomlexrules1.o \
$(language)/decomlexrules2.o \
$(language)/decomlexrules3.o \
$(language)/genlexif.o \
$(language)/helpsubgrammars.o \
$(language)/ldblex.o \
$(language)/ldcatsets.o \
$(language)/ldconvrec.o \
$(language)/ldgetkey.o \
$(language)/ldmdict.o \
$(language)/ldmeasuresize.o \
$(language)/ldmorfdef.o \
$(language)/ldmrules.o \
$(language)/ldstrtotype.o \
$(language)/ldsubgrammars.o \
$(language)/ldsucc.o \
$(language)/ldtypetostr.o \
$(language)/lsauxdom.o \
$(language)/lsconvattr.o \
$(language)/lsconvrec.o \
$(language)/lsmatches.o \
$(language)/lsmruquo.o \
$(language)/lsphondef.o \
$(language)/lsstrtotype.o \
$(language)/lstypetostr.o \
$(language)/maket.o \
$(language)/lslexed.o \
tools/lexedaux.o \
general/config.o \
general/debug.o \
general/debugmparser.o \
general/debugmgenerator.o \
general/loop.o \
general/drawstree.o \
general/drawtree.o \
general/drawtreeset.o \
general/level.o \
general/lastactive.o \
general/error.o \
general/files.o \
general/globdef.o \
general/globsubst.o \
general/gwhere.o \
general/hiltree.o \
general/hyperdtree.o \
general/interface0.o \
general/interface1.o \
general/lifixiddict.o \
general/liiddict.o \
general/liildict.o \
general/limatches.o \
general/lisdict.o \
general/lisiddict.o \
general/liscomment.o \
general/limcomment.o \
general/lilock.o \
general/listree.o \
general/log.o \
general/logname.o \
general/mem.o \
general/oldtree.o \
general/rectoscreen.o \
general/lirectoscreen.o \
general/str.o \
general/string.o \
general/strtokey.o \
general/strtomkey.o \
general/windows.o \
general/wnd.o \
interlingua/liilrules.o \
unix/renamefixid.o \
unix/paspar.o \
unix/logc.o \
unix/mb.o \
unix/pc.o \
unix/wch.o \
unix/wipc.o \
unix/sockipc.o \
unix/globbuf.o \
unix/mkkey.o \
unix/cisam.o \
/home/informix/lib/libisam.a ;
	@actions/opt $(language) lexed

tools/lockinit.exe : tools/lockinit.o \
general/lilock.o \
general/str.o \
general/logname.o \
unix/paspar.o \
unix/logc.o \
unix/mb.o \
unix/pc.o \
unix/wch.o \
unix/wipc.o \
unix/sockipc.o \
unix/globbuf.o \
unix/mkkey.o \
unix/cisam.o \
/home/informix/lib/libisam.a ;
	@actions/opt tools lockinit

# Hieronder staan enkele nep-afhankelijkheden om de files gencom"i".opt te
# kunnen genereren. Deze worden afhankelijk van de gegenereerde compiler
# samengesmeed to 1 optfile. Zie de file "actions/gen"

# alle gegenereerde compilers zijn afhankelijk van:

tools/gencom1.exe : general/string.o \
tools/tstring.o \
general/str.o \
general/logname.o \
general/files.o \
tools/tfiles.o \
general/mem.o \
general/listree.o \
general/globdef.o \
general/strtokey.o \
general/hiltree.o \
general/hyperdtree.o \
general/error.o \
general/level.o \
general/wnd.o \
general/log.o \
general/globsubst.o \
general/drawtree.o \
general/oldtree.o \
general/drawstree.o \
general/drawtreeset.o \
general/debugmgenerator.o \
general/debugmparser.o \
general/strtomkey.o \
general/lirectoscreen.o \
general/loop.o \
unix/cisam.o \
unix/paspar.o \
unix/globbuf.o \
unix/logc.o \
unix/mkkey.o \
unix/wch.o \
unix/wipc.o \
unix/sockipc.o \
/home/informix/lib/libisam.a ;
	@nep

# alle taalafhankelijke gegenereerde compilers zijn afhankelijk van:

$(language)/gencom2.exe : $(language)/ldgetkey.o \
$(language)/ldconvrec.o \
$(language)/ldstrtotype.o \
$(language)/ldcatsets.o \
$(language)/lsconvrec.o \
$(language)/ldstrtostr.o \
$(language)/lsstrtotype.o \
$(language)/lstypetostr.o \
$(language)/lsconvattr.o \
$(language)/ldtypetostr.o \
$(language)/maket.o \
interlingua/liilrules.o \
general/windows.o \
general/rectoscreen.o \
general/debug.o \
general/liiddict.o \
tools/tldconvrec.o \
tools/tldstrtostr.o ;
	@nep

#mrucom.exe en tracom.exe zijn afhankelijk van:

$(language)/gencom3.exe : $(language)/lsmruquo.o \
$(language)/ldmrules.o \
$(language)/ldsubgrammars.o \
$(language)/helpsubgrammars.o ;
	@nep

#mrucom.exe en tracom.exe zijn afhankelijk van:

$(language)/gencom4.exe : $(language)/lduniquerels.o \
$(language)/lsauxdom.o ;
	@nep

$(language)/gencom5.exe : general/string.o \
general/str.o \
general/logname.o \
unix/cisam.o \
unix/paspar.o \
/home/informix/lib/libisam.a ;
	@nep

Xw/Xw.exe : Xw/Xw.o \
Xw/Xwa.o \
Xw/Xwb.o \
Xw/Xwd.o \
Xw/Xwh.o \
Xw/Xwl.o \
Xw/Xwm.o \
Xw/Xwr.o \
Xw/Xwt.o \
Xw/Xwu.o \
Xw/Tree.o \
Xw/Attr.o \
unix/wch.o \
unix/wipc.o \
unix/sockipc.o \
unix/mkkey.o \
unix/paspar.o \
unix/logc.o \
unix/mb.o ;
	@actions/Xopt Xw Xw

Xw/Xlex.exe : Xw/Xlex.o \
Xw/Xwa.o \
Xw/Xwb.o \
Xw/Xwd.o \
Xw/Xwh.o \
Xw/Xwl.o \
Xw/Xwm.o \
Xw/Xwr.o \
Xw/Xwt.o \
Xw/Xwu.o \
Xw/Tree.o \
Xw/Attr.o \
unix/wch.o \
unix/wipc.o \
unix/sockipc.o \
unix/mkkey.o \
unix/paspar.o \
unix/logc.o \
unix/mb.o ;
	@actions/Xopt Xw Xlex
