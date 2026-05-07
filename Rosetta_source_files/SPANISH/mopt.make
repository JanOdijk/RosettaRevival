 
/home/rosetta/archive/rosetta3/spanish/asegcom.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/tools/segcomlangspec.o \
/home/rosetta/archive/rosetta3/tools/segcomdecl.o \
/home/rosetta/archive/rosetta3/tools/segcomscanner.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/spanish/ldstrtotype.o \
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
 
spanish/target/genblexdict.exe : spanish/target/genblexdict.o \
/home/rosetta/archive/rosetta3/spanish/ldblex.o \
/home/rosetta/archive/rosetta3/spanish/ldconvrec.o \
/home/rosetta/archive/rosetta3/spanish/ldgetkey.o \
/home/rosetta/archive/rosetta3/spanish/ldstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/ldtypetostr.o \
/home/rosetta/archive/rosetta3/spanish/lsconvattr.o \
/home/rosetta/archive/rosetta3/spanish/lsconvrec.o \
/home/rosetta/archive/rosetta3/spanish/lsstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/lstypetostr.o \
/home/rosetta/archive/rosetta3/spanish/maket.o \
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
 
/home/rosetta/archive/rosetta3/spanish/genblexisf.exe : /home/rosetta/archive/rosetta3/spanish/genblexisf.o \
/home/rosetta/archive/rosetta3/spanish/ldblex.o \
/home/rosetta/archive/rosetta3/spanish/ldconvrec.o \
/home/rosetta/archive/rosetta3/spanish/ldgetkey.o \
/home/rosetta/archive/rosetta3/spanish/ldstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/ldtypetostr.o \
/home/rosetta/archive/rosetta3/spanish/lsconvattr.o \
/home/rosetta/archive/rosetta3/spanish/lsconvrec.o \
/home/rosetta/archive/rosetta3/spanish/lsstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/lstypetostr.o \
/home/rosetta/archive/rosetta3/spanish/maket.o \
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
 
/home/rosetta/archive/rosetta3/spanish/geniddictdata.exe : /home/rosetta/archive/rosetta3/spanish/geniddictdata.o \
/home/rosetta/archive/rosetta3/spanish/ldblex.o \
/home/rosetta/archive/rosetta3/spanish/ldconvrec.o \
/home/rosetta/archive/rosetta3/spanish/ldgetkey.o \
/home/rosetta/archive/rosetta3/spanish/ldstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/ldtypetostr.o \
/home/rosetta/archive/rosetta3/spanish/lsconvattr.o \
/home/rosetta/archive/rosetta3/spanish/lsconvrec.o \
/home/rosetta/archive/rosetta3/spanish/lsstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/lstypetostr.o \
/home/rosetta/archive/rosetta3/spanish/maket.o \
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
 
spanish/target/geniddicttext.exe : spanish/target/geniddicttext.o \
/home/rosetta/archive/rosetta3/spanish/ldblex.o \
/home/rosetta/archive/rosetta3/spanish/ldconvrec.o \
/home/rosetta/archive/rosetta3/spanish/ldgetkey.o \
/home/rosetta/archive/rosetta3/spanish/ldstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/ldtypetostr.o \
/home/rosetta/archive/rosetta3/spanish/lsconvattr.o \
/home/rosetta/archive/rosetta3/spanish/lsconvrec.o \
/home/rosetta/archive/rosetta3/spanish/lsstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/lstypetostr.o \
/home/rosetta/archive/rosetta3/spanish/maket.o \
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
 
/home/rosetta/archive/rosetta3/spanish/genmdictdata.exe : /home/rosetta/archive/rosetta3/spanish/genmdictdata.o \
/home/rosetta/archive/rosetta3/spanish/ldblex.o \
/home/rosetta/archive/rosetta3/spanish/ldconvrec.o \
/home/rosetta/archive/rosetta3/spanish/ldgetkey.o \
/home/rosetta/archive/rosetta3/spanish/ldstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/ldtypetostr.o \
/home/rosetta/archive/rosetta3/spanish/lsconvattr.o \
/home/rosetta/archive/rosetta3/spanish/lsconvrec.o \
/home/rosetta/archive/rosetta3/spanish/lsstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/lstypetostr.o \
/home/rosetta/archive/rosetta3/spanish/maket.o \
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
/home/rosetta/archive/rosetta3/spanish/ldlexconvert.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) genmdictdata
 
spanish/target/genmdicttext.exe : general/target/genmdicttext.o \
/home/rosetta/archive/rosetta3/spanish/ldblex.o \
/home/rosetta/archive/rosetta3/spanish/ldconvrec.o \
/home/rosetta/archive/rosetta3/spanish/ldgetkey.o \
/home/rosetta/archive/rosetta3/spanish/ldstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/ldtypetostr.o \
/home/rosetta/archive/rosetta3/spanish/lsconvattr.o \
/home/rosetta/archive/rosetta3/spanish/lsconvrec.o \
/home/rosetta/archive/rosetta3/spanish/lsstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/lstypetostr.o \
/home/rosetta/archive/rosetta3/spanish/maket.o \
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
/home/rosetta/archive/rosetta3/spanish/ldlexconvert.o \
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
 
/home/rosetta/archive/rosetta3/spanish/gsegcom.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/tools/segcomlangspec.o \
/home/rosetta/archive/rosetta3/tools/segcomdecl.o \
/home/rosetta/archive/rosetta3/tools/segcomscanner.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/spanish/ldstrtotype.o \
/home/rosetta/archive/rosetta3/tools/segcomrules.o \
/home/rosetta/archive/rosetta3/tools/segcomgraph.o \
/home/rosetta/archive/rosetta3/tools/segcomgraphdef.o \
/home/rosetta/archive/rosetta3/tools/segcomparser.o \
/home/rosetta/archive/rosetta3/tools/gsegcom.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) gsegcom
 
/home/rosetta/archive/rosetta3/spanish/lexcom.exe : /home/rosetta/archive/rosetta3/tools/lexcomdecl.o \
/home/rosetta/archive/rosetta3/tools/lexcomscanner.o \
/home/rosetta/archive/rosetta3/tools/lexcomrules.o \
/home/rosetta/archive/rosetta3/tools/lexcomgraphdef.o \
/home/rosetta/archive/rosetta3/tools/lexcomgraph.o \
/home/rosetta/archive/rosetta3/tools/lexcomparser.o \
/home/rosetta/archive/rosetta3/tools/lexcomcode.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/spanish/ldstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/ldcatsets.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/spanish/ldstrtostr.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/tools/lexcom.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) lexcom
 
/home/rosetta/archive/rosetta3/spanish/lexlink.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/spanish/ldstrtotype.o \
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
 
/home/rosetta/archive/rosetta3/spanish/mrulelink.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/spanish/ldstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/ldstrtostr.o \
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
 
spanish/target/surcom.exe : /home/rosetta/archive/rosetta3/tools/surcomdecl.o \
/home/rosetta/archive/rosetta3/tools/surcomrules.o \
/home/rosetta/archive/rosetta3/tools/surcomgraph.o \
/home/rosetta/archive/rosetta3/tools/surcomgraphdef.o \
/home/rosetta/archive/rosetta3/tools/surcomparser.o \
/home/rosetta/archive/rosetta3/spanish/ldstrtotype.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/tools/surcomcode.o \
/home/rosetta/archive/rosetta3/tools/surcomscanner.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/tools/surcom.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) surcom
 
spanish/target/analysis.exe : spanish/target/anlexif.o \
/home/rosetta/archive/rosetta3/spanish/comlexrules1.o \
spanish/target/comlexrules2.o \
spanish/target/comlexrules3.o \
/home/rosetta/archive/rosetta3/spanish/copyt.o \
/home/rosetta/archive/rosetta3/spanish/decommrules1.o \
/home/rosetta/archive/rosetta3/spanish/decommrules10.o \
/home/rosetta/archive/rosetta3/spanish/decommrules100.o \
/home/rosetta/archive/rosetta3/spanish/decommrules101.o \
/home/rosetta/archive/rosetta3/spanish/decommrules102.o \
/home/rosetta/archive/rosetta3/spanish/decommrules103.o \
/home/rosetta/archive/rosetta3/spanish/decommrules104.o \
/home/rosetta/archive/rosetta3/spanish/decommrules105.o \
/home/rosetta/archive/rosetta3/spanish/decommrules106.o \
/home/rosetta/archive/rosetta3/spanish/decommrules107.o \
/home/rosetta/archive/rosetta3/spanish/decommrules108.o \
/home/rosetta/archive/rosetta3/spanish/decommrules109.o \
/home/rosetta/archive/rosetta3/spanish/decommrules11.o \
/home/rosetta/archive/rosetta3/spanish/decommrules110.o \
/home/rosetta/archive/rosetta3/spanish/decommrules111.o \
/home/rosetta/archive/rosetta3/spanish/decommrules112.o \
/home/rosetta/archive/rosetta3/spanish/decommrules113.o \
/home/rosetta/archive/rosetta3/spanish/decommrules114.o \
/home/rosetta/archive/rosetta3/spanish/decommrules115.o \
/home/rosetta/archive/rosetta3/spanish/decommrules116.o \
/home/rosetta/archive/rosetta3/spanish/decommrules117.o \
/home/rosetta/archive/rosetta3/spanish/decommrules118.o \
/home/rosetta/archive/rosetta3/spanish/decommrules119.o \
/home/rosetta/archive/rosetta3/spanish/decommrules12.o \
/home/rosetta/archive/rosetta3/spanish/decommrules120.o \
/home/rosetta/archive/rosetta3/spanish/decommrules121.o \
/home/rosetta/archive/rosetta3/spanish/decommrules122.o \
/home/rosetta/archive/rosetta3/spanish/decommrules123.o \
/home/rosetta/archive/rosetta3/spanish/decommrules124.o \
/home/rosetta/archive/rosetta3/spanish/decommrules125.o \
/home/rosetta/archive/rosetta3/spanish/decommrules126.o \
/home/rosetta/archive/rosetta3/spanish/decommrules127.o \
/home/rosetta/archive/rosetta3/spanish/decommrules128.o \
/home/rosetta/archive/rosetta3/spanish/decommrules129.o \
/home/rosetta/archive/rosetta3/spanish/decommrules13.o \
/home/rosetta/archive/rosetta3/spanish/decommrules130.o \
/home/rosetta/archive/rosetta3/spanish/decommrules131.o \
/home/rosetta/archive/rosetta3/spanish/decommrules132.o \
/home/rosetta/archive/rosetta3/spanish/decommrules133.o \
/home/rosetta/archive/rosetta3/spanish/decommrules134.o \
/home/rosetta/archive/rosetta3/spanish/decommrules135.o \
/home/rosetta/archive/rosetta3/spanish/decommrules136.o \
/home/rosetta/archive/rosetta3/spanish/decommrules137.o \
/home/rosetta/archive/rosetta3/spanish/decommrules138.o \
/home/rosetta/archive/rosetta3/spanish/decommrules139.o \
/home/rosetta/archive/rosetta3/spanish/decommrules14.o \
/home/rosetta/archive/rosetta3/spanish/decommrules140.o \
/home/rosetta/archive/rosetta3/spanish/decommrules15.o \
/home/rosetta/archive/rosetta3/spanish/decommrules16.o \
/home/rosetta/archive/rosetta3/spanish/decommrules17.o \
/home/rosetta/archive/rosetta3/spanish/decommrules18.o \
/home/rosetta/archive/rosetta3/spanish/decommrules19.o \
/home/rosetta/archive/rosetta3/spanish/decommrules2.o \
/home/rosetta/archive/rosetta3/spanish/decommrules20.o \
/home/rosetta/archive/rosetta3/spanish/decommrules21.o \
/home/rosetta/archive/rosetta3/spanish/decommrules22.o \
/home/rosetta/archive/rosetta3/spanish/decommrules23.o \
/home/rosetta/archive/rosetta3/spanish/decommrules24.o \
/home/rosetta/archive/rosetta3/spanish/decommrules25.o \
/home/rosetta/archive/rosetta3/spanish/decommrules26.o \
/home/rosetta/archive/rosetta3/spanish/decommrules27.o \
/home/rosetta/archive/rosetta3/spanish/decommrules28.o \
/home/rosetta/archive/rosetta3/spanish/decommrules29.o \
/home/rosetta/archive/rosetta3/spanish/decommrules3.o \
/home/rosetta/archive/rosetta3/spanish/decommrules30.o \
/home/rosetta/archive/rosetta3/spanish/decommrules31.o \
/home/rosetta/archive/rosetta3/spanish/decommrules32.o \
/home/rosetta/archive/rosetta3/spanish/decommrules33.o \
/home/rosetta/archive/rosetta3/spanish/decommrules34.o \
/home/rosetta/archive/rosetta3/spanish/decommrules35.o \
/home/rosetta/archive/rosetta3/spanish/decommrules36.o \
/home/rosetta/archive/rosetta3/spanish/decommrules37.o \
/home/rosetta/archive/rosetta3/spanish/decommrules38.o \
/home/rosetta/archive/rosetta3/spanish/decommrules39.o \
/home/rosetta/archive/rosetta3/spanish/decommrules4.o \
/home/rosetta/archive/rosetta3/spanish/decommrules40.o \
/home/rosetta/archive/rosetta3/spanish/decommrules41.o \
/home/rosetta/archive/rosetta3/spanish/decommrules42.o \
/home/rosetta/archive/rosetta3/spanish/decommrules43.o \
/home/rosetta/archive/rosetta3/spanish/decommrules44.o \
/home/rosetta/archive/rosetta3/spanish/decommrules45.o \
/home/rosetta/archive/rosetta3/spanish/decommrules46.o \
/home/rosetta/archive/rosetta3/spanish/decommrules47.o \
/home/rosetta/archive/rosetta3/spanish/decommrules48.o \
/home/rosetta/archive/rosetta3/spanish/decommrules49.o \
/home/rosetta/archive/rosetta3/spanish/decommrules5.o \
/home/rosetta/archive/rosetta3/spanish/decommrules50.o \
/home/rosetta/archive/rosetta3/spanish/decommrules51.o \
/home/rosetta/archive/rosetta3/spanish/decommrules52.o \
/home/rosetta/archive/rosetta3/spanish/decommrules53.o \
/home/rosetta/archive/rosetta3/spanish/decommrules54.o \
/home/rosetta/archive/rosetta3/spanish/decommrules55.o \
/home/rosetta/archive/rosetta3/spanish/decommrules56.o \
/home/rosetta/archive/rosetta3/spanish/decommrules57.o \
/home/rosetta/archive/rosetta3/spanish/decommrules58.o \
/home/rosetta/archive/rosetta3/spanish/decommrules59.o \
/home/rosetta/archive/rosetta3/spanish/decommrules6.o \
/home/rosetta/archive/rosetta3/spanish/decommrules60.o \
/home/rosetta/archive/rosetta3/spanish/decommrules61.o \
/home/rosetta/archive/rosetta3/spanish/decommrules62.o \
/home/rosetta/archive/rosetta3/spanish/decommrules63.o \
/home/rosetta/archive/rosetta3/spanish/decommrules64.o \
/home/rosetta/archive/rosetta3/spanish/decommrules65.o \
/home/rosetta/archive/rosetta3/spanish/decommrules66.o \
/home/rosetta/archive/rosetta3/spanish/decommrules67.o \
/home/rosetta/archive/rosetta3/spanish/decommrules68.o \
/home/rosetta/archive/rosetta3/spanish/decommrules69.o \
/home/rosetta/archive/rosetta3/spanish/decommrules7.o \
/home/rosetta/archive/rosetta3/spanish/decommrules70.o \
/home/rosetta/archive/rosetta3/spanish/decommrules71.o \
/home/rosetta/archive/rosetta3/spanish/decommrules72.o \
/home/rosetta/archive/rosetta3/spanish/decommrules73.o \
/home/rosetta/archive/rosetta3/spanish/decommrules74.o \
/home/rosetta/archive/rosetta3/spanish/decommrules75.o \
/home/rosetta/archive/rosetta3/spanish/decommrules76.o \
/home/rosetta/archive/rosetta3/spanish/decommrules77.o \
/home/rosetta/archive/rosetta3/spanish/decommrules78.o \
/home/rosetta/archive/rosetta3/spanish/decommrules79.o \
/home/rosetta/archive/rosetta3/spanish/decommrules8.o \
/home/rosetta/archive/rosetta3/spanish/decommrules80.o \
/home/rosetta/archive/rosetta3/spanish/decommrules81.o \
/home/rosetta/archive/rosetta3/spanish/decommrules82.o \
/home/rosetta/archive/rosetta3/spanish/decommrules83.o \
/home/rosetta/archive/rosetta3/spanish/decommrules84.o \
/home/rosetta/archive/rosetta3/spanish/decommrules85.o \
/home/rosetta/archive/rosetta3/spanish/decommrules86.o \
/home/rosetta/archive/rosetta3/spanish/decommrules87.o \
/home/rosetta/archive/rosetta3/spanish/decommrules88.o \
/home/rosetta/archive/rosetta3/spanish/decommrules89.o \
/home/rosetta/archive/rosetta3/spanish/decommrules9.o \
/home/rosetta/archive/rosetta3/spanish/decommrules90.o \
/home/rosetta/archive/rosetta3/spanish/decommrules91.o \
/home/rosetta/archive/rosetta3/spanish/decommrules92.o \
/home/rosetta/archive/rosetta3/spanish/decommrules93.o \
/home/rosetta/archive/rosetta3/spanish/decommrules94.o \
/home/rosetta/archive/rosetta3/spanish/decommrules95.o \
/home/rosetta/archive/rosetta3/spanish/decommrules96.o \
/home/rosetta/archive/rosetta3/spanish/decommrules97.o \
/home/rosetta/archive/rosetta3/spanish/decommrules98.o \
/home/rosetta/archive/rosetta3/spanish/decommrules99.o \
/home/rosetta/archive/rosetta3/spanish/helpsubgrammars.o \
/home/rosetta/archive/rosetta3/spanish/ldaffixlex.o \
spanish/target/ldanilrules.o \
spanish/target/ldanmrules.o \
/home/rosetta/archive/rosetta3/spanish/ldblex.o \
/home/rosetta/archive/rosetta3/spanish/ldcatsets.o \
/home/rosetta/archive/rosetta3/spanish/ldconvrec.o \
spanish/target/ldequal.o \
/home/rosetta/archive/rosetta3/spanish/ldgetkey.o \
/home/rosetta/archive/rosetta3/spanish/ldgluelex.o \
/home/rosetta/archive/rosetta3/spanish/ldmdict.o \
/home/rosetta/archive/rosetta3/spanish/ldmeasuresize.o \
/home/rosetta/archive/rosetta3/spanish/ldmrules.o \
spanish/target/ldprims.o \
/home/rosetta/archive/rosetta3/spanish/ldstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/ldsubgrammars.o \
/home/rosetta/archive/rosetta3/spanish/ldsucc.o \
spanish/target/ldsurfswitch.o \
/home/rosetta/archive/rosetta3/spanish/ldtypetostr.o \
/home/rosetta/archive/rosetta3/spanish/lsauxdom.o \
/home/rosetta/archive/rosetta3/spanish/lsconvattr.o \
/home/rosetta/archive/rosetta3/spanish/lsconvrec.o \
/home/rosetta/archive/rosetta3/spanish/lsmruquo.o \
/home/rosetta/archive/rosetta3/spanish/lsstrtotype.o \
spanish/target/lssurfquo.o \
/home/rosetta/archive/rosetta3/spanish/lstypetostr.o \
/home/rosetta/archive/rosetta3/spanish/maket.o \
spanish/target/surfrules.o \
spanish/target/surfrulesblocks.o \
spanish/target/surfrulesgraphs.o \
/home/rosetta/archive/rosetta3/spanish/ldmorfdef.o \
/home/rosetta/archive/rosetta3/spanish/lsmatches.o \
/home/rosetta/archive/rosetta3/spanish/lsphondef.o \
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
 
/home/rosetta/archive/rosetta3/spanish/generation.exe : /home/rosetta/archive/rosetta3/spanish/commrules1.o \
/home/rosetta/archive/rosetta3/spanish/commrules10.o \
/home/rosetta/archive/rosetta3/spanish/commrules100.o \
/home/rosetta/archive/rosetta3/spanish/commrules101.o \
/home/rosetta/archive/rosetta3/spanish/commrules102.o \
/home/rosetta/archive/rosetta3/spanish/commrules103.o \
/home/rosetta/archive/rosetta3/spanish/commrules104.o \
/home/rosetta/archive/rosetta3/spanish/commrules105.o \
/home/rosetta/archive/rosetta3/spanish/commrules106.o \
/home/rosetta/archive/rosetta3/spanish/commrules107.o \
/home/rosetta/archive/rosetta3/spanish/commrules108.o \
/home/rosetta/archive/rosetta3/spanish/commrules109.o \
/home/rosetta/archive/rosetta3/spanish/commrules11.o \
/home/rosetta/archive/rosetta3/spanish/commrules110.o \
/home/rosetta/archive/rosetta3/spanish/commrules111.o \
/home/rosetta/archive/rosetta3/spanish/commrules112.o \
/home/rosetta/archive/rosetta3/spanish/commrules113.o \
/home/rosetta/archive/rosetta3/spanish/commrules114.o \
/home/rosetta/archive/rosetta3/spanish/commrules115.o \
/home/rosetta/archive/rosetta3/spanish/commrules116.o \
/home/rosetta/archive/rosetta3/spanish/commrules117.o \
/home/rosetta/archive/rosetta3/spanish/commrules118.o \
/home/rosetta/archive/rosetta3/spanish/commrules119.o \
/home/rosetta/archive/rosetta3/spanish/commrules12.o \
/home/rosetta/archive/rosetta3/spanish/commrules120.o \
/home/rosetta/archive/rosetta3/spanish/commrules121.o \
/home/rosetta/archive/rosetta3/spanish/commrules122.o \
/home/rosetta/archive/rosetta3/spanish/commrules123.o \
/home/rosetta/archive/rosetta3/spanish/commrules124.o \
/home/rosetta/archive/rosetta3/spanish/commrules125.o \
/home/rosetta/archive/rosetta3/spanish/commrules126.o \
/home/rosetta/archive/rosetta3/spanish/commrules127.o \
/home/rosetta/archive/rosetta3/spanish/commrules128.o \
/home/rosetta/archive/rosetta3/spanish/commrules129.o \
/home/rosetta/archive/rosetta3/spanish/commrules13.o \
/home/rosetta/archive/rosetta3/spanish/commrules130.o \
/home/rosetta/archive/rosetta3/spanish/commrules131.o \
/home/rosetta/archive/rosetta3/spanish/commrules132.o \
/home/rosetta/archive/rosetta3/spanish/commrules133.o \
/home/rosetta/archive/rosetta3/spanish/commrules134.o \
/home/rosetta/archive/rosetta3/spanish/commrules135.o \
/home/rosetta/archive/rosetta3/spanish/commrules136.o \
/home/rosetta/archive/rosetta3/spanish/commrules137.o \
/home/rosetta/archive/rosetta3/spanish/commrules138.o \
/home/rosetta/archive/rosetta3/spanish/commrules139.o \
/home/rosetta/archive/rosetta3/spanish/commrules14.o \
/home/rosetta/archive/rosetta3/spanish/commrules140.o \
/home/rosetta/archive/rosetta3/spanish/commrules15.o \
/home/rosetta/archive/rosetta3/spanish/commrules16.o \
/home/rosetta/archive/rosetta3/spanish/commrules17.o \
/home/rosetta/archive/rosetta3/spanish/commrules18.o \
/home/rosetta/archive/rosetta3/spanish/commrules19.o \
/home/rosetta/archive/rosetta3/spanish/commrules2.o \
/home/rosetta/archive/rosetta3/spanish/commrules20.o \
/home/rosetta/archive/rosetta3/spanish/commrules21.o \
/home/rosetta/archive/rosetta3/spanish/commrules22.o \
/home/rosetta/archive/rosetta3/spanish/commrules23.o \
/home/rosetta/archive/rosetta3/spanish/commrules24.o \
/home/rosetta/archive/rosetta3/spanish/commrules25.o \
/home/rosetta/archive/rosetta3/spanish/commrules26.o \
/home/rosetta/archive/rosetta3/spanish/commrules27.o \
/home/rosetta/archive/rosetta3/spanish/commrules28.o \
/home/rosetta/archive/rosetta3/spanish/commrules29.o \
/home/rosetta/archive/rosetta3/spanish/commrules3.o \
/home/rosetta/archive/rosetta3/spanish/commrules30.o \
/home/rosetta/archive/rosetta3/spanish/commrules31.o \
/home/rosetta/archive/rosetta3/spanish/commrules32.o \
/home/rosetta/archive/rosetta3/spanish/commrules33.o \
/home/rosetta/archive/rosetta3/spanish/commrules34.o \
/home/rosetta/archive/rosetta3/spanish/commrules35.o \
/home/rosetta/archive/rosetta3/spanish/commrules36.o \
/home/rosetta/archive/rosetta3/spanish/commrules37.o \
/home/rosetta/archive/rosetta3/spanish/commrules38.o \
/home/rosetta/archive/rosetta3/spanish/commrules39.o \
/home/rosetta/archive/rosetta3/spanish/commrules4.o \
/home/rosetta/archive/rosetta3/spanish/commrules40.o \
/home/rosetta/archive/rosetta3/spanish/commrules41.o \
/home/rosetta/archive/rosetta3/spanish/commrules42.o \
/home/rosetta/archive/rosetta3/spanish/commrules43.o \
/home/rosetta/archive/rosetta3/spanish/commrules44.o \
/home/rosetta/archive/rosetta3/spanish/commrules45.o \
/home/rosetta/archive/rosetta3/spanish/commrules46.o \
/home/rosetta/archive/rosetta3/spanish/commrules47.o \
/home/rosetta/archive/rosetta3/spanish/commrules48.o \
/home/rosetta/archive/rosetta3/spanish/commrules49.o \
/home/rosetta/archive/rosetta3/spanish/commrules5.o \
/home/rosetta/archive/rosetta3/spanish/commrules50.o \
/home/rosetta/archive/rosetta3/spanish/commrules51.o \
/home/rosetta/archive/rosetta3/spanish/commrules52.o \
/home/rosetta/archive/rosetta3/spanish/commrules53.o \
/home/rosetta/archive/rosetta3/spanish/commrules54.o \
/home/rosetta/archive/rosetta3/spanish/commrules55.o \
/home/rosetta/archive/rosetta3/spanish/commrules56.o \
/home/rosetta/archive/rosetta3/spanish/commrules57.o \
/home/rosetta/archive/rosetta3/spanish/commrules58.o \
/home/rosetta/archive/rosetta3/spanish/commrules59.o \
/home/rosetta/archive/rosetta3/spanish/commrules6.o \
/home/rosetta/archive/rosetta3/spanish/commrules60.o \
/home/rosetta/archive/rosetta3/spanish/commrules61.o \
/home/rosetta/archive/rosetta3/spanish/commrules62.o \
/home/rosetta/archive/rosetta3/spanish/commrules63.o \
/home/rosetta/archive/rosetta3/spanish/commrules64.o \
/home/rosetta/archive/rosetta3/spanish/commrules65.o \
/home/rosetta/archive/rosetta3/spanish/commrules66.o \
/home/rosetta/archive/rosetta3/spanish/commrules67.o \
/home/rosetta/archive/rosetta3/spanish/commrules68.o \
/home/rosetta/archive/rosetta3/spanish/commrules69.o \
/home/rosetta/archive/rosetta3/spanish/commrules7.o \
/home/rosetta/archive/rosetta3/spanish/commrules70.o \
/home/rosetta/archive/rosetta3/spanish/commrules71.o \
/home/rosetta/archive/rosetta3/spanish/commrules72.o \
/home/rosetta/archive/rosetta3/spanish/commrules73.o \
/home/rosetta/archive/rosetta3/spanish/commrules74.o \
/home/rosetta/archive/rosetta3/spanish/commrules75.o \
/home/rosetta/archive/rosetta3/spanish/commrules76.o \
/home/rosetta/archive/rosetta3/spanish/commrules77.o \
/home/rosetta/archive/rosetta3/spanish/commrules78.o \
/home/rosetta/archive/rosetta3/spanish/commrules79.o \
/home/rosetta/archive/rosetta3/spanish/commrules8.o \
/home/rosetta/archive/rosetta3/spanish/commrules80.o \
/home/rosetta/archive/rosetta3/spanish/commrules81.o \
/home/rosetta/archive/rosetta3/spanish/commrules82.o \
/home/rosetta/archive/rosetta3/spanish/commrules83.o \
/home/rosetta/archive/rosetta3/spanish/commrules84.o \
/home/rosetta/archive/rosetta3/spanish/commrules85.o \
/home/rosetta/archive/rosetta3/spanish/commrules86.o \
/home/rosetta/archive/rosetta3/spanish/commrules87.o \
/home/rosetta/archive/rosetta3/spanish/commrules88.o \
/home/rosetta/archive/rosetta3/spanish/commrules89.o \
/home/rosetta/archive/rosetta3/spanish/commrules9.o \
/home/rosetta/archive/rosetta3/spanish/commrules90.o \
/home/rosetta/archive/rosetta3/spanish/commrules91.o \
/home/rosetta/archive/rosetta3/spanish/commrules92.o \
/home/rosetta/archive/rosetta3/spanish/commrules93.o \
/home/rosetta/archive/rosetta3/spanish/commrules94.o \
/home/rosetta/archive/rosetta3/spanish/commrules95.o \
/home/rosetta/archive/rosetta3/spanish/commrules96.o \
/home/rosetta/archive/rosetta3/spanish/commrules97.o \
/home/rosetta/archive/rosetta3/spanish/commrules98.o \
/home/rosetta/archive/rosetta3/spanish/commrules99.o \
/home/rosetta/archive/rosetta3/spanish/copyt.o \
/home/rosetta/archive/rosetta3/spanish/decomlexrules1.o \
/home/rosetta/archive/rosetta3/spanish/decomlexrules2.o \
/home/rosetta/archive/rosetta3/spanish/decomlexrules3.o \
/home/rosetta/archive/rosetta3/spanish/genlexif.o \
/home/rosetta/archive/rosetta3/spanish/helpsubgrammars.o \
/home/rosetta/archive/rosetta3/spanish/ldaffixlex.o \
/home/rosetta/archive/rosetta3/spanish/ldblex.o \
/home/rosetta/archive/rosetta3/spanish/ldcatsets.o \
/home/rosetta/archive/rosetta3/spanish/ldconvrec.o \
/home/rosetta/archive/rosetta3/spanish/ldgenmrules.o \
/home/rosetta/archive/rosetta3/spanish/ldgetkey.o \
/home/rosetta/archive/rosetta3/spanish/ldgluelex.o \
/home/rosetta/archive/rosetta3/spanish/ldmdict.o \
/home/rosetta/archive/rosetta3/spanish/ldmeasuresize.o \
/home/rosetta/archive/rosetta3/spanish/ldmorfdef.o \
/home/rosetta/archive/rosetta3/spanish/ldmrules.o \
/home/rosetta/archive/rosetta3/spanish/ldstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/ldsubgrammars.o \
/home/rosetta/archive/rosetta3/spanish/ldsubsttovar.o \
/home/rosetta/archive/rosetta3/spanish/ldsucc.o \
/home/rosetta/archive/rosetta3/spanish/ldtypetostr.o \
/home/rosetta/archive/rosetta3/spanish/lsauxdom.o \
/home/rosetta/archive/rosetta3/spanish/lsconvattr.o \
/home/rosetta/archive/rosetta3/spanish/lsconvrec.o \
/home/rosetta/archive/rosetta3/spanish/lsmatches.o \
/home/rosetta/archive/rosetta3/spanish/lsmruquo.o \
/home/rosetta/archive/rosetta3/spanish/lsphondef.o \
/home/rosetta/archive/rosetta3/spanish/lsstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/lstypetostr.o \
/home/rosetta/archive/rosetta3/spanish/maket.o \
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
/home/rosetta/archive/rosetta3/spanish/ldgenilrules.o \
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
 
/home/rosetta/archive/rosetta3/spanish/mrucom.exe : /home/rosetta/archive/rosetta3/tools/mrucom.gensur \
/home/rosetta/archive/rosetta3/tools/mrucom.gendom \
/home/rosetta/archive/rosetta3/spanish/lduniquerels.o \
/home/rosetta/archive/rosetta3/spanish/lsauxdom.o \
/home/rosetta/archive/rosetta3/spanish/neededforcompiler.pf ;
	@/home/rosetta/archive/rosetta3/actions/gen $(language) mrucom
 
spanish/target/surfcom.exe : /home/rosetta/archive/rosetta3/tools/surfcom.gensur \
/home/rosetta/archive/rosetta3/tools/surfcom.gendom \
/home/rosetta/archive/rosetta3/spanish/neededforcompiler.pf ;
	@/home/rosetta/archive/rosetta3/actions/gen $(language) surfcom
 
spanish/target/surflink.exe : /home/rosetta/archive/rosetta3/tools/surflink.gensur \
/home/rosetta/archive/rosetta3/tools/surflink.gendom \
/home/rosetta/archive/rosetta3/spanish/neededforcompiler.pf ;
	@/home/rosetta/archive/rosetta3/actions/gen $(language) surflink
 
/home/rosetta/archive/rosetta3/spanish/auxcom.exe : /home/rosetta/archive/rosetta3/tools/auxcom.gensur \
/home/rosetta/archive/rosetta3/tools/auxcom.gendom \
/home/rosetta/archive/rosetta3/spanish/neededforcompiler.pf ;
	@/home/rosetta/archive/rosetta3/actions/gen $(language) auxcom
 
/home/rosetta/archive/rosetta3/spanish/tracom.exe : /home/rosetta/archive/rosetta3/tools/tracom.gensur \
/home/rosetta/archive/rosetta3/tools/tracom.gendom \
/home/rosetta/archive/rosetta3/spanish/ldmrules.o \
/home/rosetta/archive/rosetta3/spanish/lsauxdom.o \
/home/rosetta/archive/rosetta3/spanish/ldsubgrammars.o \
/home/rosetta/archive/rosetta3/spanish/helpsubgrammars.o \
/home/rosetta/archive/rosetta3/interlingua/liilrules.o \
/home/rosetta/archive/rosetta3/spanish/neededforcompiler.pf ;
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
 
/home/rosetta/archive/rosetta3/spanish/lexed.exe : /home/rosetta/archive/rosetta3/spanish/lexed.o \
/home/rosetta/archive/rosetta3/spanish/copyt.o \
/home/rosetta/archive/rosetta3/spanish/decomlexrules1.o \
/home/rosetta/archive/rosetta3/spanish/decomlexrules2.o \
/home/rosetta/archive/rosetta3/spanish/decomlexrules3.o \
/home/rosetta/archive/rosetta3/spanish/genlexif.o \
/home/rosetta/archive/rosetta3/spanish/helpsubgrammars.o \
/home/rosetta/archive/rosetta3/spanish/ldblex.o \
/home/rosetta/archive/rosetta3/spanish/ldcatsets.o \
/home/rosetta/archive/rosetta3/spanish/ldconvrec.o \
/home/rosetta/archive/rosetta3/spanish/ldgetkey.o \
/home/rosetta/archive/rosetta3/spanish/ldmdict.o \
/home/rosetta/archive/rosetta3/spanish/ldmeasuresize.o \
/home/rosetta/archive/rosetta3/spanish/ldmorfdef.o \
/home/rosetta/archive/rosetta3/spanish/ldmrules.o \
/home/rosetta/archive/rosetta3/spanish/ldstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/ldsubgrammars.o \
/home/rosetta/archive/rosetta3/spanish/ldsucc.o \
/home/rosetta/archive/rosetta3/spanish/ldtypetostr.o \
/home/rosetta/archive/rosetta3/spanish/lsauxdom.o \
/home/rosetta/archive/rosetta3/spanish/lsconvattr.o \
/home/rosetta/archive/rosetta3/spanish/lsconvrec.o \
/home/rosetta/archive/rosetta3/spanish/lsmatches.o \
/home/rosetta/archive/rosetta3/spanish/lsmruquo.o \
/home/rosetta/archive/rosetta3/spanish/lsphondef.o \
/home/rosetta/archive/rosetta3/spanish/lsstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/lstypetostr.o \
/home/rosetta/archive/rosetta3/spanish/maket.o \
/home/rosetta/archive/rosetta3/spanish/lslexed.o \
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
 
spanish/target/gencom2.exe : /home/rosetta/archive/rosetta3/spanish/ldgetkey.o \
/home/rosetta/archive/rosetta3/spanish/ldconvrec.o \
/home/rosetta/archive/rosetta3/spanish/ldstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/ldcatsets.o \
/home/rosetta/archive/rosetta3/spanish/lsconvrec.o \
/home/rosetta/archive/rosetta3/spanish/ldstrtostr.o \
/home/rosetta/archive/rosetta3/spanish/lsstrtotype.o \
/home/rosetta/archive/rosetta3/spanish/lstypetostr.o \
/home/rosetta/archive/rosetta3/spanish/lsconvattr.o \
/home/rosetta/archive/rosetta3/spanish/ldtypetostr.o \
/home/rosetta/archive/rosetta3/spanish/maket.o \
/home/rosetta/archive/rosetta3/interlingua/liilrules.o \
/home/rosetta/archive/rosetta3/general/windows.o \
/home/rosetta/archive/rosetta3/general/rectoscreen.o \
/home/rosetta/archive/rosetta3/general/debug.o \
/home/rosetta/archive/rosetta3/general/liiddict.o \
/home/rosetta/archive/rosetta3/tools/tldconvrec.o \
/home/rosetta/archive/rosetta3/tools/tldstrtostr.o ;
	@nep
 
#mrucom.exe en tracom.exe zijn afhankelijk van: 
 
spanish/target/gencom3.exe : /home/rosetta/archive/rosetta3/spanish/lsmruquo.o \
/home/rosetta/archive/rosetta3/spanish/ldmrules.o \
/home/rosetta/archive/rosetta3/spanish/ldsubgrammars.o \
/home/rosetta/archive/rosetta3/spanish/helpsubgrammars.o ;
	@nep
 
#mrucom.exe en tracom.exe zijn afhankelijk van: 
 
spanish/target/gencom4.exe : /home/rosetta/archive/rosetta3/spanish/lduniquerels.o \
/home/rosetta/archive/rosetta3/spanish/lsauxdom.o ;
	@nep
 
spanish/target/gencom5.exe : /home/rosetta/archive/rosetta3/general/string.o \
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
