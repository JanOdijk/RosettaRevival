/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Xwl.H
 *  Creation date   : 1991-05-01
 *  Author          : Y. van Dinther
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : X-Windows List handling routines
 *
 *EMP:::===================================================================*/

#ifndef _XWL_H
#define _XWL_H

#include <X11/Intrinsic.h>
#include <Xm/Xm.h>
#include "Xwuil.h"

#define XWL_MAX_LIST_LENGTH     700

extern void FUNCDEF (
XwlInitialize, ());

extern void FUNCDEF (
XwlAction, (Widget              w,
            Xid                 *p_tag,
            XmAnyCallbackStruct *p_reason));

#endif _XWL_H
