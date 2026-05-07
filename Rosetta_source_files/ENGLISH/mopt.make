 
/home/rosetta/archive/rosetta3/english/asegcom.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/tools/segcomlangspec.o \
/home/rosetta/archive/rosetta3/tools/segcomdecl.o \
/home/rosetta/archive/rosetta3/tools/segcomscanner.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/english/ldstrtotype.o \
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
 
/home/rosetta/archive/rosetta3/english/genblexdict.exe : /home/rosetta/archive/rosetta3/english/genblexdict.o \
/home/rosetta/archive/rosetta3/english/ldblex.o \
/home/rosetta/archive/rosetta3/english/ldconvrec.o \
/home/rosetta/archive/rosetta3/english/ldgetkey.o \
/home/rosetta/archive/rosetta3/english/ldstrtotype.o \
/home/rosetta/archive/rosetta3/english/ldtypetostr.o \
/home/rosetta/archive/rosetta3/english/lsconvattr.o \
/home/rosetta/archive/rosetta3/english/lsconvrec.o \
/home/rosetta/archive/rosetta3/english/lsstrtotype.o \
/home/rosetta/archive/rosetta3/english/lstypetostr.o \
/home/rosetta/archive/rosetta3/english/maket.o \
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
 
/home/rosetta/archive/rosetta3/english/genblexisf.exe : /home/rosetta/archive/rosetta3/english/genblexisf.o \
/home/rosetta/archive/rosetta3/english/ldblex.o \
/home/rosetta/archive/rosetta3/english/ldconvrec.o \
/home/rosetta/archive/rosetta3/english/ldgetkey.o \
/home/rosetta/archive/rosetta3/english/ldstrtotype.o \
/home/rosetta/archive/rosetta3/english/ldtypetostr.o \
/home/rosetta/archive/rosetta3/english/lsconvattr.o \
/home/rosetta/archive/rosetta3/english/lsconvrec.o \
/home/rosetta/archive/rosetta3/english/lsstrtotype.o \
/home/rosetta/archive/rosetta3/english/lstypetostr.o \
/home/rosetta/archive/rosetta3/english/maket.o \
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
 
/home/rosetta/archive/rosetta3/english/geniddictdata.exe : /home/rosetta/archive/rosetta3/english/geniddictdata.o \
/home/rosetta/archive/rosetta3/english/ldblex.o \
/home/rosetta/archive/rosetta3/english/ldconvrec.o \
/home/rosetta/archive/rosetta3/english/ldgetkey.o \
/home/rosetta/archive/rosetta3/english/ldstrtotype.o \
/home/rosetta/archive/rosetta3/english/ldtypetostr.o \
/home/rosetta/archive/rosetta3/english/lsconvattr.o \
/home/rosetta/archive/rosetta3/english/lsconvrec.o \
/home/rosetta/archive/rosetta3/english/lsstrtotype.o \
/home/rosetta/archive/rosetta3/english/lstypetostr.o \
/home/rosetta/archive/rosetta3/english/maket.o \
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
 
english/target/geniddicttext.exe : english/target/geniddicttext.o \
/home/rosetta/archive/rosetta3/english/ldblex.o \
/home/rosetta/archive/rosetta3/english/ldconvrec.o \
/home/rosetta/archive/rosetta3/english/ldgetkey.o \
/home/rosetta/archive/rosetta3/english/ldstrtotype.o \
/home/rosetta/archive/rosetta3/english/ldtypetostr.o \
/home/rosetta/archive/rosetta3/english/lsconvattr.o \
/home/rosetta/archive/rosetta3/english/lsconvrec.o \
/home/rosetta/archive/rosetta3/english/lsstrtotype.o \
/home/rosetta/archive/rosetta3/english/lstypetostr.o \
/home/rosetta/archive/rosetta3/english/maket.o \
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
 
/home/rosetta/archive/rosetta3/english/genmdictdata.exe : /home/rosetta/archive/rosetta3/english/genmdictdata.o \
/home/rosetta/archive/rosetta3/english/ldblex.o \
/home/rosetta/archive/rosetta3/english/ldconvrec.o \
/home/rosetta/archive/rosetta3/english/ldgetkey.o \
/home/rosetta/archive/rosetta3/english/ldstrtotype.o \
/home/rosetta/archive/rosetta3/english/ldtypetostr.o \
/home/rosetta/archive/rosetta3/english/lsconvattr.o \
/home/rosetta/archive/rosetta3/english/lsconvrec.o \
/home/rosetta/archive/rosetta3/english/lsstrtotype.o \
/home/rosetta/archive/rosetta3/english/lstypetostr.o \
/home/rosetta/archive/rosetta3/english/maket.o \
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
/home/rosetta/archive/rosetta3/english/ldlexconvert.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/rosetta/archive/rosetta3/unix/wipc.o \
/home/rosetta/archive/rosetta3/general/error.o \
/home/rosetta/archive/rosetta3/general/level.o \
/home/rosetta/archive/rosetta3/unix/sockipc.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) genmdictdata
 
english/target/genmdicttext.exe : general/target/genmdicttext.o \
/home/rosetta/archive/rosetta3/english/ldblex.o \
/home/rosetta/archive/rosetta3/english/ldconvrec.o \
/home/rosetta/archive/rosetta3/english/ldgetkey.o \
/home/rosetta/archive/rosetta3/english/ldstrtotype.o \
/home/rosetta/archive/rosetta3/english/ldtypetostr.o \
/home/rosetta/archive/rosetta3/english/lsconvattr.o \
/home/rosetta/archive/rosetta3/english/lsconvrec.o \
/home/rosetta/archive/rosetta3/english/lsstrtotype.o \
/home/rosetta/archive/rosetta3/english/lstypetostr.o \
/home/rosetta/archive/rosetta3/english/maket.o \
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
/home/rosetta/archive/rosetta3/english/ldlexconvert.o \
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
 
/home/rosetta/archive/rosetta3/english/gsegcom.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/tools/segcomlangspec.o \
/home/rosetta/archive/rosetta3/tools/segcomdecl.o \
/home/rosetta/archive/rosetta3/tools/segcomscanner.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/english/ldstrtotype.o \
/home/rosetta/archive/rosetta3/tools/segcomrules.o \
/home/rosetta/archive/rosetta3/tools/segcomgraph.o \
/home/rosetta/archive/rosetta3/tools/segcomgraphdef.o \
/home/rosetta/archive/rosetta3/tools/segcomparser.o \
/home/rosetta/archive/rosetta3/tools/gsegcom.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) gsegcom
 
/home/rosetta/archive/rosetta3/english/lexcom.exe : /home/rosetta/archive/rosetta3/tools/lexcomdecl.o \
/home/rosetta/archive/rosetta3/tools/lexcomscanner.o \
/home/rosetta/archive/rosetta3/tools/lexcomrules.o \
/home/rosetta/archive/rosetta3/tools/lexcomgraphdef.o \
/home/rosetta/archive/rosetta3/tools/lexcomgraph.o \
/home/rosetta/archive/rosetta3/tools/lexcomparser.o \
/home/rosetta/archive/rosetta3/tools/lexcomcode.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/english/ldstrtotype.o \
/home/rosetta/archive/rosetta3/english/ldcatsets.o \
/home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/english/ldstrtostr.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/tools/lexcom.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) lexcom
 
/home/rosetta/archive/rosetta3/english/lexlink.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/english/ldstrtotype.o \
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
 
/home/rosetta/archive/rosetta3/english/mrulelink.exe : /home/rosetta/archive/rosetta3/general/string.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/general/files.o \
/home/rosetta/archive/rosetta3/english/ldstrtotype.o \
/home/rosetta/archive/rosetta3/english/ldstrtostr.o \
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
 
/home/rosetta/archive/rosetta3/english/surcom.exe : /home/rosetta/archive/rosetta3/tools/surcomdecl.o \
/home/rosetta/archive/rosetta3/tools/surcomrules.o \
/home/rosetta/archive/rosetta3/tools/surcomgraph.o \
/home/rosetta/archive/rosetta3/tools/surcomgraphdef.o \
/home/rosetta/archive/rosetta3/tools/surcomparser.o \
/home/rosetta/archive/rosetta3/english/ldstrtotype.o \
/home/rosetta/archive/rosetta3/general/str.o \
/home/rosetta/archive/rosetta3/tools/surcomcode.o \
/home/rosetta/archive/rosetta3/tools/surcomscanner.o \
/home/rosetta/archive/rosetta3/general/logname.o \
/home/rosetta/archive/rosetta3/tools/surcom.o \
/home/rosetta/archive/rosetta3/unix/cisam.o \
/home/rosetta/archive/rosetta3/unix/paspar.o \
/home/informix/lib/libisam.a;
	@/home/rosetta/archive/rosetta3/actions/opt $(language) surcom
 
/home/rosetta/archive/rosetta3/english/analysis.exe : /home/rosetta/archive/rosetta3/english/anlexif.o \
/home/rosetta/archive/rosetta3/english/comlexrules1.o \
/home/rosetta/archive/rosetta3/english/comlexrules2.o \
/home/rosetta/archive/rosetta3/english/comlexrules3.o \
/home/rosetta/archive/rosetta3/english/copyt.o \
/home/rosetta/archive/rosetta3/english/decommrules1.o \
/home/rosetta/archive/rosetta3/english/decommrules10.o \
/home/rosetta/archive/rosetta3/english/decommrules100.o \
/home/rosetta/archive/rosetta3/english/decommrules101.o \
/home/rosetta/archive/rosetta3/english/decommrules102.o \
/home/rosetta/archive/rosetta3/english/decommrules103.o \
/home/rosetta/archive/rosetta3/english/decommrules104.o \
/home/rosetta/archive/rosetta3/english/decommrules105.o \
/home/rosetta/archive/rosetta3/english/decommrules106.o \
/home/rosetta/archive/rosetta3/english/decommrules107.o \
/home/rosetta/archive/rosetta3/english/decommrules108.o \
/home/rosetta/archive/rosetta3/english/decommrules109.o \
/home/rosetta/archive/rosetta3/english/decommrules11.o \
/home/rosetta/archive/rosetta3/english/decommrules110.o \
/home/rosetta/archive/rosetta3/english/decommrules111.o \
/home/rosetta/archive/rosetta3/english/decommrules112.o \
/home/rosetta/archive/rosetta3/english/decommrules113.o \
/home/rosetta/archive/rosetta3/english/decommrules114.o \
/home/rosetta/archive/rosetta3/english/decommrules115.o \
/home/rosetta/archive/rosetta3/english/decommrules116.o \
/home/rosetta/archive/rosetta3/english/decommrules117.o \
/home/rosetta/archive/rosetta3/english/decommrules118.o \
/home/rosetta/archive/rosetta3/english/decommrules119.o \
/home/rosetta/archive/rosetta3/english/decommrules12.o \
/home/rosetta/archive/rosetta3/english/decommrules120.o \
/home/rosetta/archive/rosetta3/english/decommrules121.o \
/home/rosetta/archive/rosetta3/english/decommrules122.o \
/home/rosetta/archive/rosetta3/english/decommrules123.o \
/home/rosetta/archive/rosetta3/english/decommrules124.o \
/home/rosetta/archive/rosetta3/english/decommrules125.o \
/home/rosetta/archive/rosetta3/english/decommrules126.o \
/home/rosetta/archive/rosetta3/english/decommrules127.o \
/home/rosetta/archive/rosetta3/english/decommrules128.o \
/home/rosetta/archive/rosetta3/english/decommrules129.o \
/home/rosetta/archive/rosetta3/english/decommrules13.o \
/home/rosetta/archive/rosetta3/english/decommrules130.o \
/home/rosetta/archive/rosetta3/english/decommrules131.o \
/home/rosetta/archive/rosetta3/english/decommrules132.o \
/home/rosetta/archive/rosetta3/english/decommrules133.o \
/home/rosetta/archive/rosetta3/english/decommrules134.o \
/home/rosetta/archive/rosetta3/english/decommrules135.o \
/home/rosetta/archive/rosetta3/english/decommrules136.o \
/home/rosetta/archive/rosetta3/english/decommrules137.o \
/home/rosetta/archive/rosetta3/english/decommrules138.o \
/home/rosetta/archive/rosetta3/english/decommrules139.o \
/home/rosetta/archive/rosetta3/english/decommrules14.o \
/home/rosetta/archive/rosetta3/english/decommrules140.o \
/home/rosetta/archive/rosetta3/english/decommrules15.o \
/home/rosetta/archive/rosetta3/english/decommrules16.o \
/home/rosetta/archive/rosetta3/english/decommrules17.o \
/home/rosetta/archive/rosetta3/english/decommrules18.o \
/home/rosetta/archive/rosetta3/english/decommrules19.o \
/home/rosetta/archive/rosetta3/english/decommrules2.o \
/home/rosetta/archive/rosetta3/english/decommrules20.o \
/home/rosetta/archive/rosetta3/english/decommrules21.o \
/home/rosetta/archive/rosetta3/english/decommrules22.o \
/home/rosetta/archive/rosetta3/english/decommrules23.o \
/home/rosetta/archive/rosetta3/english/decommrules24.o \
/home/rosetta/archive/rosetta3/english/decommrules25.o \
/home/rosetta/archive/rosetta3/english/decommrules26.o \
/home/rosetta/archive/rosetta3/english/decommrules27.o \
/home/rosetta/archive/rosetta3/english/decommrules28.o \
/home/rosetta/archive/rosetta3/english/decommrules29.o \
/home/rosetta/archive/rosetta3/english/decommrules3.o \
/home/rosetta/archive/rosetta3/english/decommrules30.o \
/home/rosetta/archive/rosetta3/english/decommrules31.o \
/home/rosetta/archive/rosetta3/english/decommrules32.o \
/home/rosetta/archive/rosetta3/english/decommrules33.o \
/home/rosetta/archive/rosetta3/english/decommrules34.o \
/home/rosetta/archive/rosetta3/english/decommrules35.o \
/home/rosetta/archive/rosetta3/english/decommrules36.o \
/home/rosetta/archive/rosetta3/english/decommrules37.o \
/home/rosetta/archive/rosetta3/english/decommrules38.o \
/home/rosetta/archive/rosetta3/english/decommrules39.o \
/home/rosetta/archive/rosetta3/english/decommrules4.o \
/home/rosetta/archive/rosetta3/english/decommrules40.o \
/home/rosetta/archive/rosetta3/english/decommrules41.o \
/home/rosetta/archive/rosetta3/english/decommrules42.o \
/home/rosetta/archive/rosetta3/english/decommrules43.o \
/home/rosetta/archive/rosetta3/english/decommrules44.o \
/home/rosetta/archive/rosetta3/english/decommrules45.o \
/home/rosetta/archive/rosetta3/english/decommrules46.o \
/home/rosetta/archive/rosetta3/english/decommrules47.o \
/home/rosetta/archive/rosetta3/english/decommrules48.o \
/home/rosetta/archive/rosetta3/english/decommrules49.o \
/home/rosetta/archive/rosetta3/english/decommrules5.o \
/home/rosetta/archive/rosetta3/english/decommrules50.o \
/home/rosetta/archive/rosetta3/english/decommrules51.o \
/home/rosetta/archive/rosetta3/english/decommrules52.o \
/home/rosetta/archive/rosetta3/english/decommrules53.o \
/home/rosetta/archive/rosetta3/english/decommrules54.o \
/home/rosetta/archive/rosetta3/english/decommrules55.o \
/home/rosetta/archive/rosetta3/english/decommrules56.o \
/home/rosetta/archive/rosetta3/english/decommrules57.o \
/home/rosetta/archive/rosetta3/english/decommrules58.o \
/home/rosetta/archive/rosetta3/english/decommrules59.o \
/home/rosetta/archive/rosetta3/english/decommrules6.o \
/home/rosetta/archive/rosetta3/english/decommrules60.o \
/home/rosetta/archive/rosetta3/english/decommrules61.o \
/home/rosetta/archive/rosetta3/english/decommrules62.o \
/home/rosetta/archive/rosetta3/english/decommrules63.o \
/home/rosetta/archive/rosetta3/english/decommrules64.o \
/home/rosetta/archive/rosetta3/english/decommrules65.o \
/home/rosetta/archive/rosetta3/english/decommrules66.o \
/home/rosetta/archive/rosetta3/english/decommrules67.o \
/home/rosetta/archive/rosetta3/english/decommrules68.o \
/home/rosetta/archive/rosetta3/english/decommrules69.o \
/home/rosetta/archive/rosetta3/english/decommrules7.o \
/home/rosetta/archive/rosetta3/english/decommrules70.o \
/home/rosetta/archive/rosetta3/english/decommrules71.o \
/home/rosetta/archive/rosetta3/english/decommrules72.o \
/home/rosetta/archive/rosetta3/english/decommrules73.o \
/home/rosetta/archive/rosetta3/english/decommrules74.o \
/home/rosetta/archive/rosetta3/english/decommrules75.o \
/home/rosetta/archive/rosetta3/english/decommrules76.o \
/home/rosetta/archive/rosetta3/english/decommrules77.o \
/home/rosetta/archive/rosetta3/english/decommrules78.o \
/home/rosetta/archive/rosetta3/english/decommrules79.o \
/home/rosetta/archive/rosetta3/english/decommrules8.o \
/home/rosetta/archive/rosetta3/english/decommrules80.o \
/home/rosetta/archive/rosetta3/english/decommrules81.o \
/home/rosetta/archive/rosetta3/english/decommrules82.o \
/home/rosetta/archive/rosetta3/english/decommrules83.o \
/home/rosetta/archive/rosetta3/english/decommrules84.o \
/home/rosetta/archive/rosetta3/english/decommrules85.o \
/home/rosetta/archive/rosetta3/english/decommrules86.o \
/home/rosetta/archive/rosetta3/english/decommrules87.o \
/home/rosetta/archive/rosetta3/english/decommrules88.o \
/home/rosetta/archive/rosetta3/english/decommrules89.o \
/home/rosetta/archive/rosetta3/english/decommrules9.o \
/home/rosetta/archive/rosetta3/english/decommrules90.o \
/home/rosetta/archive/rosetta3/english/decommrules91.o \
/home/rosetta/archive/rosetta3/english/decommrules92.o \
/home/rosetta/archive/rosetta3/english/decommrules93.o \
/home/rosetta/archive/rosetta3/english/decommrules94.o \
/home/rosetta/archive/rosetta3/english/decommrules95.o \
/home/rosetta/archive/rosetta3/english/decommrules96.o \
/home/rosetta/archive/rosetta3/english/decommrules97.o \
/home/rosetta/archive/rosetta3/english/decommrules98.o \
/home/rosetta/archive/rosetta3/english/decommrules99.o \
/home/rosetta/archive/rosetta3/english/helpsubgrammars.o \
/home/rosetta/archive/rosetta3/english/ldaffixlex.o \
/home/rosetta/archive/rosetta3/english/ldanilrules.o \
/home/rosetta/archive/rosetta3/english/ldanmrules.o \
/home/rosetta/archive/rosetta3/english/ldblex.o \
/home/rosetta/archive/rosetta3/english/ldcatsets.o \
/home/rosetta/archive/rosetta3/english/ldconvrec.o \
/home/rosetta/archive/rosetta3/english/ldequal.o \
/home/rosetta/archive/rosetta3/english/ldgetkey.o \
/home/rosetta/archive/rosetta3/english/ldgluelex.o \
/home/rosetta/archive/rosetta3/english/ldmdict.o \
/home/rosetta/archive/rosetta3/english/ldmeasuresize.o \
/home/rosetta/archive/rosetta3/english/ldmrules.o \
/home/rosetta/archive/rosetta3/english/ldprims.o \
/home/rosetta/archive/rosetta3/english/ldstrtotype.o \
/home/rosetta/archive/rosetta3/english/ldsubgrammars.o \
/home/rosetta/archive/rosetta3/english/ldsucc.o \
/home/rosetta/archive/rosetta3/english/ldsurfswitch.o \
/home/rosetta/archive/rosetta3/english/ldtypetostr.o \
/home/rosetta/archive/rosetta3/english/lsauxdom.o \
/home/rosetta/archive/rosetta3/english/lsconvattr.o \
/home/rosetta/archive/rosetta3/english/lsconvrec.o \
/home/rosetta/archive/rosetta3/english/lsmruquo.o \
/home/rosetta/archive/rosetta3/english/lsstrtotype.o \
/home/rosetta/archive/rosetta3/english/lssurfquo.o \
/home/rosetta/archive/rosetta3/english/lstypetostr.o \
/home/rosetta/archive/rosetta3/english/maket.o \
/home/rosetta/archive/rosetta3/english/surfrules.o \
/home/rosetta/archive/rosetta3/english/surfrulesblocks.o \
/home/rosetta/archive/rosetta3/english/surfrulesgraphs.o \
/home/rosetta/archive/rosetta3/english/ldmorfdef.o \
/home/rosetta/archive/rosetta3/english/lsmatches.o \
/home/rosetta/archive/rosetta3/english/lsphondef.o \
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
 
/home/rosetta/archive/rosetta3/english/generation.exe : /home/rosetta/archive/rosetta3/english/commrules1.o \
/home/rosetta/archive/rosetta3/english/commrules10.o \
/home/rosetta/archive/rosetta3/english/commrules100.o \
/home/rosetta/archive/rosetta3/english/commrules101.o \
/home/rosetta/archive/rosetta3/english/commrules102.o \
/home/rosetta/archive/rosetta3/english/commrules103.o \
/home/rosetta/archive/rosetta3/english/commrules104.o \
/home/rosetta/archive/rosetta3/english/commrules105.o \
/home/rosetta/archive/rosetta3/english/commrules106.o \
/home/rosetta/archive/rosetta3/english/commrules107.o \
/home/rosetta/archive/rosetta3/english/commrules108.o \
/home/rosetta/archive/rosetta3/english/commrules109.o \
/home/rosetta/archive/rosetta3/english/commrules11.o \
/home/rosetta/archive/rosetta3/english/commrules110.o \
/home/rosetta/archive/rosetta3/english/commrules111.o \
/home/rosetta/archive/rosetta3/english/commrules112.o \
/home/rosetta/archive/rosetta3/english/commrules113.o \
/home/rosetta/archive/rosetta3/english/commrules114.o \
/home/rosetta/archive/rosetta3/english/commrules115.o \
/home/rosetta/archive/rosetta3/english/commrules116.o \
/home/rosetta/archive/rosetta3/english/commrules117.o \
/home/rosetta/archive/rosetta3/english/commrules118.o \
/home/rosetta/archive/rosetta3/english/commrules119.o \
/home/rosetta/archive/rosetta3/english/commrules12.o \
/home/rosetta/archive/rosetta3/english/commrules120.o \
/home/rosetta/archive/rosetta3/english/commrules121.o \
/home/rosetta/archive/rosetta3/english/commrules122.o \
/home/rosetta/archive/rosetta3/english/commrules123.o \
/home/rosetta/archive/rosetta3/english/commrules124.o \
/home/rosetta/archive/rosetta3/english/commrules125.o \
/home/rosetta/archive/rosetta3/english/commrules126.o \
/home/rosetta/archive/rosetta3/english/commrules127.o \
/home/rosetta/archive/rosetta3/english/commrules128.o \
/home/rosetta/archive/rosetta3/english/commrules129.o \
/home/rosetta/archive/rosetta3/english/commrules13.o \
/home/rosetta/archive/rosetta3/english/commrules130.o \
/home/rosetta/archive/rosetta3/english/commrules131.o \
/home/rosetta/archive/rosetta3/english/commrules132.o \
/home/rosetta/archive/rosetta3/english/commrules133.o \
/home/rosetta/archive/rosetta3/english/commrules134.o \
/home/rosetta/archive/rosetta3/english/commrules135.o \
/home/rosetta/archive/rosetta3/english/commrules136.o \
/home/rosetta/archive/rosetta3/english/commrules137.o \
/home/rosetta/archive/rosetta3/english/commrules138.o \
/home/rosetta/archive/rosetta3/english/commrules139.o \
/home/rosetta/archive/rosetta3/english/commrules14.o \
/home/rosetta/archive/rosetta3/english/commrules140.o \
/home/rosetta/archive/rosetta3/english/commrules15.o \
/home/rosetta/archive/rosetta3/english/commrules16.o \
/home/rosetta/archive/rosetta3/english/commrules17.o \
/home/rosetta/archive/rosetta3/english/commrules18.o \
/home/rosetta/archive/rosetta3/english/commrules19.o \
/home/rosetta/archive/rosetta3/english/commrules2.o \
/home/rosetta/archive/rosetta3/english/commrules20.o \
/home/rosetta/archive/rosetta3/english/commrules21.o \
/home/rosetta/archive/rosetta3/english/commrules22.o \
/home/rosetta/archive/rosetta3/english/commrules23.o \
/home/rosetta/archive/rosetta3/english/commrules24.o \
/home/rosetta/archive/rosetta3/english/commrules25.o \
/home/rosetta/archive/rosetta3/english/commrules26.o \
/home/rosetta/archive/rosetta3/english/commrules27.o \
/home/rosetta/archive/rosetta3/english/commrules28.o \
/home/rosetta/archive/rosetta3/english/commrules29.o \
/home/rosetta/archive/rosetta3/english/commrules3.o \
/home/rosetta/archive/rosetta3/english/commrules30.o \
/home/rosetta/archive/rosetta3/english/commrules31.o \
/home/rosetta/archive/rosetta3/english/commrules32.o \
/home/rosetta/archive/rosetta3/english/commrules33.o \
/home/rosetta/archive/rosetta3/english/commrules34.o \
/home/rosetta/archive/rosetta3/english/commrules35.o \
/home/rosetta/archive/rosetta3/english/commrules36.o \
/home/rosetta/archive/rosetta3/english/commrules37.o \
/home/rosetta/archive/rosetta3/english/commrules38.o \
/home/rosetta/archive/rosetta3/english/commrules39.o \
/home/rosetta/archive/rosetta3/english/commrules4.o \
/home/rosetta/archive/rosetta3/english/commrules40.o \
/home/rosetta/archive/rosetta3/english/commrules41.o \
/home/rosetta/archive/rosetta3/english/commrules42.o \
/home/rosetta/archive/rosetta3/english/commrules43.o \
/home/rosetta/archive/rosetta3/english/commrules44.o \
/home/rosetta/archive/rosetta3/english/commrules45.o \
/home/rosetta/archive/rosetta3/english/commrules46.o \
/home/rosetta/archive/rosetta3/english/commrules47.o \
/home/rosetta/archive/rosetta3/english/commrules48.o \
/home/rosetta/archive/rosetta3/english/commrules49.o \
/home/rosetta/archive/rosetta3/english/commrules5.o \
/home/rosetta/archive/rosetta3/english/commrules50.o \
/home/rosetta/archive/rosetta3/english/commrules51.o \
/home/rosetta/archive/rosetta3/english/commrules52.o \
/home/rosetta/archive/rosetta3/english/commrules53.o \
/home/rosetta/archive/rosetta3/english/commrules54.o \
/home/rosetta/archive/rosetta3/english/commrules55.o \
/home/rosetta/archive/rosetta3/english/commrules56.o \
/home/rosetta/archive/rosetta3/english/commrules57.o \
/home/rosetta/archive/rosetta3/english/commrules58.o \
/home/rosetta/archive/rosetta3/english/commrules59.o \
/home/rosetta/archive/rosetta3/english/commrules6.o \
/home/rosetta/archive/rosetta3/english/commrules60.o \
/home/rosetta/archive/rosetta3/english/commrules61.o \
/home/rosetta/archive/rosetta3/english/commrules62.o \
/home/rosetta/archive/rosetta3/english/commrules63.o \
/home/rosetta/archive/rosetta3/english/commrules64.o \
/home/rosetta/archive/rosetta3/english/commrules65.o \
/home/rosetta/archive/rosetta3/english/commrules66.o \
/home/rosetta/archive/rosetta3/english/commrules67.o \
/home/rosetta/archive/rosetta3/english/commrules68.o \
/home/rosetta/archive/rosetta3/english/commrules69.o \
/home/rosetta/archive/rosetta3/english/commrules7.o \
/home/rosetta/archive/rosetta3/english/commrules70.o \
/home/rosetta/archive/rosetta3/english/commrules71.o \
/home/rosetta/archive/rosetta3/english/commrules72.o \
/home/rosetta/archive/rosetta3/english/commrules73.o \
/home/rosetta/archive/rosetta3/english/commrules74.o \
/home/rosetta/archive/rosetta3/english/commrules75.o \
/home/rosetta/archive/rosetta3/english/commrules76.o \
/home/rosetta/archive/rosetta3/english/commrules77.o \
/home/rosetta/archive/rosetta3/english/commrules78.o \
/home/rosetta/archive/rosetta3/english/commrules79.o \
/home/rosetta/archive/rosetta3/english/commrules8.o \
/home/rosetta/archive/rosetta3/english/commrules80.o \
/home/rosetta/archive/rosetta3/english/commrules81.o \
/home/rosetta/archive/rosetta3/english/commrules82.o \
/home/rosetta/archive/rosetta3/english/commrules83.o \
/home/rosetta/archive/rosetta3/english/commrules84.o \
/home/rosetta/archive/rosetta3/english/commrules85.o \
/home/rosetta/archive/rosetta3/english/commrules86.o \
/home/rosetta/archive/rosetta3/english/commrules87.o \
/home/rosetta/archive/rosetta3/english/commrules88.o \
/home/rosetta/archive/rosetta3/english/commrules89.o \
/home/rosetta/archive/rosetta3/english/commrules9.o \
/home/rosetta/archive/rosetta3/english/commrules90.o \
/home/rosetta/archive/rosetta3/english/commrules91.o \
/home/rosetta/archive/rosetta3/english/commrules92.o \
/home/rosetta/archive/rosetta3/english/commrules93.o \
/home/rosetta/archive/rosetta3/english/commrules94.o \
/home/rosetta/archive/rosetta3/english/commrules95.o \
/home/rosetta/archive/rosetta3/english/commrules96.o \
/home/rosetta/archive/rosetta3/english/commrules97.o \
/home/rosetta/archive/rosetta3/english/commrules98.o \
/home/rosetta/archive/rosetta3/english/commrules99.o \
/home/rosetta/archive/rosetta3/english/copyt.o \
/home/rosetta/archive/rosetta3/english/decomlexrules1.o \
/home/rosetta/archive/rosetta3/english/decomlexrules2.o \
/home/rosetta/archive/rosetta3/english/decomlexrules3.o \
/home/rosetta/archive/rosetta3/english/genlexif.o \
/home/rosetta/archive/rosetta3/english/helpsubgrammars.o \
/home/rosetta/archive/rosetta3/english/ldaffixlex.o \
/home/rosetta/archive/rosetta3/english/ldblex.o \
/home/rosetta/archive/rosetta3/english/ldcatsets.o \
/home/rosetta/archive/rosetta3/english/ldconvrec.o \
/home/rosetta/archive/rosetta3/english/ldgenmrules.o \
/home/rosetta/archive/rosetta3/english/ldgetkey.o \
/home/rosetta/archive/rosetta3/english/ldgluelex.o \
/home/rosetta/archive/rosetta3/english/ldmdict.o \
/home/rosetta/archive/rosetta3/english/ldmeasuresize.o \
/home/rosetta/archive/rosetta3/english/ldmorfdef.o \
/home/rosetta/archive/rosetta3/english/ldmrules.o \
/home/rosetta/archive/rosetta3/english/ldstrtotype.o \
/home/rosetta/archive/rosetta3/english/ldsubgrammars.o \
/home/rosetta/archive/rosetta3/english/ldsubsttovar.o \
/home/rosetta/archive/rosetta3/english/ldsucc.o \
/home/rosetta/archive/rosetta3/english/ldtypetostr.o \
/home/rosetta/archive/rosetta3/english/lsauxdom.o \
/home/rosetta/archive/rosetta3/english/lsconvattr.o \
/home/rosetta/archive/rosetta3/english/lsconvrec.o \
/home/rosetta/archive/rosetta3/english/lsmatches.o \
/home/rosetta/archive/rosetta3/english/lsmruquo.o \
/home/rosetta/archive/rosetta3/english/lsphondef.o \
/home/rosetta/archive/rosetta3/english/lsstrtotype.o \
/home/rosetta/archive/rosetta3/english/lstypetostr.o \
/home/rosetta/archive/rosetta3/english/maket.o \
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
/home/rosetta/archive/rosetta3/english/ldgenilrules.o \
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
 
/home/rosetta/archive/rosetta3/english/mrucom.exe : /home/rosetta/archive/rosetta3/tools/mrucom.gensur \
/home/rosetta/archive/rosetta3/tools/mrucom.gendom \
/home/rosetta/archive/rosetta3/english/lduniquerels.o \
/home/rosetta/archive/rosetta3/english/lsauxdom.o \
/home/rosetta/archive/rosetta3/english/neededforcompiler.pf ;
	@/home/rosetta/archive/rosetta3/actions/gen $(language) mrucom
 
/home/rosetta/archive/rosetta3/english/surfcom.exe : /home/rosetta/archive/rosetta3/tools/surfcom.gensur \
/home/rosetta/archive/rosetta3/tools/surfcom.gendom \
/home/rosetta/archive/rosetta3/english/neededforcompiler.pf ;
	@/home/rosetta/archive/rosetta3/actions/gen $(language) surfcom
 
/home/rosetta/archive/rosetta3/english/surflink.exe : /home/rosetta/archive/rosetta3/tools/surflink.gensur \
/home/rosetta/archive/rosetta3/tools/surflink.gendom \
/home/rosetta/archive/rosetta3/english/neededforcompiler.pf ;
	@/home/rosetta/archive/rosetta3/actions/gen $(language) surflink
 
/home/rosetta/archive/rosetta3/english/auxcom.exe : /home/rosetta/archive/rosetta3/tools/auxcom.gensur \
/home/rosetta/archive/rosetta3/tools/auxcom.gendom \
/home/rosetta/archive/rosetta3/english/neededforcompiler.pf ;
	@/home/rosetta/archive/rosetta3/actions/gen $(language) auxcom
 
/home/rosetta/archive/rosetta3/english/tracom.exe : /home/rosetta/archive/rosetta3/tools/tracom.gensur \
/home/rosetta/archive/rosetta3/tools/tracom.gendom \
/home/rosetta/archive/rosetta3/english/ldmrules.o \
/home/rosetta/archive/rosetta3/english/lsauxdom.o \
/home/rosetta/archive/rosetta3/english/ldsubgrammars.o \
/home/rosetta/archive/rosetta3/english/helpsubgrammars.o \
/home/rosetta/archive/rosetta3/interlingua/liilrules.o \
/home/rosetta/archive/rosetta3/english/neededforcompiler.pf ;
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
 
/home/rosetta/archive/rosetta3/english/lexed.exe : /home/rosetta/archive/rosetta3/english/lexed.o \
/home/rosetta/archive/rosetta3/english/copyt.o \
/home/rosetta/archive/rosetta3/english/decomlexrules1.o \
/home/rosetta/archive/rosetta3/english/decomlexrules2.o \
/home/rosetta/archive/rosetta3/english/decomlexrules3.o \
/home/rosetta/archive/rosetta3/english/genlexif.o \
/home/rosetta/archive/rosetta3/english/helpsubgrammars.o \
/home/rosetta/archive/rosetta3/english/ldblex.o \
/home/rosetta/archive/rosetta3/english/ldcatsets.o \
/home/rosetta/archive/rosetta3/english/ldconvrec.o \
/home/rosetta/archive/rosetta3/english/ldgetkey.o \
/home/rosetta/archive/rosetta3/english/ldmdict.o \
/home/rosetta/archive/rosetta3/english/ldmeasuresize.o \
/home/rosetta/archive/rosetta3/english/ldmorfdef.o \
/home/rosetta/archive/rosetta3/english/ldmrules.o \
/home/rosetta/archive/rosetta3/english/ldstrtotype.o \
/home/rosetta/archive/rosetta3/english/ldsubgrammars.o \
/home/rosetta/archive/rosetta3/english/ldsucc.o \
/home/rosetta/archive/rosetta3/english/ldtypetostr.o \
/home/rosetta/archive/rosetta3/english/lsauxdom.o \
/home/rosetta/archive/rosetta3/english/lsconvattr.o \
/home/rosetta/archive/rosetta3/english/lsconvrec.o \
/home/rosetta/archive/rosetta3/english/lsmatches.o \
/home/rosetta/archive/rosetta3/english/lsmruquo.o \
/home/rosetta/archive/rosetta3/english/lsphondef.o \
/home/rosetta/archive/rosetta3/english/lsstrtotype.o \
/home/rosetta/archive/rosetta3/english/lstypetostr.o \
/home/rosetta/archive/rosetta3/english/maket.o \
/home/rosetta/archive/rosetta3/english/lslexed.o \
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
 
english/target/gencom2.exe : /home/rosetta/archive/rosetta3/english/ldgetkey.o \
/home/rosetta/archive/rosetta3/english/ldconvrec.o \
/home/rosetta/archive/rosetta3/english/ldstrtotype.o \
/home/rosetta/archive/rosetta3/english/ldcatsets.o \
/home/rosetta/archive/rosetta3/english/lsconvrec.o \
/home/rosetta/archive/rosetta3/english/ldstrtostr.o \
/home/rosetta/archive/rosetta3/english/lsstrtotype.o \
/home/rosetta/archive/rosetta3/english/lstypetostr.o \
/home/rosetta/archive/rosetta3/english/lsconvattr.o \
/home/rosetta/archive/rosetta3/english/ldtypetostr.o \
/home/rosetta/archive/rosetta3/english/maket.o \
/home/rosetta/archive/rosetta3/interlingua/liilrules.o \
/home/rosetta/archive/rosetta3/general/windows.o \
/home/rosetta/archive/rosetta3/general/rectoscreen.o \
/home/rosetta/archive/rosetta3/general/debug.o \
/home/rosetta/archive/rosetta3/general/liiddict.o \
/home/rosetta/archive/rosetta3/tools/tldconvrec.o \
/home/rosetta/archive/rosetta3/tools/tldstrtostr.o ;
	@nep
 
#mrucom.exe en tracom.exe zijn afhankelijk van: 
 
english/target/gencom3.exe : /home/rosetta/archive/rosetta3/english/lsmruquo.o \
/home/rosetta/archive/rosetta3/english/ldmrules.o \
/home/rosetta/archive/rosetta3/english/ldsubgrammars.o \
/home/rosetta/archive/rosetta3/english/helpsubgrammars.o ;
	@nep
 
#mrucom.exe en tracom.exe zijn afhankelijk van: 
 
english/target/gencom4.exe : /home/rosetta/archive/rosetta3/english/lduniquerels.o \
/home/rosetta/archive/rosetta3/english/lsauxdom.o ;
	@nep
 
english/target/gencom5.exe : /home/rosetta/archive/rosetta3/general/string.o \
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
