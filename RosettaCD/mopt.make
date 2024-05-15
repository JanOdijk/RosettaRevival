 
/home/rosetta/archive/rosetta3/dutch/asegcom.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/tools/segcomlangspec.o \
/home/rosetta/archive/rosetta3/tools/segcomdecl.o \
/home/rosetta/archive/rosetta3/tools/segcomscanner.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/dutch/ldstrtotype.o \
/home/rosetta/archive/rosetta3/tools/segcomrules.o \
/home/rosetta/archive/rosetta3/tools/segcomgraph.o \
/home/rosetta/archive/rosetta3/tools/segcomgraphdef.o \
/home/rosetta/archive/rosetta3/tools/segcomparser.o \
/home/rosetta/archive/rosetta3/tools/asegcom.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) asegcom
 
tools/target/constraintgen.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/files.o \
tools/target/constraintgen.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt tools constraintgen
 
/home/rosetta/archive/rosetta3/tools/domcom.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/tools/tstring.o \
/home/rosetta/archive/rosetta3/general/mem.o \
/home/rosetta/archive/rosetta3/general/log.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/tools/domcomlangspec.o \
/home/rosetta/archive/rosetta3/tools/domcomdecl.o \
/home/rosetta/archive/rosetta3/tools/domcomrules.o \
/home/rosetta/archive/rosetta3/tools/domcomscanner.o \
/home/rosetta/archive/rosetta3/tools/domcomgraph.o \
/home/rosetta/archive/rosetta3/tools/domcomgraphdef.o \
/home/rosetta/archive/rosetta3/tools/domcomparser.o \
/home/rosetta/archive/rosetta3/tools/domcom.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt tools domcom
 
/home/rosetta/archive/rosetta3/tools/fixidgen.exe : /home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/mem.o \
/home/rosetta/archive/rosetta3/general/debug.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/interface0.o \
/home/rosetta/archive/rosetta3/tools/fixidgen.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/lifixiddict.o \
/home/rosetta/archive/rosetta3/general/windows.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/general/log.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt tools fixidgen
 
dutch/target/genblexdict.exe : dutch/target/genblexdict.o \
/home/rosetta/archive/rosetta3/dutch/ldblex.o \
/home/rosetta/archive/rosetta3/dutch/ldconvrec.o \
/home/rosetta/archive/rosetta3/dutch/ldgetkey.o \
/home/rosetta/archive/rosetta3/dutch/ldstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/ldtypetostr.o \
/home/rosetta/archive/rosetta3/dutch/lsconvattr.o \
/home/rosetta/archive/rosetta3/dutch/lsconvrec.o \
/home/rosetta/archive/rosetta3/dutch/lsstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/lstypetostr.o \
/home/rosetta/archive/rosetta3/dutch/maket.o \
/home/rosetta/archive/rosetta3/general/debug.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/interface1.o \
/home/rosetta/archive/rosetta3/general/lisdict.o \
/home/rosetta/archive/rosetta3/general/listree.o \
/home/rosetta/archive/rosetta3/general/log.o \
/home/rosetta/archive/rosetta3/general/mem.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/windows.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) genblexdict
 
/home/rosetta/archive/rosetta3/dutch/genblexisf.exe : /home/rosetta/archive/rosetta3/dutch/genblexisf.o \
/home/rosetta/archive/rosetta3/dutch/ldblex.o \
/home/rosetta/archive/rosetta3/dutch/ldconvrec.o \
/home/rosetta/archive/rosetta3/dutch/ldgetkey.o \
/home/rosetta/archive/rosetta3/dutch/ldstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/ldtypetostr.o \
/home/rosetta/archive/rosetta3/dutch/lsconvattr.o \
/home/rosetta/archive/rosetta3/dutch/lsconvrec.o \
/home/rosetta/archive/rosetta3/dutch/lsstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/lstypetostr.o \
/home/rosetta/archive/rosetta3/dutch/maket.o \
/home/rosetta/archive/rosetta3/general/debug.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/interface1.o \
/home/rosetta/archive/rosetta3/general/lisdict.o \
/home/rosetta/archive/rosetta3/general/listree.o \
/home/rosetta/archive/rosetta3/general/log.o \
/home/rosetta/archive/rosetta3/general/mem.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/windows.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) genblexisf
 
/home/rosetta/archive/rosetta3/tools/gencomp.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/tools/gencomp.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a ;
	@/home/rosetta/archive/rosetta3/actions/opt tools gencomp
 
/home/rosetta/archive/rosetta3/dutch/geniddictdata.exe : /home/rosetta/archive/rosetta3/dutch/geniddictdata.o \
/home/rosetta/archive/rosetta3/dutch/ldblex.o \
/home/rosetta/archive/rosetta3/dutch/ldconvrec.o \
/home/rosetta/archive/rosetta3/dutch/ldgetkey.o \
/home/rosetta/archive/rosetta3/dutch/ldstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/ldtypetostr.o \
/home/rosetta/archive/rosetta3/dutch/lsconvattr.o \
/home/rosetta/archive/rosetta3/dutch/lsconvrec.o \
/home/rosetta/archive/rosetta3/dutch/lsstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/lstypetostr.o \
/home/rosetta/archive/rosetta3/dutch/maket.o \
/home/rosetta/archive/rosetta3/general/debug.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/interface1.o \
/home/rosetta/archive/rosetta3/general/lisdict.o \
/home/rosetta/archive/rosetta3/general/listree.o \
/home/rosetta/archive/rosetta3/general/log.o \
/home/rosetta/archive/rosetta3/general/mem.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/windows.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) geniddictdata
 
dutch/target/geniddicttext.exe : dutch/target/geniddicttext.o \
/home/rosetta/archive/rosetta3/dutch/ldblex.o \
/home/rosetta/archive/rosetta3/dutch/ldconvrec.o \
/home/rosetta/archive/rosetta3/dutch/ldgetkey.o \
/home/rosetta/archive/rosetta3/dutch/ldstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/ldtypetostr.o \
/home/rosetta/archive/rosetta3/dutch/lsconvattr.o \
/home/rosetta/archive/rosetta3/dutch/lsconvrec.o \
/home/rosetta/archive/rosetta3/dutch/lsstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/lstypetostr.o \
/home/rosetta/archive/rosetta3/dutch/maket.o \
/home/rosetta/archive/rosetta3/general/debug.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/interface1.o \
/home/rosetta/archive/rosetta3/general/lisdict.o \
/home/rosetta/archive/rosetta3/general/listree.o \
/home/rosetta/archive/rosetta3/general/log.o \
/home/rosetta/archive/rosetta3/general/mem.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/windows.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) geniddicttext
 
tools/target/genildicttext.exe : /home/rosetta/archive/rosetta3/general/debug.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/liildict.o \
/home/rosetta/archive/rosetta3/general/log.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/strtomkey.o \
/home/rosetta/archive/rosetta3/general/windows.o \
tools/target/genildicttext.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt tools genildicttext
 
/home/rosetta/archive/rosetta3/tools/genmake.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/tools/genmake.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt tools genmake
 
/home/rosetta/archive/rosetta3/dutch/genmdictdata.exe : /home/rosetta/archive/rosetta3/dutch/genmdictdata.o \
/home/rosetta/archive/rosetta3/dutch/ldblex.o \
/home/rosetta/archive/rosetta3/dutch/ldconvrec.o \
/home/rosetta/archive/rosetta3/dutch/ldgetkey.o \
/home/rosetta/archive/rosetta3/dutch/ldstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/ldtypetostr.o \
/home/rosetta/archive/rosetta3/dutch/lsconvattr.o \
/home/rosetta/archive/rosetta3/dutch/lsconvrec.o \
/home/rosetta/archive/rosetta3/dutch/lsstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/lstypetostr.o \
/home/rosetta/archive/rosetta3/dutch/maket.o \
/home/rosetta/archive/rosetta3/general/debug.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/interface1.o \
/home/rosetta/archive/rosetta3/general/lisdict.o \
/home/rosetta/archive/rosetta3/general/listree.o \
/home/rosetta/archive/rosetta3/general/log.o \
/home/rosetta/archive/rosetta3/general/mem.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/windows.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/dutch/ldlexconvert.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) genmdictdata
 
dutch/target/genmdicttext.exe : general/target/genmdicttext.o \
/home/rosetta/archive/rosetta3/dutch/ldblex.o \
/home/rosetta/archive/rosetta3/dutch/ldconvrec.o \
/home/rosetta/archive/rosetta3/dutch/ldgetkey.o \
/home/rosetta/archive/rosetta3/dutch/ldstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/ldtypetostr.o \
/home/rosetta/archive/rosetta3/dutch/lsconvattr.o \
/home/rosetta/archive/rosetta3/dutch/lsconvrec.o \
/home/rosetta/archive/rosetta3/dutch/lsstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/lstypetostr.o \
/home/rosetta/archive/rosetta3/dutch/maket.o \
/home/rosetta/archive/rosetta3/general/debug.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/interface1.o \
/home/rosetta/archive/rosetta3/general/lisdict.o \
/home/rosetta/archive/rosetta3/general/listree.o \
/home/rosetta/archive/rosetta3/general/log.o \
/home/rosetta/archive/rosetta3/general/mem.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/windows.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/dutch/ldlexconvert.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) genmdicttext
 
/home/rosetta/archive/rosetta3/tools/gensdictdata.exe : /home/rosetta/archive/rosetta3/tools/gensdictdata.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/lisdict.o \
/home/rosetta/archive/rosetta3/general/debug.o \
/home/rosetta/archive/rosetta3/general/windows.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt tools gensdictdata
 
/home/rosetta/archive/rosetta3/tools/genildictdata.exe : /home/rosetta/archive/rosetta3/tools/genildictdata.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/liildict.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/debug.o \
/home/rosetta/archive/rosetta3/general/windows.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/strtomkey.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt tools genildictdata
 
 
 
/home/rosetta/archive/rosetta3/tools/gensiddictdata.exe : /home/rosetta/archive/rosetta3/tools/gensiddictdata.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/lisiddict.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/debug.o \
/home/rosetta/archive/rosetta3/general/windows.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/strtomkey.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt tools gensiddictdata
 
tools/target/gensiddicttext.exe : tools/target/gensiddicttext.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/lisiddict.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/strtomkey.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt tools gensiddicttext
 
/home/rosetta/archive/rosetta3/tools/genscommentdata.exe : /home/rosetta/archive/rosetta3/tools/genscommentdata.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/liscomment.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/strtomkey.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt tools genscommentdata
 
/home/rosetta/archive/rosetta3/tools/genscommenttext.exe : /home/rosetta/archive/rosetta3/tools/genscommenttext.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/liscomment.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/strtomkey.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt tools genscommenttext
 
/home/rosetta/archive/rosetta3/tools/genmcommenttext.exe : /home/rosetta/archive/rosetta3/tools/genmcommenttext.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/limcomment.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/strtomkey.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt tools genmcommenttext
 
/home/rosetta/archive/rosetta3/tools/genmcommentdata.exe : /home/rosetta/archive/rosetta3/tools/genmcommentdata.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/limcomment.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/strtomkey.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt tools genmcommentdata
 
/home/rosetta/archive/rosetta3/dutch/gsegcom.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/tools/segcomlangspec.o \
/home/rosetta/archive/rosetta3/tools/segcomdecl.o \
/home/rosetta/archive/rosetta3/tools/segcomscanner.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/dutch/ldstrtotype.o \
/home/rosetta/archive/rosetta3/tools/segcomrules.o \
/home/rosetta/archive/rosetta3/tools/segcomgraph.o \
/home/rosetta/archive/rosetta3/tools/segcomgraphdef.o \
/home/rosetta/archive/rosetta3/tools/segcomparser.o \
/home/rosetta/archive/rosetta3/tools/gsegcom.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) gsegcom
 
/home/rosetta/archive/rosetta3/dutch/lexcom.exe : /home/rosetta/archive/rosetta3/tools/lexcomdecl.o \
/home/rosetta/archive/rosetta3/tools/lexcomscanner.o \
/home/rosetta/archive/rosetta3/tools/lexcomrules.o \
/home/rosetta/archive/rosetta3/tools/lexcomgraphdef.o \
/home/rosetta/archive/rosetta3/tools/lexcomgraph.o \
/home/rosetta/archive/rosetta3/tools/lexcomparser.o \
/home/rosetta/archive/rosetta3/tools/lexcomcode.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/dutch/ldstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/ldcatsets.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/dutch/ldstrtostr.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/tools/lexcom.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) lexcom
 
/home/rosetta/archive/rosetta3/dutch/lexlink.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/dutch/ldstrtotype.o \
/home/rosetta/archive/rosetta3/tools/lexlink.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) lexlink
 
tools/target/mmstomake.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
tools/target/mmstomake.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt tools mmstomake
 
/home/rosetta/archive/rosetta3/tools/mopttoopt.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/tools/mopttoopt.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt tools mopttoopt
 
/home/rosetta/archive/rosetta3/dutch/mrulelink.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/dutch/ldstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/ldstrtostr.o \
/home/rosetta/archive/rosetta3/tools/mrulelink.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) mrulelink
 
/home/rosetta/archive/rosetta3/tools/strkey.exe : /home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/windows.o \
/home/rosetta/archive/rosetta3/general/error.o \
tools/target/strkey.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt tools strkey
 
/home/rosetta/archive/rosetta3/tools/strmkey.exe : /home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/strtomkey.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/windows.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/tools/strmkey.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt tools strmkey
 
/home/rosetta/archive/rosetta3/dutch/surcom.exe : /home/rosetta/archive/rosetta3/tools/surcomdecl.o \
/home/rosetta/archive/rosetta3/tools/surcomrules.o \
/home/rosetta/archive/rosetta3/tools/surcomgraph.o \
/home/rosetta/archive/rosetta3/tools/surcomgraphdef.o \
/home/rosetta/archive/rosetta3/tools/surcomparser.o \
/home/rosetta/archive/rosetta3/dutch/ldstrtotype.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/tools/surcomcode.o \
/home/rosetta/archive/rosetta3/tools/surcomscanner.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/tools/surcom.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) surcom
 
/home/rosetta/archive/rosetta3/dutch/analysis.exe : /home/rosetta/archive/rosetta3/dutch/anlexif.o \
/home/rosetta/archive/rosetta3/dutch/comlexrules1.o \
/home/rosetta/archive/rosetta3/dutch/comlexrules2.o \
/home/rosetta/archive/rosetta3/dutch/comlexrules3.o \
/home/rosetta/archive/rosetta3/dutch/copyt.o \
/home/rosetta/archive/rosetta3/dutch/decommrules1.o \
/home/rosetta/archive/rosetta3/dutch/decommrules10.o \
/home/rosetta/archive/rosetta3/dutch/decommrules100.o \
/home/rosetta/archive/rosetta3/dutch/decommrules101.o \
/home/rosetta/archive/rosetta3/dutch/decommrules102.o \
/home/rosetta/archive/rosetta3/dutch/decommrules103.o \
/home/rosetta/archive/rosetta3/dutch/decommrules104.o \
/home/rosetta/archive/rosetta3/dutch/decommrules105.o \
/home/rosetta/archive/rosetta3/dutch/decommrules106.o \
/home/rosetta/archive/rosetta3/dutch/decommrules107.o \
/home/rosetta/archive/rosetta3/dutch/decommrules108.o \
/home/rosetta/archive/rosetta3/dutch/decommrules109.o \
/home/rosetta/archive/rosetta3/dutch/decommrules11.o \
/home/rosetta/archive/rosetta3/dutch/decommrules110.o \
/home/rosetta/archive/rosetta3/dutch/decommrules111.o \
/home/rosetta/archive/rosetta3/dutch/decommrules112.o \
/home/rosetta/archive/rosetta3/dutch/decommrules113.o \
/home/rosetta/archive/rosetta3/dutch/decommrules114.o \
/home/rosetta/archive/rosetta3/dutch/decommrules115.o \
/home/rosetta/archive/rosetta3/dutch/decommrules116.o \
/home/rosetta/archive/rosetta3/dutch/decommrules117.o \
/home/rosetta/archive/rosetta3/dutch/decommrules118.o \
/home/rosetta/archive/rosetta3/dutch/decommrules119.o \
/home/rosetta/archive/rosetta3/dutch/decommrules12.o \
/home/rosetta/archive/rosetta3/dutch/decommrules120.o \
/home/rosetta/archive/rosetta3/dutch/decommrules121.o \
/home/rosetta/archive/rosetta3/dutch/decommrules122.o \
/home/rosetta/archive/rosetta3/dutch/decommrules123.o \
/home/rosetta/archive/rosetta3/dutch/decommrules124.o \
/home/rosetta/archive/rosetta3/dutch/decommrules125.o \
/home/rosetta/archive/rosetta3/dutch/decommrules126.o \
/home/rosetta/archive/rosetta3/dutch/decommrules127.o \
/home/rosetta/archive/rosetta3/dutch/decommrules128.o \
/home/rosetta/archive/rosetta3/dutch/decommrules129.o \
/home/rosetta/archive/rosetta3/dutch/decommrules13.o \
/home/rosetta/archive/rosetta3/dutch/decommrules130.o \
/home/rosetta/archive/rosetta3/dutch/decommrules131.o \
/home/rosetta/archive/rosetta3/dutch/decommrules132.o \
/home/rosetta/archive/rosetta3/dutch/decommrules133.o \
/home/rosetta/archive/rosetta3/dutch/decommrules134.o \
/home/rosetta/archive/rosetta3/dutch/decommrules135.o \
/home/rosetta/archive/rosetta3/dutch/decommrules136.o \
/home/rosetta/archive/rosetta3/dutch/decommrules137.o \
/home/rosetta/archive/rosetta3/dutch/decommrules138.o \
/home/rosetta/archive/rosetta3/dutch/decommrules139.o \
/home/rosetta/archive/rosetta3/dutch/decommrules14.o \
/home/rosetta/archive/rosetta3/dutch/decommrules140.o \
/home/rosetta/archive/rosetta3/dutch/decommrules15.o \
/home/rosetta/archive/rosetta3/dutch/decommrules16.o \
/home/rosetta/archive/rosetta3/dutch/decommrules17.o \
/home/rosetta/archive/rosetta3/dutch/decommrules18.o \
/home/rosetta/archive/rosetta3/dutch/decommrules19.o \
/home/rosetta/archive/rosetta3/dutch/decommrules2.o \
/home/rosetta/archive/rosetta3/dutch/decommrules20.o \
/home/rosetta/archive/rosetta3/dutch/decommrules21.o \
/home/rosetta/archive/rosetta3/dutch/decommrules22.o \
/home/rosetta/archive/rosetta3/dutch/decommrules23.o \
/home/rosetta/archive/rosetta3/dutch/decommrules24.o \
/home/rosetta/archive/rosetta3/dutch/decommrules25.o \
/home/rosetta/archive/rosetta3/dutch/decommrules26.o \
/home/rosetta/archive/rosetta3/dutch/decommrules27.o \
/home/rosetta/archive/rosetta3/dutch/decommrules28.o \
/home/rosetta/archive/rosetta3/dutch/decommrules29.o \
/home/rosetta/archive/rosetta3/dutch/decommrules3.o \
/home/rosetta/archive/rosetta3/dutch/decommrules30.o \
/home/rosetta/archive/rosetta3/dutch/decommrules31.o \
/home/rosetta/archive/rosetta3/dutch/decommrules32.o \
/home/rosetta/archive/rosetta3/dutch/decommrules33.o \
/home/rosetta/archive/rosetta3/dutch/decommrules34.o \
/home/rosetta/archive/rosetta3/dutch/decommrules35.o \
/home/rosetta/archive/rosetta3/dutch/decommrules36.o \
/home/rosetta/archive/rosetta3/dutch/decommrules37.o \
/home/rosetta/archive/rosetta3/dutch/decommrules38.o \
/home/rosetta/archive/rosetta3/dutch/decommrules39.o \
/home/rosetta/archive/rosetta3/dutch/decommrules4.o \
/home/rosetta/archive/rosetta3/dutch/decommrules40.o \
/home/rosetta/archive/rosetta3/dutch/decommrules41.o \
/home/rosetta/archive/rosetta3/dutch/decommrules42.o \
/home/rosetta/archive/rosetta3/dutch/decommrules43.o \
/home/rosetta/archive/rosetta3/dutch/decommrules44.o \
/home/rosetta/archive/rosetta3/dutch/decommrules45.o \
/home/rosetta/archive/rosetta3/dutch/decommrules46.o \
/home/rosetta/archive/rosetta3/dutch/decommrules47.o \
/home/rosetta/archive/rosetta3/dutch/decommrules48.o \
/home/rosetta/archive/rosetta3/dutch/decommrules49.o \
/home/rosetta/archive/rosetta3/dutch/decommrules5.o \
/home/rosetta/archive/rosetta3/dutch/decommrules50.o \
/home/rosetta/archive/rosetta3/dutch/decommrules51.o \
/home/rosetta/archive/rosetta3/dutch/decommrules52.o \
/home/rosetta/archive/rosetta3/dutch/decommrules53.o \
/home/rosetta/archive/rosetta3/dutch/decommrules54.o \
/home/rosetta/archive/rosetta3/dutch/decommrules55.o \
/home/rosetta/archive/rosetta3/dutch/decommrules56.o \
/home/rosetta/archive/rosetta3/dutch/decommrules57.o \
/home/rosetta/archive/rosetta3/dutch/decommrules58.o \
/home/rosetta/archive/rosetta3/dutch/decommrules59.o \
/home/rosetta/archive/rosetta3/dutch/decommrules6.o \
/home/rosetta/archive/rosetta3/dutch/decommrules60.o \
/home/rosetta/archive/rosetta3/dutch/decommrules61.o \
/home/rosetta/archive/rosetta3/dutch/decommrules62.o \
/home/rosetta/archive/rosetta3/dutch/decommrules63.o \
/home/rosetta/archive/rosetta3/dutch/decommrules64.o \
/home/rosetta/archive/rosetta3/dutch/decommrules65.o \
/home/rosetta/archive/rosetta3/dutch/decommrules66.o \
/home/rosetta/archive/rosetta3/dutch/decommrules67.o \
/home/rosetta/archive/rosetta3/dutch/decommrules68.o \
/home/rosetta/archive/rosetta3/dutch/decommrules69.o \
/home/rosetta/archive/rosetta3/dutch/decommrules7.o \
/home/rosetta/archive/rosetta3/dutch/decommrules70.o \
/home/rosetta/archive/rosetta3/dutch/decommrules71.o \
/home/rosetta/archive/rosetta3/dutch/decommrules72.o \
/home/rosetta/archive/rosetta3/dutch/decommrules73.o \
/home/rosetta/archive/rosetta3/dutch/decommrules74.o \
/home/rosetta/archive/rosetta3/dutch/decommrules75.o \
/home/rosetta/archive/rosetta3/dutch/decommrules76.o \
/home/rosetta/archive/rosetta3/dutch/decommrules77.o \
/home/rosetta/archive/rosetta3/dutch/decommrules78.o \
/home/rosetta/archive/rosetta3/dutch/decommrules79.o \
/home/rosetta/archive/rosetta3/dutch/decommrules8.o \
/home/rosetta/archive/rosetta3/dutch/decommrules80.o \
/home/rosetta/archive/rosetta3/dutch/decommrules81.o \
/home/rosetta/archive/rosetta3/dutch/decommrules82.o \
/home/rosetta/archive/rosetta3/dutch/decommrules83.o \
/home/rosetta/archive/rosetta3/dutch/decommrules84.o \
/home/rosetta/archive/rosetta3/dutch/decommrules85.o \
/home/rosetta/archive/rosetta3/dutch/decommrules86.o \
/home/rosetta/archive/rosetta3/dutch/decommrules87.o \
/home/rosetta/archive/rosetta3/dutch/decommrules88.o \
/home/rosetta/archive/rosetta3/dutch/decommrules89.o \
/home/rosetta/archive/rosetta3/dutch/decommrules9.o \
/home/rosetta/archive/rosetta3/dutch/decommrules90.o \
/home/rosetta/archive/rosetta3/dutch/decommrules91.o \
/home/rosetta/archive/rosetta3/dutch/decommrules92.o \
/home/rosetta/archive/rosetta3/dutch/decommrules93.o \
/home/rosetta/archive/rosetta3/dutch/decommrules94.o \
/home/rosetta/archive/rosetta3/dutch/decommrules95.o \
/home/rosetta/archive/rosetta3/dutch/decommrules96.o \
/home/rosetta/archive/rosetta3/dutch/decommrules97.o \
/home/rosetta/archive/rosetta3/dutch/decommrules98.o \
/home/rosetta/archive/rosetta3/dutch/decommrules99.o \
/home/rosetta/archive/rosetta3/dutch/helpsubgrammars.o \
/home/rosetta/archive/rosetta3/dutch/ldaffixlex.o \
/home/rosetta/archive/rosetta3/dutch/ldanilrules.o \
/home/rosetta/archive/rosetta3/dutch/ldanmrules.o \
/home/rosetta/archive/rosetta3/dutch/ldblex.o \
/home/rosetta/archive/rosetta3/dutch/ldcatsets.o \
/home/rosetta/archive/rosetta3/dutch/ldconvrec.o \
/home/rosetta/archive/rosetta3/dutch/ldequal.o \
/home/rosetta/archive/rosetta3/dutch/ldgetkey.o \
/home/rosetta/archive/rosetta3/dutch/ldgluelex.o \
/home/rosetta/archive/rosetta3/dutch/ldmdict.o \
/home/rosetta/archive/rosetta3/dutch/ldmeasuresize.o \
/home/rosetta/archive/rosetta3/dutch/ldmrules.o \
/home/rosetta/archive/rosetta3/dutch/ldprims.o \
/home/rosetta/archive/rosetta3/dutch/ldstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/ldsubgrammars.o \
/home/rosetta/archive/rosetta3/dutch/ldsucc.o \
/home/rosetta/archive/rosetta3/dutch/ldsurfswitch.o \
/home/rosetta/archive/rosetta3/dutch/ldtypetostr.o \
/home/rosetta/archive/rosetta3/dutch/lsauxdom.o \
/home/rosetta/archive/rosetta3/dutch/lsconvattr.o \
/home/rosetta/archive/rosetta3/dutch/lsconvrec.o \
/home/rosetta/archive/rosetta3/dutch/lsmruquo.o \
/home/rosetta/archive/rosetta3/dutch/lsstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/lssurfquo.o \
/home/rosetta/archive/rosetta3/dutch/lstypetostr.o \
/home/rosetta/archive/rosetta3/dutch/maket.o \
/home/rosetta/archive/rosetta3/dutch/surfrules.o \
/home/rosetta/archive/rosetta3/dutch/surfrulesblocks.o \
/home/rosetta/archive/rosetta3/dutch/surfrulesgraphs.o \
/home/rosetta/archive/rosetta3/dutch/ldmorfdef.o \
/home/rosetta/archive/rosetta3/dutch/lsmatches.o \
/home/rosetta/archive/rosetta3/dutch/lsphondef.o \
/home/rosetta/archive/rosetta3/general/aidderiv.o \
/home/rosetta/archive/rosetta3/general/alayout.o \
/home/rosetta/archive/rosetta3/general/alex.o \
/home/rosetta/archive/rosetta3/general/alextree.o \
/home/rosetta/archive/rosetta3/general/amorph.o \
/home/rosetta/archive/rosetta3/general/analysis.o \
/home/rosetta/archive/rosetta3/general/asegm.o \
/home/rosetta/archive/rosetta3/general/asegmrules.o \
/home/rosetta/archive/rosetta3/general/atransfer.o \
/home/rosetta/archive/rosetta3/general/awhere.o \
/home/rosetta/archive/rosetta3/general/config.o \
/home/rosetta/archive/rosetta3/general/debug.o \
/home/rosetta/archive/rosetta3/general/debugmparser.o \
/home/rosetta/archive/rosetta3/general/debugmgenerator.o \
/home/rosetta/archive/rosetta3/general/loop.o \
/home/rosetta/archive/rosetta3/general/drawhiltree.o \
/home/rosetta/archive/rosetta3/general/drawhyperdtree.o \
/home/rosetta/archive/rosetta3/general/drawstree.o \
/home/rosetta/archive/rosetta3/general/drawsuperdtree.o \
/home/rosetta/archive/rosetta3/general/drawtree.o \
/home/rosetta/archive/rosetta3/general/drawtreeset.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/general/lastactive.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/globsubst.o \
/home/rosetta/archive/rosetta3/general/hiltree.o \
/home/rosetta/archive/rosetta3/general/hyperdtree.o \
/home/rosetta/archive/rosetta3/general/interface0.o \
/home/rosetta/archive/rosetta3/general/interface1.o \
/home/rosetta/archive/rosetta3/general/interface7.o \
/home/rosetta/archive/rosetta3/general/lifixiddict.o \
/home/rosetta/archive/rosetta3/general/liiddict.o \
/home/rosetta/archive/rosetta3/general/liildict.o \
/home/rosetta/archive/rosetta3/general/limatches.o \
/home/rosetta/archive/rosetta3/general/limrules.o \
/home/rosetta/archive/rosetta3/general/liprims.o \
/home/rosetta/archive/rosetta3/general/lisdict.o \
/home/rosetta/archive/rosetta3/general/lisiddict.o \
/home/rosetta/archive/rosetta3/general/listree.o \
/home/rosetta/archive/rosetta3/general/log.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/mem.o \
/home/rosetta/archive/rosetta3/general/mparser.o \
/home/rosetta/archive/rosetta3/general/mpstatistics.o \
/home/rosetta/archive/rosetta3/general/oldtree.o \
/home/rosetta/archive/rosetta3/general/printerf.o \
/home/rosetta/archive/rosetta3/general/printerf1.o \
/home/rosetta/archive/rosetta3/general/printerf2.o \
/home/rosetta/archive/rosetta3/general/printerf3.o \
/home/rosetta/archive/rosetta3/general/printerf4.o \
/home/rosetta/archive/rosetta3/general/printerf5.o \
/home/rosetta/archive/rosetta3/general/printerf6.o \
/home/rosetta/archive/rosetta3/general/printerf7.o \
/home/rosetta/archive/rosetta3/general/rectoscreen.o \
/home/rosetta/archive/rosetta3/general/lirectoscreen.o \
/home/rosetta/archive/rosetta3/general/segmrules.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/strtomkey.o \
/home/rosetta/archive/rosetta3/general/superdtree.o \
/home/rosetta/archive/rosetta3/general/surfparser.o \
/home/rosetta/archive/rosetta3/general/windows.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/interlingua/liilrules.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/unix/mb.o \
/home/rosetta/archive/rosetta3/unix/pc.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/unix/globbuf.o \
/home/rosetta/archive/rosetta3/unix/mkkey.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) analysis
 
/home/rosetta/archive/rosetta3/dutch/generation.exe : /home/rosetta/archive/rosetta3/dutch/commrules1.o \
/home/rosetta/archive/rosetta3/dutch/commrules10.o \
/home/rosetta/archive/rosetta3/dutch/commrules100.o \
/home/rosetta/archive/rosetta3/dutch/commrules101.o \
/home/rosetta/archive/rosetta3/dutch/commrules102.o \
/home/rosetta/archive/rosetta3/dutch/commrules103.o \
/home/rosetta/archive/rosetta3/dutch/commrules104.o \
/home/rosetta/archive/rosetta3/dutch/commrules105.o \
/home/rosetta/archive/rosetta3/dutch/commrules106.o \
/home/rosetta/archive/rosetta3/dutch/commrules107.o \
/home/rosetta/archive/rosetta3/dutch/commrules108.o \
/home/rosetta/archive/rosetta3/dutch/commrules109.o \
/home/rosetta/archive/rosetta3/dutch/commrules11.o \
/home/rosetta/archive/rosetta3/dutch/commrules110.o \
/home/rosetta/archive/rosetta3/dutch/commrules111.o \
/home/rosetta/archive/rosetta3/dutch/commrules112.o \
/home/rosetta/archive/rosetta3/dutch/commrules113.o \
/home/rosetta/archive/rosetta3/dutch/commrules114.o \
/home/rosetta/archive/rosetta3/dutch/commrules115.o \
/home/rosetta/archive/rosetta3/dutch/commrules116.o \
/home/rosetta/archive/rosetta3/dutch/commrules117.o \
/home/rosetta/archive/rosetta3/dutch/commrules118.o \
/home/rosetta/archive/rosetta3/dutch/commrules119.o \
/home/rosetta/archive/rosetta3/dutch/commrules12.o \
/home/rosetta/archive/rosetta3/dutch/commrules120.o \
/home/rosetta/archive/rosetta3/dutch/commrules121.o \
/home/rosetta/archive/rosetta3/dutch/commrules122.o \
/home/rosetta/archive/rosetta3/dutch/commrules123.o \
/home/rosetta/archive/rosetta3/dutch/commrules124.o \
/home/rosetta/archive/rosetta3/dutch/commrules125.o \
/home/rosetta/archive/rosetta3/dutch/commrules126.o \
/home/rosetta/archive/rosetta3/dutch/commrules127.o \
/home/rosetta/archive/rosetta3/dutch/commrules128.o \
/home/rosetta/archive/rosetta3/dutch/commrules129.o \
/home/rosetta/archive/rosetta3/dutch/commrules13.o \
/home/rosetta/archive/rosetta3/dutch/commrules130.o \
/home/rosetta/archive/rosetta3/dutch/commrules131.o \
/home/rosetta/archive/rosetta3/dutch/commrules132.o \
/home/rosetta/archive/rosetta3/dutch/commrules133.o \
/home/rosetta/archive/rosetta3/dutch/commrules134.o \
/home/rosetta/archive/rosetta3/dutch/commrules135.o \
/home/rosetta/archive/rosetta3/dutch/commrules136.o \
/home/rosetta/archive/rosetta3/dutch/commrules137.o \
/home/rosetta/archive/rosetta3/dutch/commrules138.o \
/home/rosetta/archive/rosetta3/dutch/commrules139.o \
/home/rosetta/archive/rosetta3/dutch/commrules14.o \
/home/rosetta/archive/rosetta3/dutch/commrules140.o \
/home/rosetta/archive/rosetta3/dutch/commrules15.o \
/home/rosetta/archive/rosetta3/dutch/commrules16.o \
/home/rosetta/archive/rosetta3/dutch/commrules17.o \
/home/rosetta/archive/rosetta3/dutch/commrules18.o \
/home/rosetta/archive/rosetta3/dutch/commrules19.o \
/home/rosetta/archive/rosetta3/dutch/commrules2.o \
/home/rosetta/archive/rosetta3/dutch/commrules20.o \
/home/rosetta/archive/rosetta3/dutch/commrules21.o \
/home/rosetta/archive/rosetta3/dutch/commrules22.o \
/home/rosetta/archive/rosetta3/dutch/commrules23.o \
/home/rosetta/archive/rosetta3/dutch/commrules24.o \
/home/rosetta/archive/rosetta3/dutch/commrules25.o \
/home/rosetta/archive/rosetta3/dutch/commrules26.o \
/home/rosetta/archive/rosetta3/dutch/commrules27.o \
/home/rosetta/archive/rosetta3/dutch/commrules28.o \
/home/rosetta/archive/rosetta3/dutch/commrules29.o \
/home/rosetta/archive/rosetta3/dutch/commrules3.o \
/home/rosetta/archive/rosetta3/dutch/commrules30.o \
/home/rosetta/archive/rosetta3/dutch/commrules31.o \
/home/rosetta/archive/rosetta3/dutch/commrules32.o \
/home/rosetta/archive/rosetta3/dutch/commrules33.o \
/home/rosetta/archive/rosetta3/dutch/commrules34.o \
/home/rosetta/archive/rosetta3/dutch/commrules35.o \
/home/rosetta/archive/rosetta3/dutch/commrules36.o \
/home/rosetta/archive/rosetta3/dutch/commrules37.o \
/home/rosetta/archive/rosetta3/dutch/commrules38.o \
/home/rosetta/archive/rosetta3/dutch/commrules39.o \
/home/rosetta/archive/rosetta3/dutch/commrules4.o \
/home/rosetta/archive/rosetta3/dutch/commrules40.o \
/home/rosetta/archive/rosetta3/dutch/commrules41.o \
/home/rosetta/archive/rosetta3/dutch/commrules42.o \
/home/rosetta/archive/rosetta3/dutch/commrules43.o \
/home/rosetta/archive/rosetta3/dutch/commrules44.o \
/home/rosetta/archive/rosetta3/dutch/commrules45.o \
/home/rosetta/archive/rosetta3/dutch/commrules46.o \
/home/rosetta/archive/rosetta3/dutch/commrules47.o \
/home/rosetta/archive/rosetta3/dutch/commrules48.o \
/home/rosetta/archive/rosetta3/dutch/commrules49.o \
/home/rosetta/archive/rosetta3/dutch/commrules5.o \
/home/rosetta/archive/rosetta3/dutch/commrules50.o \
/home/rosetta/archive/rosetta3/dutch/commrules51.o \
/home/rosetta/archive/rosetta3/dutch/commrules52.o \
/home/rosetta/archive/rosetta3/dutch/commrules53.o \
/home/rosetta/archive/rosetta3/dutch/commrules54.o \
/home/rosetta/archive/rosetta3/dutch/commrules55.o \
/home/rosetta/archive/rosetta3/dutch/commrules56.o \
/home/rosetta/archive/rosetta3/dutch/commrules57.o \
/home/rosetta/archive/rosetta3/dutch/commrules58.o \
/home/rosetta/archive/rosetta3/dutch/commrules59.o \
/home/rosetta/archive/rosetta3/dutch/commrules6.o \
/home/rosetta/archive/rosetta3/dutch/commrules60.o \
/home/rosetta/archive/rosetta3/dutch/commrules61.o \
/home/rosetta/archive/rosetta3/dutch/commrules62.o \
/home/rosetta/archive/rosetta3/dutch/commrules63.o \
/home/rosetta/archive/rosetta3/dutch/commrules64.o \
/home/rosetta/archive/rosetta3/dutch/commrules65.o \
/home/rosetta/archive/rosetta3/dutch/commrules66.o \
/home/rosetta/archive/rosetta3/dutch/commrules67.o \
/home/rosetta/archive/rosetta3/dutch/commrules68.o \
/home/rosetta/archive/rosetta3/dutch/commrules69.o \
/home/rosetta/archive/rosetta3/dutch/commrules7.o \
/home/rosetta/archive/rosetta3/dutch/commrules70.o \
/home/rosetta/archive/rosetta3/dutch/commrules71.o \
/home/rosetta/archive/rosetta3/dutch/commrules72.o \
/home/rosetta/archive/rosetta3/dutch/commrules73.o \
/home/rosetta/archive/rosetta3/dutch/commrules74.o \
/home/rosetta/archive/rosetta3/dutch/commrules75.o \
/home/rosetta/archive/rosetta3/dutch/commrules76.o \
/home/rosetta/archive/rosetta3/dutch/commrules77.o \
/home/rosetta/archive/rosetta3/dutch/commrules78.o \
/home/rosetta/archive/rosetta3/dutch/commrules79.o \
/home/rosetta/archive/rosetta3/dutch/commrules8.o \
/home/rosetta/archive/rosetta3/dutch/commrules80.o \
/home/rosetta/archive/rosetta3/dutch/commrules81.o \
/home/rosetta/archive/rosetta3/dutch/commrules82.o \
/home/rosetta/archive/rosetta3/dutch/commrules83.o \
/home/rosetta/archive/rosetta3/dutch/commrules84.o \
/home/rosetta/archive/rosetta3/dutch/commrules85.o \
/home/rosetta/archive/rosetta3/dutch/commrules86.o \
/home/rosetta/archive/rosetta3/dutch/commrules87.o \
/home/rosetta/archive/rosetta3/dutch/commrules88.o \
/home/rosetta/archive/rosetta3/dutch/commrules89.o \
/home/rosetta/archive/rosetta3/dutch/commrules9.o \
/home/rosetta/archive/rosetta3/dutch/commrules90.o \
/home/rosetta/archive/rosetta3/dutch/commrules91.o \
/home/rosetta/archive/rosetta3/dutch/commrules92.o \
/home/rosetta/archive/rosetta3/dutch/commrules93.o \
/home/rosetta/archive/rosetta3/dutch/commrules94.o \
/home/rosetta/archive/rosetta3/dutch/commrules95.o \
/home/rosetta/archive/rosetta3/dutch/commrules96.o \
/home/rosetta/archive/rosetta3/dutch/commrules97.o \
/home/rosetta/archive/rosetta3/dutch/commrules98.o \
/home/rosetta/archive/rosetta3/dutch/commrules99.o \
/home/rosetta/archive/rosetta3/dutch/copyt.o \
/home/rosetta/archive/rosetta3/dutch/decomlexrules1.o \
/home/rosetta/archive/rosetta3/dutch/decomlexrules2.o \
/home/rosetta/archive/rosetta3/dutch/decomlexrules3.o \
/home/rosetta/archive/rosetta3/dutch/genlexif.o \
/home/rosetta/archive/rosetta3/dutch/helpsubgrammars.o \
/home/rosetta/archive/rosetta3/dutch/ldaffixlex.o \
/home/rosetta/archive/rosetta3/dutch/ldblex.o \
/home/rosetta/archive/rosetta3/dutch/ldcatsets.o \
/home/rosetta/archive/rosetta3/dutch/ldconvrec.o \
/home/rosetta/archive/rosetta3/dutch/ldgenmrules.o \
/home/rosetta/archive/rosetta3/dutch/ldgetkey.o \
/home/rosetta/archive/rosetta3/dutch/ldgluelex.o \
/home/rosetta/archive/rosetta3/dutch/ldmdict.o \
/home/rosetta/archive/rosetta3/dutch/ldmeasuresize.o \
/home/rosetta/archive/rosetta3/dutch/ldmorfdef.o \
/home/rosetta/archive/rosetta3/dutch/ldmrules.o \
/home/rosetta/archive/rosetta3/dutch/ldstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/ldsubgrammars.o \
/home/rosetta/archive/rosetta3/dutch/ldsubsttovar.o \
/home/rosetta/archive/rosetta3/dutch/ldsucc.o \
/home/rosetta/archive/rosetta3/dutch/ldtypetostr.o \
/home/rosetta/archive/rosetta3/dutch/lsauxdom.o \
/home/rosetta/archive/rosetta3/dutch/lsconvattr.o \
/home/rosetta/archive/rosetta3/dutch/lsconvrec.o \
/home/rosetta/archive/rosetta3/dutch/lsmatches.o \
/home/rosetta/archive/rosetta3/dutch/lsmruquo.o \
/home/rosetta/archive/rosetta3/dutch/lsphondef.o \
/home/rosetta/archive/rosetta3/dutch/lsstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/lstypetostr.o \
/home/rosetta/archive/rosetta3/dutch/maket.o \
/home/rosetta/archive/rosetta3/general/config.o \
/home/rosetta/archive/rosetta3/general/debug.o \
/home/rosetta/archive/rosetta3/general/loop.o \
/home/rosetta/archive/rosetta3/general/debugmparser.o \
/home/rosetta/archive/rosetta3/general/debugmgenerator.o \
/home/rosetta/archive/rosetta3/general/drawhiltree.o \
/home/rosetta/archive/rosetta3/general/drawhyperdtree.o \
/home/rosetta/archive/rosetta3/general/drawstree.o \
/home/rosetta/archive/rosetta3/general/drawsuperdtree.o \
/home/rosetta/archive/rosetta3/general/drawtree.o \
/home/rosetta/archive/rosetta3/general/drawtreeset.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/general/lastactive.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/generation.o \
/home/rosetta/archive/rosetta3/general/gidderiv.o \
/home/rosetta/archive/rosetta3/general/glayout.o \
/home/rosetta/archive/rosetta3/general/glex.o \
/home/rosetta/archive/rosetta3/general/glextree.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/globsubst.o \
/home/rosetta/archive/rosetta3/general/gmorph.o \
/home/rosetta/archive/rosetta3/general/gsegm.o \
/home/rosetta/archive/rosetta3/general/gsegmrules.o \
/home/rosetta/archive/rosetta3/general/gtransfer.o \
/home/rosetta/archive/rosetta3/general/gwhere.o \
/home/rosetta/archive/rosetta3/general/hiltree.o \
/home/rosetta/archive/rosetta3/general/hyperdtree.o \
/home/rosetta/archive/rosetta3/general/interface0.o \
/home/rosetta/archive/rosetta3/general/interface1.o \
/home/rosetta/archive/rosetta3/general/interface7.o \
/home/rosetta/archive/rosetta3/general/interface8.o \
/home/rosetta/archive/rosetta3/general/lifixiddict.o \
/home/rosetta/archive/rosetta3/general/liiddict.o \
/home/rosetta/archive/rosetta3/general/liildict.o \
/home/rosetta/archive/rosetta3/general/limatches.o \
/home/rosetta/archive/rosetta3/general/limrules.o \
/home/rosetta/archive/rosetta3/general/linearizer.o \
/home/rosetta/archive/rosetta3/general/lisdict.o \
/home/rosetta/archive/rosetta3/general/lisiddict.o \
/home/rosetta/archive/rosetta3/general/listree.o \
/home/rosetta/archive/rosetta3/general/log.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/mem.o \
/home/rosetta/archive/rosetta3/general/mgenerator.o \
/home/rosetta/archive/rosetta3/general/oldtree.o \
/home/rosetta/archive/rosetta3/general/printerf.o \
/home/rosetta/archive/rosetta3/general/printerf1.o \
/home/rosetta/archive/rosetta3/general/printerf2.o \
/home/rosetta/archive/rosetta3/general/printerf3.o \
/home/rosetta/archive/rosetta3/general/printerf4.o \
/home/rosetta/archive/rosetta3/general/printerf5.o \
/home/rosetta/archive/rosetta3/general/printerf6.o \
/home/rosetta/archive/rosetta3/general/printerf7.o \
/home/rosetta/archive/rosetta3/general/rectoscreen.o \
/home/rosetta/archive/rosetta3/general/lirectoscreen.o \
/home/rosetta/archive/rosetta3/general/segmrules.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/strtomkey.o \
/home/rosetta/archive/rosetta3/general/superdtree.o \
/home/rosetta/archive/rosetta3/general/windows.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/interlingua/liilrules.o \
/home/rosetta/archive/rosetta3/dutch/ldgenilrules.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/unix/mb.o \
/home/rosetta/archive/rosetta3/unix/pc.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/rosetta/archive/rosetta3/unix/globbuf.o \
/home/rosetta/archive/rosetta3/unix/mkkey.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) generation
 
/home/rosetta/archive/rosetta3/general/control.exe : /home/rosetta/archive/rosetta3/general/batch.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/log.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/windows.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/lastactive.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/unix/mb.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/rosetta/archive/rosetta3/unix/pc.o \
/home/rosetta/archive/rosetta3/unix/globbuf.o \
/home/rosetta/archive/rosetta3/unix/mkkey.o \
/home/rosetta/archive/rosetta3/general/control.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt general control
 
/home/rosetta/archive/rosetta3/tools/mrudomcom.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/tools/tstring.o \
/home/rosetta/archive/rosetta3/general/mem.o \
/home/rosetta/archive/rosetta3/general/log.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/tools/mrudomcomlangspec.o \
/home/rosetta/archive/rosetta3/tools/mrudomcomdecl.o \
/home/rosetta/archive/rosetta3/tools/mrudomcomrules.o \
/home/rosetta/archive/rosetta3/tools/mrudomcomscanner.o \
/home/rosetta/archive/rosetta3/tools/mrudomcomgraph.o \
/home/rosetta/archive/rosetta3/tools/mrudomcomgraphdef.o \
/home/rosetta/archive/rosetta3/tools/mrudomcomparser.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a \
/home/rosetta/archive/rosetta3/tools/mrudomcom.o;
	@/home/rosetta/archive/rosetta3/actions/opt tools mrudomcom
 
/home/rosetta/archive/rosetta3/tools/afxpr.exe : /home/rosetta/archive/rosetta3/tools/afxpr.gensur \
/home/rosetta/archive/rosetta3/tools/afxpr.gendom \
/home/rosetta/archive/rosetta3/tools/neededforcompiler.pf ;
	@/home/rosetta/archive/rosetta3/actions/gen tools afxpr
 
/home/rosetta/archive/rosetta3/tools/ilacom.exe : /home/rosetta/archive/rosetta3/tools/ilacom.gensur \
/home/rosetta/archive/rosetta3/tools/ilacom.gendom \
/home/rosetta/archive/rosetta3/tools/neededforcompiler.pf ;
	@/home/rosetta/archive/rosetta3/actions/gen tools ilacom
 
/home/rosetta/archive/rosetta3/dutch/mrucom.exe : /home/rosetta/archive/rosetta3/tools/mrucom.gensur \
/home/rosetta/archive/rosetta3/tools/mrucom.gendom \
/home/rosetta/archive/rosetta3/dutch/lduniquerels.o \
/home/rosetta/archive/rosetta3/dutch/lsauxdom.o \
/home/rosetta/archive/rosetta3/dutch/neededforcompiler.pf ;
	@/home/rosetta/archive/rosetta3/actions/gen $(language) mrucom
 
/home/rosetta/archive/rosetta3/dutch/surfcom.exe : /home/rosetta/archive/rosetta3/tools/surfcom.gensur \
/home/rosetta/archive/rosetta3/tools/surfcom.gendom \
/home/rosetta/archive/rosetta3/dutch/neededforcompiler.pf ;
	@/home/rosetta/archive/rosetta3/actions/gen $(language) surfcom
 
/home/rosetta/archive/rosetta3/dutch/surflink.exe : /home/rosetta/archive/rosetta3/tools/surflink.gensur \
/home/rosetta/archive/rosetta3/tools/surflink.gendom \
/home/rosetta/archive/rosetta3/dutch/neededforcompiler.pf ;
	@/home/rosetta/archive/rosetta3/actions/gen $(language) surflink
 
/home/rosetta/archive/rosetta3/dutch/auxcom.exe : /home/rosetta/archive/rosetta3/tools/auxcom.gensur \
/home/rosetta/archive/rosetta3/tools/auxcom.gendom \
/home/rosetta/archive/rosetta3/dutch/neededforcompiler.pf ;
	@/home/rosetta/archive/rosetta3/actions/gen $(language) auxcom
 
/home/rosetta/archive/rosetta3/dutch/tracom.exe : /home/rosetta/archive/rosetta3/tools/tracom.gensur \
/home/rosetta/archive/rosetta3/tools/tracom.gendom \
/home/rosetta/archive/rosetta3/dutch/ldmrules.o \
/home/rosetta/archive/rosetta3/dutch/lsauxdom.o \
/home/rosetta/archive/rosetta3/dutch/ldsubgrammars.o \
/home/rosetta/archive/rosetta3/dutch/helpsubgrammars.o \
/home/rosetta/archive/rosetta3/interlingua/liilrules.o \
/home/rosetta/archive/rosetta3/dutch/neededforcompiler.pf ;
	@/home/rosetta/archive/rosetta3/actions/gen $(language) tracom
 
/home/rosetta/archive/rosetta3/tools/lexedcontrol.exe : /home/rosetta/archive/rosetta3/tools/lexedcontrol.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/log.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/windows.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/tools/lexedaux.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/unix/mb.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/rosetta/archive/rosetta3/unix/pc.o \
/home/rosetta/archive/rosetta3/unix/globbuf.o \
/home/rosetta/archive/rosetta3/unix/mkkey.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt tools lexedcontrol
 
/home/rosetta/archive/rosetta3/dutch/lexed.exe : /home/rosetta/archive/rosetta3/dutch/lexed.o \
/home/rosetta/archive/rosetta3/dutch/copyt.o \
/home/rosetta/archive/rosetta3/dutch/decomlexrules1.o \
/home/rosetta/archive/rosetta3/dutch/decomlexrules2.o \
/home/rosetta/archive/rosetta3/dutch/decomlexrules3.o \
/home/rosetta/archive/rosetta3/dutch/genlexif.o \
/home/rosetta/archive/rosetta3/dutch/helpsubgrammars.o \
/home/rosetta/archive/rosetta3/dutch/ldblex.o \
/home/rosetta/archive/rosetta3/dutch/ldcatsets.o \
/home/rosetta/archive/rosetta3/dutch/ldconvrec.o \
/home/rosetta/archive/rosetta3/dutch/ldgetkey.o \
/home/rosetta/archive/rosetta3/dutch/ldmdict.o \
/home/rosetta/archive/rosetta3/dutch/ldmeasuresize.o \
/home/rosetta/archive/rosetta3/dutch/ldmorfdef.o \
/home/rosetta/archive/rosetta3/dutch/ldmrules.o \
/home/rosetta/archive/rosetta3/dutch/ldstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/ldsubgrammars.o \
/home/rosetta/archive/rosetta3/dutch/ldsucc.o \
/home/rosetta/archive/rosetta3/dutch/ldtypetostr.o \
/home/rosetta/archive/rosetta3/dutch/lsauxdom.o \
/home/rosetta/archive/rosetta3/dutch/lsconvattr.o \
/home/rosetta/archive/rosetta3/dutch/lsconvrec.o \
/home/rosetta/archive/rosetta3/dutch/lsmatches.o \
/home/rosetta/archive/rosetta3/dutch/lsmruquo.o \
/home/rosetta/archive/rosetta3/dutch/lsphondef.o \
/home/rosetta/archive/rosetta3/dutch/lsstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/lstypetostr.o \
/home/rosetta/archive/rosetta3/dutch/maket.o \
/home/rosetta/archive/rosetta3/dutch/lslexed.o \
/home/rosetta/archive/rosetta3/tools/lexedaux.o \
/home/rosetta/archive/rosetta3/general/config.o \
/home/rosetta/archive/rosetta3/general/debug.o \
/home/rosetta/archive/rosetta3/general/debugmparser.o \
/home/rosetta/archive/rosetta3/general/debugmgenerator.o \
/home/rosetta/archive/rosetta3/general/loop.o \
/home/rosetta/archive/rosetta3/general/drawstree.o \
/home/rosetta/archive/rosetta3/general/drawtree.o \
/home/rosetta/archive/rosetta3/general/drawtreeset.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/general/lastactive.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/globsubst.o \
/home/rosetta/archive/rosetta3/general/gwhere.o \
/home/rosetta/archive/rosetta3/general/hiltree.o \
/home/rosetta/archive/rosetta3/general/hyperdtree.o \
/home/rosetta/archive/rosetta3/general/interface0.o \
/home/rosetta/archive/rosetta3/general/interface1.o \
/home/rosetta/archive/rosetta3/general/lifixiddict.o \
/home/rosetta/archive/rosetta3/general/liiddict.o \
/home/rosetta/archive/rosetta3/general/liildict.o \
/home/rosetta/archive/rosetta3/general/limatches.o \
/home/rosetta/archive/rosetta3/general/lisdict.o \
/home/rosetta/archive/rosetta3/general/lisiddict.o \
/home/rosetta/archive/rosetta3/general/liscomment.o \
/home/rosetta/archive/rosetta3/general/limcomment.o \
/home/rosetta/archive/rosetta3/general/lilock.o \
/home/rosetta/archive/rosetta3/general/listree.o \
/home/rosetta/archive/rosetta3/general/log.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/mem.o \
/home/rosetta/archive/rosetta3/general/oldtree.o \
/home/rosetta/archive/rosetta3/general/rectoscreen.o \
/home/rosetta/archive/rosetta3/general/lirectoscreen.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/strtomkey.o \
/home/rosetta/archive/rosetta3/general/windows.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/interlingua/liilrules.o \
/home/rosetta/archive/rosetta3/unix/renamefixid.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/unix/mb.o \
/home/rosetta/archive/rosetta3/unix/pc.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/rosetta/archive/rosetta3/unix/globbuf.o \
/home/rosetta/archive/rosetta3/unix/mkkey.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/informix/lib/libisam.a ;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) lexed
 
tools/target/lockinit.exe : tools/target/lockinit.o \
/home/rosetta/archive/rosetta3/general/lilock.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/unix/mb.o \
/home/rosetta/archive/rosetta3/unix/pc.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/rosetta/archive/rosetta3/unix/globbuf.o \
/home/rosetta/archive/rosetta3/unix/mkkey.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/informix/lib/libisam.a ;
	@/home/rosetta/archive/rosetta3/actions/opt tools lockinit
 
# Hieronder staan enkele nep-afhankelijkheden om de files gencom"i".opt te 
# kunnen genereren. Deze worden afhankelijk van de gegenereerde compiler 
# samengesmeed to 1 optfile. Zie de file "actions/gen" 
 
# alle gegenereerde compilers zijn afhankelijk van: 
 
tools/target/gencom1.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/tools/tstring.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/tools/tfiles.o \
/home/rosetta/archive/rosetta3/general/mem.o \
/home/rosetta/archive/rosetta3/general/listree.o \
/home/rosetta/archive/rosetta3/general/globdef.o \
/home/rosetta/archive/rosetta3/general/strtokey.o \
/home/rosetta/archive/rosetta3/general/hiltree.o \
/home/rosetta/archive/rosetta3/general/hyperdtree.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/general/wnd.o \
/home/rosetta/archive/rosetta3/general/log.o \
/home/rosetta/archive/rosetta3/general/globsubst.o \
/home/rosetta/archive/rosetta3/general/drawtree.o \
/home/rosetta/archive/rosetta3/general/oldtree.o \
/home/rosetta/archive/rosetta3/general/drawstree.o \
/home/rosetta/archive/rosetta3/general/drawtreeset.o \
/home/rosetta/archive/rosetta3/general/debugmgenerator.o \
/home/rosetta/archive/rosetta3/general/debugmparser.o \
/home/rosetta/archive/rosetta3/general/strtomkey.o \
/home/rosetta/archive/rosetta3/general/lirectoscreen.o \
/home/rosetta/archive/rosetta3/general/loop.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/globbuf.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/unix/mkkey.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/informix/lib/libisam.a ;
	@nep
 
# alle taalafhankelijke gegenereerde compilers zijn afhankelijk van: 
 
dutch/target/gencom2.exe : /home/rosetta/archive/rosetta3/dutch/ldgetkey.o \
/home/rosetta/archive/rosetta3/dutch/ldconvrec.o \
/home/rosetta/archive/rosetta3/dutch/ldstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/ldcatsets.o \
/home/rosetta/archive/rosetta3/dutch/lsconvrec.o \
/home/rosetta/archive/rosetta3/dutch/ldstrtostr.o \
/home/rosetta/archive/rosetta3/dutch/lsstrtotype.o \
/home/rosetta/archive/rosetta3/dutch/lstypetostr.o \
/home/rosetta/archive/rosetta3/dutch/lsconvattr.o \
/home/rosetta/archive/rosetta3/dutch/ldtypetostr.o \
/home/rosetta/archive/rosetta3/dutch/maket.o \
/home/rosetta/archive/rosetta3/interlingua/liilrules.o \
/home/rosetta/archive/rosetta3/general/windows.o \
/home/rosetta/archive/rosetta3/general/rectoscreen.o \
/home/rosetta/archive/rosetta3/general/debug.o \
/home/rosetta/archive/rosetta3/general/liiddict.o \
/home/rosetta/archive/rosetta3/tools/tldconvrec.o \
/home/rosetta/archive/rosetta3/tools/tldstrtostr.o ;
	@nep
 
#mrucom.exe en tracom.exe zijn afhankelijk van: 
 
dutch/target/gencom3.exe : /home/rosetta/archive/rosetta3/dutch/lsmruquo.o \
/home/rosetta/archive/rosetta3/dutch/ldmrules.o \
/home/rosetta/archive/rosetta3/dutch/ldsubgrammars.o \
/home/rosetta/archive/rosetta3/dutch/helpsubgrammars.o ;
	@nep
 
#mrucom.exe en tracom.exe zijn afhankelijk van: 
 
dutch/target/gencom4.exe : /home/rosetta/archive/rosetta3/dutch/lduniquerels.o \
/home/rosetta/archive/rosetta3/dutch/lsauxdom.o ;
	@nep
 
dutch/target/gencom5.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a ;
	@nep
 
/home/rosetta/archive/rosetta3/Xw/Xw.exe : /home/rosetta/archive/rosetta3/Xw/Xw.o \
/home/rosetta/archive/rosetta3/Xw/Xwa.o \
/home/rosetta/archive/rosetta3/Xw/Xwb.o \
/home/rosetta/archive/rosetta3/Xw/Xwd.o \
/home/rosetta/archive/rosetta3/Xw/Xwh.o \
/home/rosetta/archive/rosetta3/Xw/Xwl.o \
/home/rosetta/archive/rosetta3/Xw/Xwm.o \
/home/rosetta/archive/rosetta3/Xw/Xwr.o \
/home/rosetta/archive/rosetta3/Xw/Xwt.o \
/home/rosetta/archive/rosetta3/Xw/Xwu.o \
/home/rosetta/archive/rosetta3/Xw/Tree.o \
/home/rosetta/archive/rosetta3/Xw/Attr.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/rosetta/archive/rosetta3/unix/mkkey.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/unix/mb.o ;
	@/home/rosetta/archive/rosetta3/actions/Xopt Xw Xw
 
/home/rosetta/archive/rosetta3/Xw/Xlex.exe : /home/rosetta/archive/rosetta3/Xw/Xlex.o \
/home/rosetta/archive/rosetta3/Xw/Xwa.o \
/home/rosetta/archive/rosetta3/Xw/Xwb.o \
/home/rosetta/archive/rosetta3/Xw/Xwd.o \
/home/rosetta/archive/rosetta3/Xw/Xwh.o \
/home/rosetta/archive/rosetta3/Xw/Xwl.o \
/home/rosetta/archive/rosetta3/Xw/Xwm.o \
/home/rosetta/archive/rosetta3/Xw/Xwr.o \
/home/rosetta/archive/rosetta3/Xw/Xwt.o \
/home/rosetta/archive/rosetta3/Xw/Xwu.o \
/home/rosetta/archive/rosetta3/Xw/Tree.o \
/home/rosetta/archive/rosetta3/Xw/Attr.o \
/home/rosetta/archive/rosetta3/unix/wch.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/rosetta/archive/rosetta3/unix/mkkey.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/logc.o \
/home/rosetta/archive/rosetta3/unix/mb.o ;
	@/home/rosetta/archive/rosetta3/actions/Xopt Xw Xlex
