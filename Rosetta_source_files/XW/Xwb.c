/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Xwb.C
 *  Creation date   : 1991-05-01
 *  Author          : Y. van Dinther
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : X-Windows Button (Push- and Toggle Buttons)
 *                    handling routines
 *
 *EMP:::===================================================================*/

#include <X11/Intrinsic.h>
#include <Xm/Xm.h>
#include <Xm/ToggleBG.h>
#include "gendef.h"
#include "Xwuil.h"
#include "Xwb.h"
#include "Xwu.h"
#include "Xwd.h"
#include "Xwr.h"
#include "wch.h"
#include "wipc.h"

typedef struct KEY_INFO {
    Xwr_WINDOW_INFO  *p_window;
    Boolean          cleanup_children;
}
KEY_INFO;

KEY_INFO    key_info[X_LAST];

static Boolean Get_key_called = FALSE;

static Boolean Dbg_ok_pressed = FALSE;
static Xid     Dbg_ok_key = X_dbg_ok_button;
static Boolean Dbg_ok_asked = FALSE;

static Position Last_x_pos = 0;
static Position Last_y_pos = 0;

static Boolean Cleanup_mode = FALSE;
static Xid     Cleanup_key = X_undefined;

static Widget  Traversal_button = NULL;

static WIPC Cur_WIPC;

static void make_real_key ();
static void generate_and_send_key ();
static void send_key ();
static void handle_dbg_ok ();

void XwbAction (w, p_tag, p_reason)
    Widget w;
    Xid    *p_tag;
    XmAnyCallbackStruct *p_reason;
{
    if ( XwdInFile() ) {
        XwdAction (w, p_tag, p_reason);
    }
    else if (! Get_key_called || Cleanup_mode) {
        if (! Cleanup_mode && *p_tag == Dbg_ok_key) {
            handle_dbg_ok();
        }
        else {
            XBell (XwuDisplay(), 100);
        }
    }
    else {
        make_real_key (w, p_tag);

        if ( key_info[*p_tag].cleanup_children &&
             key_info[*p_tag].p_window->p_child != NULL ) {
            Cleanup_mode = TRUE;
            Cleanup_key = *p_tag;
            generate_and_send_key ();
        }
        else {
            if ( p_reason != NULL && ! Cleanup_mode ) {
                Last_x_pos = p_reason->event->xbutton.x_root;
                Last_y_pos = p_reason->event->xbutton.y_root;
            }
            if ( *p_tag == Dbg_ok_key ) {
                handle_dbg_ok ();
            }
            else {
                send_key (*p_tag);
            }
        }          
    }          
}

void XwbHandleGetKey (new_WIPC)
    WIPC new_WIPC;
{
    Xid  but;

    Cur_WIPC = new_WIPC;
    Get_key_called = TRUE;
    if ( Cleanup_mode ) {
       generate_and_send_key ();
    }
    else if ( Dbg_ok_asked && Dbg_ok_pressed ) {
        send_key (Dbg_ok_key);
    }
}			/* end of XwbHandleGetKey */

void XwbHandleSetKeys ()
{
    Xid              key_id, window_id;
    Widget           w;
    Xwr_WINDOW_INFO  *p_window;

    if ( ! WCH_get_id (&window_id) ) {
        XwuError ("error getting data");
    }

    p_window = NULL;
    while ( WCH_get_id (&key_id) ) {
        if ( key_id < 0 ) {
            key_id = - key_id;
            key_info[key_id].cleanup_children = FALSE;
        }
        else {
            key_info[key_id].cleanup_children = TRUE;
        }
        if ( key_info[key_id].p_window == NULL ) {
            if ( p_window == NULL ) {
                p_window = XwrSearchHierarchy (window_id);
            }
            key_info[key_id].p_window = p_window;
        }
	w = XwuWidget (key_id);
        if ( w != NULL ) {
            XtSetSensitive(w, TRUE);
        }
        if ( w == Traversal_button ) {
            XmProcessTraversal (w, XmTRAVERSE_CURRENT);
        }
        if ( key_id == Dbg_ok_key ) {
            XwdSetOkButton (TRUE);
            Dbg_ok_asked = TRUE;
        }
    }
}

void XwbSetDbgOkKey ( p_window )
    Xwr_WINDOW_INFO   *p_window;
{
    key_info[Dbg_ok_key].p_window = p_window;
    key_info[Dbg_ok_key].cleanup_children = TRUE;
}

void XwbHandleUnsetKeys ()
{
    Xid       key_id;
    Widget    w;

    while ( WCH_get_id (&key_id) ) {
        if ( key_id < 0 ) {
            key_id = - key_id;
        }
        w = XwuWidget(key_id);
        if ( w != NULL && key_id != Dbg_ok_key) {
            XtSetSensitive (w, FALSE);
        }
        else if ( key_id == Dbg_ok_key ) {
            Dbg_ok_asked = FALSE;
        }
    }
}

void XwbRemoveKeys ( window_id )
    Xid    window_id;
{
    Xid              i;
    Xwr_WINDOW_INFO  *p_window;
    Widget           w;

    for ( i = window_id, p_window = NULL; 
          i < X_LAST && ( key_info[i].p_window == p_window ||
          key_info[i].p_window == NULL || p_window == NULL );    i++) {
        if ( key_info[i].p_window != NULL &&
             key_info[i].p_window->window_id  == window_id ) {
            p_window = key_info[i].p_window; 
            key_info[i].p_window = NULL;
            w = XwuWidget(i);
            if ( w != NULL && i != Dbg_ok_key) {
                XtSetSensitive (w, FALSE);
            }
            else  if ( i == Dbg_ok_key ) {
                Dbg_ok_asked = FALSE;
            }
        }
    }
}

void XwbLastButtonPos (p_x, p_y)
    Position             *p_x;
    Position             *p_y;
{
    *p_x = Last_x_pos;
    *p_y = Last_y_pos;
}

void XwbSetTraversalWidget (w)
    Widget    w;
{
    Traversal_button = w;
}

Xid XwbCleanupKey ()
{
    if ( Cleanup_mode ) {
        return Cleanup_key;
    }
    else {
       return X_undefined;
    }
}

static void make_real_key ( w, p_tag )
    Widget   w;
    Xid      *p_tag; /* in-out */
{
    int      i;
    Boolean  found;

    if ( *p_tag >= SCREEN_START ) {
        found = FALSE;
        for ( i = 0; i < MAX_SCREENS; i++ ) {
            if ( XwuWidget (XwuCodeKey (*p_tag, i)) == w ) {
                found = TRUE;
                break;
            }
        }
        if ( found ) {
            *p_tag = XwuCodeKey (*p_tag, i);
        }
        else {
            XwuError ("software error in Xwb:make_real_key");
        }
    }
}

static void generate_and_send_key ()
{
    Xid              but;
    Xwr_WINDOW_INFO  *p_cleanup_window, *p_leaf;

    p_cleanup_window = key_info[Cleanup_key].p_window;
    if ( p_cleanup_window->p_child != NULL ) {
        p_leaf = XwrSearchLeaf (p_cleanup_window->window_id);
        but = XwrGetDefaultButton (p_leaf->window_id);
    }
    else {
        but = Cleanup_key;
        Cleanup_mode = FALSE;
    }
    send_key (but);

    if (Cleanup_key == Dbg_ok_key && p_cleanup_window->p_child != NULL &&
        p_cleanup_window->p_child == p_leaf && p_leaf->p_next == NULL ) {
        handle_dbg_ok;
    }
}

static void send_key (key)
    Xid    key;
{
    if (! WCH_put_message_id (SEND_ID_MSG) ||
        ! WCH_put_id (key) ||
        ! WCH_send (Cur_WIPC) ) {
        XwuError ("error in message-sending");
    }
    if ( key == Dbg_ok_key ) {
        XwdSetOkButton (FALSE);
        Dbg_ok_pressed = FALSE;
        Dbg_ok_asked = FALSE;
    }
    Get_key_called = FALSE;
}

static void handle_dbg_ok ()
{

    if ( Get_key_called && Dbg_ok_asked && ! Cleanup_mode ) {
        send_key (Dbg_ok_key);
    }
    else {
        Dbg_ok_pressed = TRUE;
        XtUnmanageChild(XwuWidget(X_dbg_window));
    }
}
