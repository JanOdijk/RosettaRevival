/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Xwb.H
 *  Creation date   : 1991-05-01
 *  Author          : Y. van Dinther
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : X-Windows Button (Push- and Toggle Buttons)
 *                    handling routines
 *
 *EMP:::===================================================================*/

#ifndef _XWB_H
#define _XWB_H

#include <X11/Intrinsic.h>
#include <Xm/Xm.h>
#include "Xwuil.h"

extern void FUNCDEF (
XwbAction, (Widget              w,
            Xid                 *p_tag,
            XmAnyCallbackStruct *p_reason));

extern void FUNCDEF (
XwbHandleGetKey, (WIPC new_WIPC));

extern void FUNCDEF (
XwbHandleSetKeys, (void));

extern void FUNCDEF (
XwbSetDbgOkKey, (Xwr_WINDOW_INFO   *p_window));

extern void FUNCDEF (
XwbHandleUnsetKeys, (void));

extern void FUNCDEF (
XwbRemoveKeys, (Xid  window_id));

extern void FUNCDEF (
XwbLastButtonPos, (Position *p_x, Position *p_y));

extern void FUNCDEF (
XwbSetTraversalWidget, (Widget w));

extern Xid FUNCDEF (
XwbCleanupKey, (void));

#endif _XWB_H
