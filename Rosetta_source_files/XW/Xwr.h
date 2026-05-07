/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Xwr.h
 *  Creation date   : 1991-07-25
 *  Author          : Y. van Dinther
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : X-Windows Registration Module,
 *                    This module registers information about the hierarchy of the
 *                    windows (and is mainly used by Xwb)
 *
 *EMP:::===================================================================*/

#ifndef _XWR_H
#define _XWR_H

#include <X11/Intrinsic.h>
#include "Xwuil.h"

typedef struct Xwr_WINDOW_INFO {
    Xid                       window_id;
    struct Xwr_WINDOW_INFO    *p_child;  /* pointer to the first child */
    struct Xwr_WINDOW_INFO    *p_next;   /* pointer to a neighbour */
}
Xwr_WINDOW_INFO;

extern void FUNCDEF (
XwrInitialize, (Xid top_window));

extern void FUNCDEF (
XwrAddDefaultButton, ( Xid window_id, Xid default_button_id ));

extern Xid FUNCDEF (
XwrGetDefaultButton, ( Xid window_id ));

extern void FUNCDEF (
XwrAddHierarchy, ( Xid window_id, Xid parent_id ));

extern void FUNCDEF (
XwrRemoveHierarchy, ( Xid window_id ));

extern Xwr_WINDOW_INFO *FUNCDEF (
XwrSearchHierarchy, ( Xid window_id ));

extern Xwr_WINDOW_INFO *FUNCDEF (
XwrSearchLeaf, ( Xid window_id ));

#endif _XWR_H
