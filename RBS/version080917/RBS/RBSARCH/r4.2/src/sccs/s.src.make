h52056
s 00001/00001/00023
d D 1.4 95/10/18 16:03:35 rous 4 3
c 
e
s 00014/00014/00010
d D 1.3 95/10/18 14:06:41 rous 3 2
c 
e
s 00024/00001/00000
d D 1.2 95/10/17 11:26:33 rous 2 1
c 
e
s 00001/00000/00000
d D 1.1 95/10/17 09:11:02 rous 1 0
c date and time created 95/10/17 09:11:02 by rous
e
u
U
f e 0
t
T
I 1
D 2
 
E 2
I 2

D 3
integrate : bin-sunos/genmake.exe \
            bin-sunos/get_fname.exe ;
E 3
I 3
integrate : bin%(pf)/genmake.exe \
            bin%(pf)/get_fname.exe ;
E 3

D 3
bin-sunos/genmake.exe : bin-sunos/genmake.o \
                        bin-sunos/logname.o ;
	@actions/lrbs bin-sunos genmake
E 3
I 3
bin%(pf)/genmake.exe : bin%(pf)/genmake.o \
                        bin%(pf)/logname.o ;
	@actions/lrbs bin%(pf) genmake
E 3

D 3
bin-sunos/get_fname.exe : bin-sunos/get_fname.o \
                          bin-sunos/logname.o ;
	@actions/lrbs bin-sunos get_fname
E 3
I 3
bin%(pf)/get_fname.exe : bin%(pf)/get_fname.o \
                          bin%(pf)/logname.o ;
	@actions/lrbs bin%(pf) get_fname
E 3

D 3
bin-sunos/genmake.o : src/genmake.c ;
	@actions/ccrbs src bin-sunos genmake
E 3
I 3
bin%(pf)/genmake.o : src/genmake.c ;
D 4
	@actions/ccrbs src bin%(pf) genmake
E 4
I 4
	@actions/ccrbs src bin%(pf) genmake $(debug)
E 4
E 3

D 3
bin-sunos/get_fname.o : src/get_fname.c ;
	@actions/ccrbs src bin-sunos get_fname
E 3
I 3
bin%(pf)/get_fname.o : src/get_fname.c ;
	@actions/ccrbs src bin%(pf) get_fname
E 3

D 3
bin-sunos/logname.o : src/logname.c ;
	@actions/ccrbs src bin-sunos logname
E 3
I 3
bin%(pf)/logname.o : src/logname.c ;
	@actions/ccrbs src bin%(pf) logname
E 3




E 2
E 1
