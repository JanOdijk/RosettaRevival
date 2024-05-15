h19076
s 00035/00000/00001
d D 1.2 95/10/17 11:07:32 rous 2 1
c 
e
s 00001/00000/00000
d D 1.1 95/10/17 09:03:03 rous 1 0
c date and time created 95/10/17 09:03:03 by rous
e
u
U
f e 0
t
T
I 1
 
I 2

doc/(filename).dvi : doc/(filename).aux3 ;

doc/(filename).aux3 : doc/(filename).aux2 ;
	status=0; cmp -s $? $@ || status=1; \
	if test $$status = 0; \
	then touch $@; \
	else rm -f $?; make -f doc/target/doc.make.rbs $?; \
	cp doc/target/(filename).aux $@; \
	fi

doc/(filename).aux2 : doc/(filename).aux1 ;
	status=0; cmp -s $? $@ || status=1; \
	if test $$status = 0; \
	then touch $@; \
	else rm -f $?; make -f doc/target/doc.make.rbs $?; \
	cp doc/target/(filename).aux $@; \
	fi

doc/(filename).aux1 : doc/(filename).tex ;
	@actions/dlatex (filename)
	cp doc/target/(filename).aux $@


doc/(filename).print1 : doc/(filename).dvi ;
	@actions/dprtex (filename) -Pkl1

doc/(filename).print2 : doc/(filename).dvi ;
	@actions/dprtex (filename) -Pkl2

doc/(filename).fmview : doc/(filename).fm ;
	@actions/dviewer (filename) &

doc/(filename).preview : doc/(filename).dvi ;
	@actions/dpreview (filename) &
E 2
E 1
