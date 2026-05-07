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

#include <X11/Intrinsic.h>
#include "gendef.h"
#include "Xwuil.h"
#include "Xwu.h"
#include "Xwb.h"
#include "Xwr.h"

#define NR_WINDOW_TYPES    20
#define NR_DYN_WINDOWS     4
#define NR_WINDOWS         NR_WINDOW_TYPES + NR_DYN_WINDOWS * MAX_SCREENS 

/* static structures and variables */

typedef struct DEFAULT_BUTTON_INFO {
    Xid    window_id;
    Xid    default_button_id;
}
DEFAULT_BUTTON_INFO;

DEFAULT_BUTTON_INFO      db_array[NR_WINDOWS];
int                      db_index = 0;

Xwr_WINDOW_INFO mw_struct = { X_undefined, NULL, NULL };

Xwr_WINDOW_INFO  *p_hierarchy = &mw_struct;

/*static functions */

static Xwr_WINDOW_INFO *search_leaf ();
static Boolean search_id ();

void XwrInitialize (top_window)
    Xid top_window;
{
    mw_struct.window_id = top_window;
}


void XwrAddDefaultButton ( window_id, default_button_id )
    Xid     window_id;
    Xid     default_button_id;
{
    if ( db_index < NR_WINDOWS ) {
        db_array[db_index].window_id = window_id;
        db_array[db_index].default_button_id = default_button_id;
        db_index++;
    }
    else {
        XwuError ("can't register the default button of the window");
    }
}

Xid XwrGetDefaultButton ( window_id )
    Xid     window_id;
{
    int    i;

    for ( i = 0; i < db_index; i++ ) {
        if ( db_array[i].window_id == window_id ) {
            return db_array[i].default_button_id;
        }
    }
    return X_undefined;
}


void XwrAddHierarchy ( window_id, parent_id )
    Xid     window_id;
    Xid     parent_id;
{
    Xwr_WINDOW_INFO     *p_info, *p_parent;

    if ( search_id ( p_hierarchy, window_id, &p_info, &p_parent ) ) {
        if ( p_parent->window_id == parent_id || parent_id == X_undefined ) {
            return;
        }
        else {
            XwbRemoveKeys ( window_id );
            XwrRemoveHierarchy ( window_id );
        }
    }

    p_info = ( Xwr_WINDOW_INFO *) malloc (sizeof(Xwr_WINDOW_INFO));
    p_info->window_id = window_id;
    p_info->p_child = NULL;
    p_info->p_next = NULL;

    if ( parent_id == X_undefined ) {
        if ( p_hierarchy == NULL ) {
            p_hierarchy = p_info;
        }
        else {
            p_parent = search_leaf ( p_hierarchy );
            p_parent->p_child = p_info;
        }
    }
    else {
        p_parent = XwrSearchHierarchy ( parent_id );
        p_info->p_next = p_parent->p_child;
        p_parent->p_child = p_info;
    }
    if ( window_id == X_dbg_window ) {
        XwbSetDbgOkKey (p_info);
    }    
}

void XwrRemoveHierarchy ( window_id )
    Xid     window_id;
{
    Xwr_WINDOW_INFO     *p_info, *p_parent, *p_prev;

    if ( ! search_id ( p_hierarchy, window_id, &p_info, &p_parent ) ) {
/*  unmanaging an already unmanaged window should not cause an error (e.g. mp_window):
        XwuError ("cannot remove not existing window");
*/
    }
    else if ( p_info->p_child != NULL ) {
        XwuError ( "the window to be removed is not a leaf");
    }
    else {
        if ( p_parent == NULL ) {
            p_hierarchy = NULL;
        }
        else if ( p_parent->p_child == p_info ) {
            p_parent->p_child = p_info->p_next;
        }
        else {
            p_prev = p_parent->p_child;
            while ( p_prev->p_next != p_info ) {
                p_prev = p_prev->p_next;
            }
            p_prev->p_next = p_info->p_next;
        }
        free (p_info);
    }
}

Xwr_WINDOW_INFO *XwrSearchHierarchy ( window_id )
    Xid     window_id;
{
    Xwr_WINDOW_INFO   *p_info, *p_parent;

    if ( ! search_id ( p_hierarchy, window_id, &p_info, &p_parent ) ) {
        XwuError ("searching for not existing window");
    }
    return p_info;
 
}

Xwr_WINDOW_INFO *XwrSearchLeaf ( window_id )
    Xid     window_id;
{
    Xwr_WINDOW_INFO  *p_info;

    p_info = XwrSearchHierarchy (window_id);
    return search_leaf (p_info);
}

static Xwr_WINDOW_INFO *search_leaf ( p_info )
    Xwr_WINDOW_INFO   *p_info;
{
    Xwr_WINDOW_INFO   *p_leaf;

    p_leaf = p_info;
    while ( p_leaf->p_child != NULL ) {
        p_leaf = p_leaf->p_child;
    }
    return p_leaf;

}

static Boolean search_id ( p_info, window_id, pp_out, pp_parent )
    Xwr_WINDOW_INFO   *p_info;      /* starting level */
    Xid               window_id;    /* id to be searched */
    Xwr_WINDOW_INFO   **pp_out;     /* the info found (out) */
    Xwr_WINDOW_INFO   **pp_parent;  /* eventually the parent of pp_out (in/out) */
{
    Xwr_WINDOW_INFO  *p_now;
    Boolean          found;

    if ( p_info->window_id == window_id ) {
        *pp_out = p_info;
        if ( p_info == p_hierarchy ) {
            *pp_parent = NULL;
        }
        return TRUE;
    }
    else {
        found = FALSE;
        p_now = p_info->p_child;
        while ( p_now != NULL && ! found ) {
            *pp_parent = p_info;
            found = search_id ( p_now, window_id, pp_out, pp_parent );
            p_now = p_now->p_next;
        }
        return found;
    }
}
