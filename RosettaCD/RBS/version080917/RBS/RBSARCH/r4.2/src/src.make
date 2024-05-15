
integrate : bin%(pf)/genmake.exe \
            bin%(pf)/get_fname.exe ;

bin%(pf)/genmake.exe : bin%(pf)/genmake.o \
                        bin%(pf)/logname.o ;
	@actions/lrbs bin%(pf) genmake

bin%(pf)/get_fname.exe : bin%(pf)/get_fname.o \
                          bin%(pf)/logname.o ;
	@actions/lrbs bin%(pf) get_fname

bin%(pf)/genmake.o : src/genmake.c ;
	@actions/ccrbs src bin%(pf) genmake $(debug)

bin%(pf)/get_fname.o : src/get_fname.c ;
	@actions/ccrbs src bin%(pf) get_fname

bin%(pf)/logname.o : src/logname.c ;
	@actions/ccrbs src bin%(pf) logname




