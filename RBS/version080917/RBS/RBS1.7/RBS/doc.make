 

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
