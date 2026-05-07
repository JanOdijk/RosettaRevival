/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Xwd.c
 *  Creation date   : 1991-05-01
 *  Author          : Y. van Dinther
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : X-Windows Debug handling routines
 *
 *EMP:::===================================================================*/

#include <X11/Intrinsic.h>
#include <Xm/Xm.h>
#include <Xm/Text.h>
#include "gendef.h"
#include "Xwuil.h"
#include "Xwb.h"
#include "Xwu.h"
#include "Xwd.h"
#include "Xwm.h"

static Boolean On_hold = FALSE;
static Boolean In_dbg_file = FALSE;
static char    *Hold_button_name;
static char    *Release_button_name;
static char    *Ok_button_name;
static char    *Stop_button_name;



static Boolean dbgset_debug_arr[] = 
       { FALSE , FALSE, FALSE, FALSE , FALSE , FALSE, FALSE, FALSE };
static Boolean dbgset_print_arr[] =
       { FALSE , FALSE, FALSE, FALSE , FALSE , FALSE, FALSE, FALSE };
static Boolean dbgset_interact_arr[] = 
       { TRUE  , FALSE, FALSE, TRUE  , FALSE , FALSE, FALSE, FALSE };
static int     dbgset_last_id =  X_dbgset_last8_toggle;

static void reset_dbg_values ();


void XwdInitialize ()
{
    int        temp_id, i;
    Boolean    found;

    Hold_button_name    = (char *) XwuGetLiteral("N_dbg_hold_button");
    Release_button_name = (char *) XwuGetLiteral("N_dbg_release_button");
    Ok_button_name      = (char *) XwuGetLiteral("N_dbg_ok_button");
    Stop_button_name    = (char *) XwuGetLiteral("N_dbg_stop_button");

    found = FALSE;
    for ( i = 0; i < 8; i++ ) {
        switch (i) {
            case 0:    temp_id = X_dbgset_last1_toggle; break;
            case 1:    temp_id = X_dbgset_last2_toggle; break;
            case 2:    temp_id = X_dbgset_last3_toggle; break;
            case 3:    temp_id = X_dbgset_last4_toggle; break;
            case 4:    temp_id = X_dbgset_last5_toggle; break;
            case 5:    temp_id = X_dbgset_last6_toggle; break;
            case 6:    temp_id = X_dbgset_last7_toggle; break;
            case 7:    temp_id = X_dbgset_last8_toggle; break;
        }
        if ( XmToggleButtonGadgetGetState(XwuWidget(temp_id)) ) {
            if ( found ) {
                XmToggleButtonGadgetSetState(XwuWidget(temp_id), FALSE, TRUE);
            }
            else {
                found = TRUE;
            }
        }
    }

    if ( ! found && dbgset_last_id != X_undefined ) {
        XmToggleButtonGadgetSetState(XwuWidget(dbgset_last_id), TRUE, TRUE);
    }
}

void XwdAction (w, p_tag, p_reason)
    Widget w;
    Xid    *p_tag;
    XmAnyCallbackStruct *p_reason;
{
    Widget    wid;
    XmString  x_str_val;
    char      *p_str_val;
    FILE      *p_file;
    Position  x, y;

    switch ( *p_tag) {
    case X_dbgset_reset_button:
        reset_dbg_values();
        break;
    case X_dbg_hold_button:
        if ( On_hold ) {
            On_hold = FALSE;
            XmTextSetInsertionPosition (XwuWidget(X_dbg_area), 
                                        XmTextGetLastPosition(XwuWidget(X_dbg_area)));
            XtVaSetValues (XwuWidget(*p_tag), XmNlabelString, 
                           XwuStrToXstr(Hold_button_name), NULL);
        }
        else {
            On_hold = TRUE;
            XtVaSetValues (XwuWidget(*p_tag), XmNlabelString, 
                           XwuStrToXstr(Release_button_name), NULL);
        }
        break;
    case X_dbg_tofile_button:
        wid = XwuWidget (X_file_window);
        XtUnmanageChild (XmSelectionBoxGetChild (wid, XmDIALOG_HELP_BUTTON));
        x = p_reason->event->xbutton.x_root;
        y = p_reason->event->xbutton.y_root;
        XtVaSetValues (wid, XmNtextString, XwuStrToXstr(""),
                       XmNx, x - FILE_OFFSET_X, XmNy, y - FILE_OFFSET_Y, NULL);
        XtManageChild(wid);
        In_dbg_file = TRUE;        
        break;
    case X_file_cancel_button:
        In_dbg_file = FALSE;
        XtUnmanageChild (XwuWidget(X_file_window));
        break;
    case X_file_ok_button:
        XtVaGetValues (XwuWidget(X_file_window), XmNtextString, &x_str_val, NULL);
        p_str_val = XwuXstrToStr (x_str_val);
        if ( p_str_val[0] == '\0' ) {
            XBell (XwuDisplay(), 100);
        }
        else {
            if ( (p_file = fopen(p_str_val, "w")) == NULL ) {
               XwuError ("cannot open file for debug window");
            }
            else {
                fputs (XmTextGetString (XwuWidget(X_dbg_area)), p_file);
            }
            if ( fclose(p_file) != NULL ) {
               XwuError ("cannot close file for debug window");
            }
            In_dbg_file = FALSE;
            XtUnmanageChild (XwuWidget(X_file_window));
        }
        break;
    }
}

Boolean XwdOnHold ()
{
    return On_hold;
}

Boolean XwdInFile ()
{
    return In_dbg_file;
}

void XwdSetOkButton (on)
    Boolean   on;
{
    if ( on ) {
        XtVaSetValues (XwuWidget(X_dbg_ok_button), XmNlabelString, 
                       XwuStrToXstr(Ok_button_name), NULL);
    }
    else {
        XtVaSetValues (XwuWidget(X_dbg_ok_button), XmNlabelString, 
                       XwuStrToXstr(Stop_button_name), NULL);
    }
}

void XwdSetPosition ()
{
    int  screen_width, screen_height;
    Position   x,y;
    Dimension  width, height;

    screen_width  = XDisplayWidth  ( XwuDisplay(), XDefaultScreen(XwuDisplay()));
    screen_height = XDisplayHeight ( XwuDisplay(), XDefaultScreen(XwuDisplay()));

    XwuWindowInfo ( X_mw_window, &x, &y, &width, &height);
    if ( x + width/2 > screen_width/2 ) {
        x = 0;
    }
    else {
        x = screen_width;
    }
    if ( y + height/2 > screen_height/2 ) {
        y = 0;
    }
    else {
        y = screen_height;
    }
    XtVaSetValues ( XwuWidget(X_dbg_window), XmNx, x, XmNy, y, NULL);
}

static void reset_dbg_values ()
{
    int      temp_id, i;

    for ( i = 0; i < 8; i++ ) {
        switch (i) {
            case 0:    temp_id = X_dbgset_debug1_toggle; break;
            case 1:    temp_id = X_dbgset_debug2_toggle; break;
            case 2:    temp_id = X_dbgset_debug3_toggle; break;
            case 3:    temp_id = X_dbgset_debug4_toggle; break;
            case 4:    temp_id = X_dbgset_debug5_toggle; break;
            case 5:    temp_id = X_dbgset_debug6_toggle; break;
            case 6:    temp_id = X_dbgset_debug7_toggle; break;
            case 7:    temp_id = X_dbgset_debug8_toggle; break;
        }
        XmToggleButtonGadgetSetState(XwuWidget(temp_id), dbgset_debug_arr[i], TRUE);
    }

    for ( i = 0; i < 8; i++ ) {
        switch (i) {
            case 0:    temp_id = X_dbgset_print1_toggle; break;
            case 1:    temp_id = X_dbgset_print2_toggle; break;
            case 2:    temp_id = X_dbgset_print3_toggle; break;
            case 3:    temp_id = X_dbgset_print4_toggle; break;
            case 4:    temp_id = X_dbgset_print5_toggle; break;
            case 5:    temp_id = X_dbgset_print6_toggle; break;
            case 6:    temp_id = X_dbgset_print7_toggle; break;
            case 7:    temp_id = X_dbgset_print8_toggle; break;
        }
        XmToggleButtonGadgetSetState(XwuWidget(temp_id), dbgset_print_arr[i], TRUE);
    }

    for ( i = 0; i < 8; i++ ) {
        switch (i) {
            case 0:    temp_id = X_dbgset_interact1_toggle; break;
            case 1:    temp_id = X_dbgset_interact2_toggle; break;
            case 2:    temp_id = X_dbgset_interact3_toggle; break;
            case 3:    temp_id = X_dbgset_interact4_toggle; break;
            case 4:    temp_id = X_dbgset_interact5_toggle; break;
            case 5:    temp_id = X_dbgset_interact6_toggle; break;
            case 6:    temp_id = X_dbgset_interact7_toggle; break;
            case 7:    temp_id = X_dbgset_interact8_toggle; break;
        }
        XmToggleButtonGadgetSetState(XwuWidget(temp_id), dbgset_interact_arr[i], TRUE);
    }

    if ( dbgset_last_id != X_undefined ) {
        XmToggleButtonGadgetSetState(XwuWidget(dbgset_last_id), TRUE, TRUE);
    }
}
