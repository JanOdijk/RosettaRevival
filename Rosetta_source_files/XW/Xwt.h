/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Xwt.h
 *  Creation date   : 1991-05-02
 *  Author          : H. M. M. van de Schoot
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : X-Windows Tree Module
 *
 *EMP:::===================================================================*/

#ifndef _XWT_H
#define _XWT_H

#include <X11/Intrinsic.h>
#include <Xm/Xm.h>

extern void FUNCDEF (
XwtAction, (Widget w, int *p_tag, XmAnyCallbackStruct *p_reason));

extern void FUNCDEF (
XwtInitialize, ());

extern void FUNCDEF (
XwtDestroyTree, (Xid  tag));

extern void FUNCDEF (
XwtStartTree, (Xid  tag));

extern void FUNCDEF (
XwtSetNode, (Xid   node_tag,  Xid  parent_tag,
             char  *p_label1, char *p_label2));

extern void FUNCDEF (
XwtEndTree, (Xid  tag));

extern Xid FUNCDEF (
XwtGetNode, (Xid  tag));

#endif _XWT_H
