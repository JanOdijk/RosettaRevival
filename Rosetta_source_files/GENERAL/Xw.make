
Xw/Xw.o : Xw/Xw.c \
          unix/gendef.h \
          unix/logc.h \
          Xw/Xwuil.h \
          Xw/Xid.h \
          Xw/Sid.h \
          Xw/Xwa.h \
          Xw/Xwd.h \
          Xw/Xwb.h \
          Xw/Xwh.h \
          Xw/Xwl.h \
          Xw/Xwm.h \
          Xw/Xwr.h \
          Xw/Xwt.h \
          Xw/Xwu.h ;
	@actions/Xc Xw Xw

Xw/Xwa.o : Xw/Xwa.c \
           Xw/Xwa.h \
           unix/gendef.h \
           Xw/Xwuil.h \
           Xw/Xid.h \
           Xw/Sid.h \
           Xw/Xwa.h \
           Xw/Xwu.h \
           unix/wch.h \
           unix/paspar.h \
           unix/wipc.h \
           unix/wchdef.h \
           Xw/Attr.h \
           Xw/AttrP.h ;
	@actions/Xc Xw Xwa

Xw/Xwb.o : Xw/Xwb.c \
           Xw/Xwb.h \
           unix/gendef.h \
           Xw/Xwuil.h \
           Xw/Xid.h \
           Xw/Sid.h \
           Xw/Xwu.h \
           Xw/Xwd.h \
           Xw/Xwr.h \
           unix/wch.h \
           unix/paspar.h \
           unix/wipc.h \
           unix/wchdef.h ;
	@actions/Xc Xw Xwb

Xw/Xwd.o : Xw/Xwd.c \
           Xw/Xwd.h \
           unix/gendef.h \
           Xw/Xwuil.h \
           Xw/Xid.h \
           Xw/Sid.h \
           Xw/Xwb.h \
           Xw/Xwu.h \
           Xw/Xwd.h \
           Xw/Xwm.h ;
	@actions/Xc Xw Xwd

Xw/Xwh.o : Xw/Xwh.c \
           Xw/Xwh.h \
           unix/gendef.h \
           Xw/Xwuil.h \
           Xw/Xid.h \
           Xw/Sid.h \
           Xw/Xwu.h ;
	@actions/Xc Xw Xwh

Xw/Xwl.o : Xw/Xwl.c \
           Xw/Xwl.h \
           unix/gendef.h \
           Xw/Xwuil.h \
           Xw/Xid.h \
           Xw/Sid.h \
           Xw/Xwu.h ;
	@actions/Xc Xw Xwl

Xw/Xwm.o : Xw/Xwm.c \
           Xw/Xwm.h \
           unix/gendef.h \
           Xw/Xwuil.h \
           Xw/Xid.h \
           Xw/Sid.h \
           Xw/Xwa.h \
           Xw/Xwu.h \
           Xw/Xwd.h \
           Xw/Xwb.h \
           Xw/Xwl.h \
           Xw/Xwr.h \
           Xw/Xwt.h \
           unix/wch.h \
           unix/paspar.h \
           unix/wipc.h \
           unix/wchdef.h \
           Xw/Attr.h \
           Xw/Tree.h \
           unix/sockipc.h \
           unix/mb.h \
           unix/globdef.h ;
	@actions/Xc Xw Xwm

Xw/Xwr.o : Xw/Xwr.c \
           Xw/Xwr.h \
           unix/gendef.h \
           Xw/Xwuil.h \
           Xw/Xid.h \
           Xw/Sid.h \
           Xw/Xwu.h ;
	@actions/Xc Xw Xwr

Xw/Xwt.o : Xw/Xwt.c \
           Xw/Xwt.h \
           unix/gendef.h \
           Xw/Xwuil.h \
           Xw/Xid.h \
           Xw/Sid.h \
           Xw/Xwu.h \
           Xw/Tree.h \
           Xw/TreeP.h ;
	@actions/Xc Xw Xwt

Xw/Xwu.o : Xw/Xwu.c \
           Xw/Xwu.h \
           unix/gendef.h \
           Xw/Xwuil.h \
           Xw/Xid.h \
           Xw/Sid.h \
           Xw/Xwr.h \
           Xw/Xwu.h \
           Xw/Tree.h \
           Xw/TreeP.h ;
	@actions/Xc Xw Xwu

Xw/Tree.o : Xw/Tree.c \
           Xw/Tree.h \
           unix/gendef.h \
           Xw/Xwuil.h \
           Xw/Xid.h \
           Xw/Sid.h \
           Xw/TreeP.h ;
	@actions/Xc Xw Tree

Xw/Attr.o : Xw/Attr.c \
           Xw/Attr.h \
           unix/gendef.h \
           Xw/Xwuil.h \
           Xw/Xid.h \
           Xw/Sid.h \
           Xw/AttrP.h ;
	@actions/Xc Xw Attr

Xw/Xid.h : Xw/Xid.def ;
	@actions/stripdef Xw Xid

Xw/Sid.h : Xw/Sid.def ;
	@actions/stripdef Xw Sid


Xw/windows.uid : Xw/windows.uil \
                 Xw/mw.uil  \
                 Xw/Xwuil.h  \
                 Xw/Xid.h \
                 Xw/Sid.h \
                 Xw/dbgset.uil  \
                 Xw/env.uil  \
                 Xw/amb1.uil  \
                 Xw/mp.uil  \
                 Xw/mg.uil  \
                 Xw/dialogs.uil  \
                 Xw/dbg.uil  \
                 Xw/tree.uil  \
                 Xw/trees.uil  \
                 Xw/attr.uil  \
                 Xw/help.uil  \
                 Xw/amb2.uil  \
                 Xw/amb3.uil  \
                 Xw/hn.uil ;
	@actions/uid Xw windows

Xw/Xlex.o : Xw/Xlex.c \
          unix/gendef.h \
          unix/logc.h \
          Xw/Xwuil.h \
          Xw/Xid.h \
          Xw/Sid.h \
          Xw/Xwa.h \
          Xw/Xwd.h \
          Xw/Xwb.h \
          Xw/Xwh.h \
          Xw/Xwl.h \
          Xw/Xwm.h \
          Xw/Xwr.h \
          Xw/Xwt.h \
          Xw/Xwu.h ;
	@actions/Xc Xw Xlex

Xw/lexed.uid : Xw/lexed.uil \
                 Xw/Xwuil.h  \
                 Xw/Xid.h \
                 Xw/Sid.h \
                 Xw/le_select.uil  \
                 Xw/le_sid.uil  \
                 Xw/le_dialogs.uil ;
	@actions/uid Xw lexed

