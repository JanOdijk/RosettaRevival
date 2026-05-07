/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Xwa.h
 *  Creation date   : 1991-05-02
 *  Author          : Y. van Dinther
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : X-Windows Attribute Module
 *
 *EMP:::===================================================================*/

#ifndef _XWA_H
#define _XWA_H

#include <X11/Intrinsic.h>
#include <Xm/Xm.h>

extern void FUNCDEF (
XwaAction, (Widget w, int *p_tag, XmAnyCallbackStruct *p_reason));

extern void FUNCDEF (
XwaInitialize, ());

extern void FUNCDEF (
XwaDestroyAttr, (Xid  tag));

extern void FUNCDEF (
XwaStartAttr, (Xid  tag));

extern void FUNCDEF (
XwaSetAttr, ());

extern void FUNCDEF (
XwaEndAttr, (Xid  tag));

extern Xid FUNCDEF (
XwaGetAttr, (Xid  tag));

extern void FUNCDEF (
XwaGetAttrChanged, (void));

extern void FUNCDEF (
XwaHandleAttrVal, (Xid  tag));

#endif _XWA_H
