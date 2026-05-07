/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Xwd.h
 *  Creation date   : 1991-05-01
 *  Author          : Y. van Dinther
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : X-Windows Debug handling routines
 *
 *EMP:::===================================================================*/

#ifndef _XWD_H
#define _XWD_H

#include <X11/Intrinsic.h>
#include <Xm/Xm.h>
#include "Xwuil.h"

extern void FUNCDEF (
XwdInitialize, (void));

extern void FUNCDEF (
XwdAction, (Widget              w,
            Xid                 *p_tag,
            XmAnyCallbackStruct *p_reason));

extern Boolean FUNCDEF (
XwdOnHold, (void));

extern Boolean FUNCDEF (
XwdInFile, (void));

extern void FUNCDEF (
XwdSetOkButton, (Boolean  on));

extern void FUNCDEF (
XwdSetPosition, (void));

#endif _XWD_H
