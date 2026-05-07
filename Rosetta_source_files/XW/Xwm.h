/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Xwm.H
 *  Creation date   : 1991-05-02
 *  Author          : Y. van Dinther
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : X-Windows Message handler
 *
 *EMP:::===================================================================*/

#ifndef _XWM_H
#define _XWM_H

#include <X11/Intrinsic.h>
#include <Xm/Xm.h>

extern void FUNCDEF (
XwmInitialize, (XtAppContext appl_context, char *port_nr_str));

extern void FUNCDEF (
XwmStartCommunication, (void));

#endif _XWM_H
