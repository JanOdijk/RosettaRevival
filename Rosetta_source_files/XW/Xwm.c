/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Xwm.C
 *  Creation date   : 1991-05-02
 *  Author          : Y. van Dinther
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : X-Windows Message handler
 *
 *EMP:::===================================================================*/

#include <string.h>
#include <X11/Intrinsic.h>
#include <Xm/Xm.h>
#include <Xm/ToggleBG.h>
#include <Xm/Label.h>
#include <Xm/LabelG.h>
#include <Xm/Scale.h>
#include <Xm/Text.h>
#include <Xm/List.h>
#include <Xm/PushBG.h>
#include <Xm/Form.h>
#include <Xm/SelectioBP.h>
#include <Xm/MessageB.h>
#include "gendef.h"
#include "wch.h"
#include "Xwuil.h"
#include "Xwm.h"
#include "Xwl.h"
#include "Xwu.h"
#include "Xwb.h"
#include "Xwt.h"
#include "Xwd.h"
#include "Xwa.h"
#include "Xwr.h"
#include "wipc.h"
#include "Tree.h"
#include "Attr.h"
#include "sockipc.h"
#include "mb.h"


/* static variables */

#define MAX_RECEIVES		3

static WIPC Acc_id;
static XtInputId Acc_Xid;

static WIPC Rec_id [MAX_RECEIVES];

static XtAppContext Appl_context;

static void FUNCDEF (
Accept, (
    WIPC *p_data,
    int *p_id,
    XtInputId *p_xid));

static void FUNCDEF (
Receive, (
    WIPC *p_data,
    int *p_id,
    XtInputId *p_xid));

static Boolean FUNCDEF (
XYToPos, (char *s, int x, int y, Position *p_pos));

static Boolean FUNCDEF (
PosToXY, (char *s, Position pos, int *p_x, int *p_y));

static void FUNCDEF (
HandleSetString, (char *s, Xid tag));


void XwmInitialize ( appl_context, port_nr_str )
    XtAppContext appl_context;
    char *port_nr_str;
{
    MB_mbxid mbxxw;
    MB_communicationblock mail;
    /* define a Pascal like string; see paspar.h for format def */
    static struct { unsigned short len; char data [3]; } xw_name = {2, "Xw"};

    Appl_context = appl_context;
    SOCKIPC_set_port (atoi (port_nr_str), 1);
    MB_init (0, GLOBDEF_no);
    MB_open (xw_name, putaccess, &mbxxw);
    WIPC_bind (&Acc_id);
    mail.client = rosetta;
    mail.wndport = SOCKIPC_get_port (0);
    MB_put (mbxxw, &mail);
}


void XwmStartCommunication ()
{
    Acc_Xid = XtAppAddInput (Appl_context, WIPC_fileno (Acc_id),
                            XtInputReadMask, Accept, &Acc_id);
}


static void Accept (p_data, p_id, p_xid)
    WIPC *p_data;
    int *p_id;
    XtInputId *p_xid;
{
    int i;
    WIPC *p_rec_id;

    for (i = 0; i < MAX_RECEIVES; i++) {
        if (Rec_id[i] == NULL) {
	    p_rec_id = & Rec_id[i];
	    break;
	}
    }
    if (i == MAX_RECEIVES) {
        XwuError ("Receive channels exhausted");
    }
    else {
        WIPC_accept (Acc_id, p_rec_id);
        XtAppAddInput (Appl_context, WIPC_fileno (*p_rec_id),
                       XtInputReadMask, Receive, p_rec_id);
    }
    
}		/* end of accept */

static void Receive (p_data, p_id, p_xid)
    WIPC *p_data;
    int *p_id;
    XtInputId *p_xid;
{
    WCH_msg_id  message_id;

    if ( ! WCH_receive (*p_data)) {
        /* EOF or error */
        XtRemoveInput (*p_xid);
	WIPC_close (*p_data);
	*p_data = NULL;
	return;
    }
    else if ( ! WCH_get_message_id (&message_id)) {
        XwuError ("error receiving message");
	return;
    }

    switch ( message_id ) {
    case FETCH_MSG :
        {
            Xid   tag;

            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
            XwuFetchWidget (tag);
        }
        break;
    case MANAGE_MSG :
        {
            Xid   tag, parent_tag;
	    Widget w, wid;
	    unsigned char dialog_type;
            Position   x,y;
            static Boolean   first_dbg_manage = TRUE;

            if  ( ! WCH_get_id (&tag) ||
                  ! WCH_get_id (&parent_tag) ) {
                XwuError ("error getting data");
            }
	    w = XwuWidget (tag);
            if ( w == NULL ) {
                XwuError ("error managing not fetched widget");
            }

            if (XmIsMessageBox (w)) {
                XtUnmanageChild (XmMessageBoxGetChild (w, XmDIALOG_HELP_BUTTON));
		XtVaGetValues (w, XmNdialogType, &dialog_type, NULL);
		if (dialog_type == XmDIALOG_ERROR) {
                    XtUnmanageChild (XmMessageBoxGetChild (w, XmDIALOG_CANCEL_BUTTON));
                    XwbLastButtonPos (&x, &y);
                    XtVaSetValues (w, XmNx, x - ERR_OFFSET_X,
                                      XmNy, y - ERR_OFFSET_Y, NULL);
		}
		else if (dialog_type == XmDIALOG_QUESTION) {
                    XwbLastButtonPos (&x, &y);
                    XtVaSetValues (w, XmNx, x - FILE_OFFSET_X,
                                      XmNy, y - FILE_OFFSET_Y, NULL);
		}
            }

            if (tag == X_dbg_window && first_dbg_manage) {
                first_dbg_manage = FALSE;
                XwdSetPosition ();
            }

	    if (XmIsForm (XtParent (w))) {
	        XtMapWidget (w);
	    }
	    else if (parent_tag == -1) {
	        XtManageChild(w);
	    }
	    else {
                wid = XwuWidget (XwrGetDefaultButton (tag));
                if (wid != NULL) {
                    if ( ! XmProcessTraversal (wid, XmTRAVERSE_CURRENT) ) {
                        XwbSetTraversalWidget (wid);
                    }
                }
                else if ( XmIsSelectionBox (w) ) {
                    wid = XmSelectionBoxGetChild (w, XmDIALOG_TEXT);
                    XtVaSetValues ( w, XmNdefaultButton, wid, NULL);
                }
                if ( XwbCleanupKey () == X_undefined ) {
                    XtManageChild(w);
                }
                XwrAddHierarchy (tag, parent_tag);
            }
        }
        break;
    case UNMANAGE_MSG :
        {
            Xid   tag;
            Widget w;

            if  ( ! WCH_get_id (&tag)) {
                XwuError ("error getting data");
            }
	    w = XwuWidget (tag);
	    if (XmIsForm (XtParent (w))) {
	        XtUnmapWidget (w);
	    }
	    else {
                XtUnmanageChild(w);
                XwbRemoveKeys(tag);
                XwrRemoveHierarchy (tag);
	    }
        }
        break;
    case STOP_COMMUNICATION_MSG:
        {
	    XtRemoveInput (*p_xid);
	    WIPC_close (*p_data);
	    *p_data = NULL;
        }
        break;
    case STOP_TASK_MSG:
        {
	    int i;
	    
	    for (i = 0; i < MAX_RECEIVES; i++) {
	        if (Rec_id [i] != NULL) {
		    WIPC_close (Rec_id [i]);
		}
	    }
	    WIPC_close (Acc_id);
	    exit (0);
        }
        break;
    case GET_KEY_MSG :
        XwbHandleGetKey (*p_data);
        break;
    case SET_KEYS_MSG :
        XwbHandleSetKeys ();
        break;
    case UNSET_KEYS_MSG :
        XwbHandleUnsetKeys ();
        break;
    case SET_BOOLEAN_MSG :
        {
            Xid      tag;
            Boolean  val;
     
            if  ( ! WCH_get_id (&tag) ||
                  ! WCH_get_boolean (&val)) {
                XwuError ("error getting data");
            }
            XmToggleButtonGadgetSetState (XwuWidget(tag), val, TRUE);
        }
        break;
    case GET_BOOLEAN_MSG :
        {
            Xid      tag, ckey;
            Boolean  val;
	    Widget   w;
    
            if  ( ! WCH_get_id (&tag)) {
                XwuError ("error getting data");
            }
            w = XwuWidget (tag);
            if ( ! XmIsToggleButtonGadget (w) ) {
                XwuError("Wrong widget type, GET_BOOLEAN");
            }
            else {
                /* if EXIT, NEW or MODIFY was selected, the first phase
                   must be returned as the last active phase, so that analysis
                   or generation will stop
                */
                ckey = XwbCleanupKey ();
                if ( ckey == X_mw_new_button ||
                     ckey == X_mw_modify_button ||
                     ckey == X_mw_exit_button ) {
                    if ( tag == X_dbgset_last1_toggle ||
                         tag == X_dbgset_last2_toggle ||
                         tag == X_dbgset_last3_toggle ||
                         tag == X_dbgset_last4_toggle ||
                         tag == X_dbgset_last5_toggle ||
                         tag == X_dbgset_last6_toggle ||
                         tag == X_dbgset_last7_toggle ||
                         tag == X_dbgset_last8_toggle ) {
                        val = ( tag == X_dbgset_last1_toggle );
                    }
                }
                else {
                    val = XmToggleButtonGadgetGetState (w);
                }
                if ( ! WCH_put_message_id (SEND_BOOLEAN_MSG) ||
                     ! WCH_put_boolean (val) ||
                     ! WCH_send (*p_data) ) {
                    XwuError ("error sending data");
                }
            }
        }
        break;
    case SET_INTEGER_MSG :
        {
            Xid      tag, stag;
            int      int_val, mode, nr;
            char     str_val[INT_MAX_LENGTH + 1];
	    Widget   w;
     
            if  ( ! WCH_get_id (&tag) ||
                  ! WCH_get_integer (&int_val)) {
                XwuError ("error getting data");
            }
            
            w = XwuWidget (tag);
            sprintf (str_val, "%d", int_val);
            if ( XmIsLabelGadget (w) ) {
                HandleSetString ( str_val, tag);
            }
            else if ( XmIsScale (w) ) {
                XmScaleSetValue (w, int_val);
            }
            else if ( XmIsText (w) ) {
                XtVaGetValues (w, XmNeditMode, &mode, NULL);
                if ( mode == XmSINGLE_LINE_EDIT ) {
                    XmTextSetString (w, str_val);
                }
                else {
                    XwuError("Wrong widget type, SET_INTEGER");
                }
            }
            else {
                XwuError("Wrong widget type, SET_INTEGER");
            }

            /* Changing the value of either cardinality or arity should
               set the maximum of the scale. However, no valueChangedCallback
               is present for Labels, so this dependency is written down here !
           */
           XwuDecodeKey (tag, &stag, &nr);
           if ( stag == X_trees_card_text ) {
                XtVaSetValues ( XwuWidget(XwuCodeKey(X_trees_tuple_text, nr)),
                                XmNmaximum, MAX(int_val,2), NULL);
           }
           if ( stag == X_trees_arity_text ) {
                XtVaSetValues ( XwuWidget(XwuCodeKey(X_trees_stree_text, nr)),
                                XmNmaximum, MAX(int_val,2), NULL);
           }
        }
        break;
    case GET_INTEGER_MSG :
        {
            Xid        tag;
            int        int_val, mode;
            XmString   x_str_val;        
            char       *str_val;
            Boolean    int_found;
	    Widget   w;
    
            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
            int_found = FALSE;
            w = XwuWidget (tag);
            if ( XmIsLabelGadget (w) ) {
                XtVaGetValues (w, XmNlabelString,
                               &x_str_val, NULL);
                str_val = XwuXstrToStr (x_str_val);
            }
            else if ( XmIsScale (w) ) {
                XmScaleGetValue(w, &int_val);
                int_found = TRUE;
            }
            else if ( XmIsText (w) ) {
                XtVaGetValues (w, XmNeditMode, &mode, NULL);
                if ( mode == XmSINGLE_LINE_EDIT ) {
                    str_val = XmTextGetString (w);
                }
                else {
                    XwuError("Wrong widget type, GET_INTEGER");
                }
            }
            else {
                XwuError("Wrong widget type, GET_INTEGER");
            }
            if ( ! int_found ) {
                int_val = atoi (str_val);
            }
            if ( ! WCH_put_message_id (SEND_INTEGER_MSG) ||
                 ! WCH_put_integer (int_val) ||
                 ! WCH_send (*p_data) ) {
                XwuError("error sending data");
            }
        }
        break;
    case SET_STRING_MSG :
        {
            Xid      tag;
            char     *str_val;
     
            if  ( ! WCH_get_id (&tag) ||
                  ! WCH_get_string (&str_val)) {
                XwuError ("error getting data");
            }
            HandleSetString (str_val, tag);
        }
        break;
    case SET_STRING_ID_MSG :
        {
            Xid      tag;
            Sid      id;
     
            if  ( ! WCH_get_id (&tag) ||
                  ! WCH_get_id (&id)) {
                XwuError ("error getting data");
            }
            HandleSetString (XwuGetStr(id), tag);
        }
        break;
    case GET_STRING_MSG :
        {
            Xid       tag;
            char      *str_val;
            XmString  x_str_val;
            Widget    w;

            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
            w = XwuWidget (tag);
            if ( XmIsLabelGadget (w) || XmIsLabel (w) ) {
                XtVaGetValues (w, XmNlabelString, &x_str_val, NULL);
                str_val = XwuXstrToStr (x_str_val);
            }
            else if ( XmIsText (w) ) {
                str_val = XmTextGetString (w);
            }
            else if ( XmIsSelectionBox (w) ) {
                XtVaGetValues (w, XmNtextString, &x_str_val, NULL);
                str_val = XwuXstrToStr (x_str_val);
            }
            else {
                XwuError("Wrong widget type, GET_STRING");
            }
            if ( ! WCH_put_message_id (SEND_STRING_MSG) ||
                 ! WCH_put_string (str_val) ||
                 ! WCH_send (*p_data) ) {
                XwuError("error sending data");
            }
        }
        break;
    case SET_STRING_LIST_MSG :
        {
            Xid         tag;
            int         i;
            char        *str_val;
            XmString    x_str_arr[XWL_MAX_LIST_LENGTH];
	    Widget      w;
     
            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
            w = XwuWidget (tag);
            if ( !XmIsList (w) ) {
                XwuError("Wrong widget type, SET_STRING_LIST");
            }
            i = 0;
            while ( WCH_get_string (&str_val) ) {
                x_str_arr[i] = XwuStrToXstr (str_val);
                i++;
            }
            x_str_arr[i] = NULL;
            XtVaSetValues (w, XmNitemCount, i, XmNitems, x_str_arr,
                              XmNselectedItemCount, 0, XmNselectedItems, NULL, NULL);
        }
        break;
    case SET_STRING_LIST_SELECTED_MSG :
        {
            Xid         tag;
            int         i;
            char        *str_val;
            XmString    x_str_arr[XWL_MAX_LIST_LENGTH];
	    Widget      w;
     
            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
            w = XwuWidget (tag);
            if ( !XmIsList (w) ) {
                XwuError("Wrong widget type, SET_STRING_LIST");
            }
            i = 0;
            while ( WCH_get_string (&str_val) ) {
                x_str_arr[i] = XwuStrToXstr (str_val);
                i++;
            }
            x_str_arr[i] = NULL;
            XtVaSetValues (w, XmNselectedItemCount, i,
                              XmNselectedItems, x_str_arr, NULL);
        }
        break;
    case GET_STRING_LIST_MSG :
        {
            Xid         tag;
            int         i, count;
            char        *str_val;
            XmString    *x_str_arr;
	    Widget   w;
     
            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
            w = XwuWidget (tag);
            if ( !XmIsList (w) ) {
                XwuError("Wrong widget type, GET_STRING_LIST");
            }
            XtVaGetValues (w, XmNitems, &x_str_arr,
                                           XmNitemCount, &count, NULL);
            if ( ! WCH_put_message_id (SEND_STRING_LIST_MSG) ) {
                XwuError ("error sending data");
            }
            for ( i = 0; i < count; i++ ) {
                str_val = XwuXstrToStr (x_str_arr[i]);
                if ( ! WCH_put_string (str_val) ) {
                    XwuError ("error sending data");
                }
            }
            if ( ! WCH_send (*p_data) ) {
                XwuError ("error sending data");
            }
        }
        break;
    case GET_STRING_LIST_SELECTED_MSG :
        {
            Xid         tag;
            int         i, count;
            char        *str_val;
            XmString    *x_str_arr;
	    Widget   w;
     
            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
            w = XwuWidget (tag);
            if ( !XmIsList (w) ) {
                XwuError("Wrong widget type, GET_STRING_LIST_SELECTED");
            }
            XtVaGetValues (w, XmNselectedItems, &x_str_arr,
                                       XmNselectedItemCount, &count, NULL);
            if ( ! WCH_put_message_id (SEND_STRING_LIST_MSG) ) {
                XwuError ("error sending data");
            }
            for ( i = 0; i < count; i++ ) {
                str_val = XwuXstrToStr (x_str_arr[i]);
                if ( ! WCH_put_string (str_val) ) {
                    XwuError ("error sending data");
                }
            }
            if ( ! WCH_send (*p_data) ) {
                XwuError ("error sending data");
            }
        }
        break;
    case GET_SELECTED_POS_MSG :
        {
            Xid         tag;
            int         i, count;
            int         *p_pos_list;
            Widget   w;

            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
            w = XwuWidget (tag);
            if ( !XmIsList (w) ) {
                XwuError("Wrong widget type, GET_SELECTED_POS");
            }
            XmListGetSelectedPos (w, &p_pos_list, &count);

            if ( ! WCH_put_message_id (SEND_INTEGER_LIST_MSG) ) {
                XwuError ("error sending data");
            }
            for ( i = 0; i < count; i++ ) {
                if ( ! WCH_put_integer (p_pos_list[i]) ) {
                    XwuError ("error sending data");
                }
            }
            if ( ! WCH_send (*p_data) ) {
                XwuError ("error sending data");
            }
        }
        break;
    case READ_STRING_MSG :
        {
            Xid         tag;
            int         row;
            char        *p_str, *p_start;
	    Position    pos;
            Widget      w;

            if  ( ! WCH_get_id (&tag) ||
                  ! WCH_get_integer(&row)) {
                XwuError ("error getting data");
            }
            w = XwuWidget (tag);
            if ( XmIsText (w) ) {
                p_str = XmTextGetString (w);
		if (XYToPos (p_str, 1, row, &pos)) {
		    p_start = p_str + pos;
		    if (XYToPos (p_str, 1, row+1, &pos)) {
		        *(p_str+pos-1) = '\0'; 	/* terminate previous line */
		    }
		}
		else {
		    p_start = NULL;
		}
            }
            else {
                XwuError("Wrong widget type, READ_STRING");
		p_start = NULL;
            }
            if ( ! WCH_put_message_id (SEND_STRING_MSG) ||
                 ! WCH_put_string (p_start) ||
                 ! WCH_send (*p_data) ) {
                XwuError ("error sending data");
            }
        }
        break;

    case WRITE_STRING_MSG :
        {
            Xid         tag;
            char        *str_val;
	    Widget   w;
            XmTextPosition last_pos;

            if  ( ! WCH_get_id (&tag) ||
                  ! WCH_get_string (&str_val) ) {
                XwuError ("error getting data");
            }
            w = XwuWidget (tag);
            if ( XmIsText (w) ) {
                XmTextInsert (w,
                              XmTextGetInsertionPosition(w), 
                              str_val);
                if ( ! XwdOnHold () ) {
		    last_pos = XmTextGetLastPosition (w);
                    XmTextSetInsertionPosition (w, last_pos);
                }
            }
            else {
                XwuError("Wrong widget type, WRITE_STRING");
            }
        }
        break;
    case GET_X_POSITION_MSG :
        {
            Xid         tag;
	    Position    pos;
	    char       *p_str;
            int         x, y;
            Widget      w;

            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
	    w = XwuWidget (tag);
            if ( XmIsText (w) ) {
	        pos = XmTextGetInsertionPosition(w);
                p_str = XmTextGetString (w);
		PosToXY (p_str, pos, &x, &y);
            }
            else {
                XwuError("Wrong widget type, GET_X_POSITION");
            }
            if  ( ! WCH_put_message_id (SEND_INTEGER_MSG) ||
                  ! WCH_put_integer (x) ||
                  ! WCH_send (*p_data) ) {
                XwuError("error sending data");
            }
        }
        break;
    case GET_Y_POSITION_MSG :
        {
            Xid         tag;
	    Position    pos;
	    char       *p_str;
            int         x, y;
            Widget      w;

            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
	    w = XwuWidget (tag);
            if ( XmIsText (w) ) {
	        pos = XmTextGetInsertionPosition(w);
                p_str = XmTextGetString (w);
		PosToXY (p_str, pos, &x, &y);
            }
            else {
                XwuError("Wrong widget type, GET_Y_POSITION");
            }
            if  ( ! WCH_put_message_id (SEND_INTEGER_MSG) ||
                  ! WCH_put_integer (y) ||
                  ! WCH_send (*p_data) ) {
                XwuError("error sending data");
            }
        }
        break;
    case SET_POSITION_MSG :
        {
            Xid         tag;
            int         x, y;
	    Widget      w;
	    char       *p_str;
	    Position    pos;
     
            if  ( ! WCH_get_id (&tag) ||
                  ! WCH_get_integer (&x) ||
                  ! WCH_get_integer (&y) ) {
                XwuError ("error getting data");
            }
	    w = XwuWidget (tag);
            if ( XmIsText (w) ) {
                p_str = XmTextGetString (w);
		XYToPos (p_str, x, y, &pos);
                XmTextSetInsertionPosition (w, pos);
            }
            else {
                XwuError("Wrong widget type, SET_POSITION");
            }
        }
        break;
    case SET_INPUT_ALLOWED_MSG:
        {
            Xid         tag;
            Boolean     bool_val;
            int         width;
	    Widget   w;
     
            if  ( ! WCH_get_id (&tag) ||
                  ! WCH_get_boolean (&bool_val) ) {
                XwuError ("error getting data");
            }
            w = XwuWidget (tag);
            if ( XmIsText (w) ) {
                XmTextSetEditable(w, bool_val);
		if (bool_val) {
                    XmProcessTraversal (w, XmTRAVERSE_CURRENT);
		}
		else {
		    char *p_str;
		    int l;
		    p_str = XmTextGetString (w);
		    if ((l = strlen (p_str)) > 0 && *(p_str + l - 1) != ' ') {
		        XmTextInsert (w, l, " ");
		    }
		    XtFree (p_str);
		}
            }
            else if ( XmIsPushButtonGadget (w) ) {
                XtSetSensitive (w, bool_val);
            }
            else if ( XmIsScale (w) ) {
                XtSetSensitive (w, bool_val);
                width = ( bool_val ? 1 : 0 );
                XtVaSetValues ( w, XmNborderWidth, width, NULL);
            }     
        }
        break;
    case CLEAR_MSG :
        {
            Xid         tag;
            Widget      w;

            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
            w = XwuWidget (tag);
            if ( XmIsText (w) ) {
                XmTextSetString(w, "");
            }
            else if ( XmIsList (w) ) {
                XmListDeleteAllItems(w);
            }
            else if ( XmIsLabelGadget (w) || XmIsLabel (w) ) {
                XtVaSetValues (w, XmNlabelString, XwuStrToXstr(""), NULL);
            }
            else if ( XmIsSelectionBox (w) ) {
                 XtVaSetValues (w, XmNtextString, XwuStrToXstr(""), NULL);
            }
            else {
                XwuError("Wrong widget type, CLEAR");
            }
        }
        break;
    case DESTROY_TREE_MSG :
        {
            Xid         tag;

            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
            XwtDestroyTree (tag);
        }
        break;
    case START_TREE_MSG :
        {
            Xid         tag;
     
            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
            XwtStartTree (tag);
        }
        break;
    case END_TREE_MSG :
        {
            Xid         tag;
     
            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
            XwtEndTree (tag);
        }
        break;
    case SET_NODE_MSG :
        {
            Xid         node_tag, parent_tag;
            char        *p_label1, *p_label2;
     
            if  ( ! WCH_get_id (&node_tag) ||
                  ! WCH_get_id (&parent_tag) ||
                  ! WCH_get_string (&p_label1) ||
                  ! WCH_get_string (&p_label2) ) {
                XwuError ("error getting data");
            }
            XwtSetNode (node_tag, parent_tag, p_label1, p_label2);
        }
        break;
    case GET_NODE_SELECTED_MSG :
        {
            Xid         tag, node;
     
            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
            node = XwtGetNode (tag);
            if ( ! WCH_put_message_id (SEND_ID_MSG) ||
                 ! WCH_put_id (node) ||
                 ! WCH_send (*p_data) ) {
                XwuError("error sending data");
            }
        }
        break;
    case DESTROY_ATTR_MSG :
        {
            Xid         tag;

            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
            XwaDestroyAttr (tag);
        }
        break;
    case START_ATTR_MSG :
        {
            Xid         tag;
     
            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
            XwaStartAttr (tag);
        }
        break;
    case END_ATTR_MSG :
        {
            Xid         tag;
     
            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
            XwaEndAttr (tag);
        }
        break;
    case SET_ATTR_MSG :
        XwaSetAttr();
        break;
    case GET_ATTR_CHANGED_MSG :
        XwaGetAttrChanged ();
	break;
    case GET_ATTR_SELECTED_MSG :
        {
            Xid         tag, attr;
     
            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
            attr = XwaGetAttr (tag);
            if ( ! WCH_put_message_id (SEND_ID_MSG) ||
                 ! WCH_put_id (attr) ||
                 ! WCH_send (*p_data) ) {
                XwuError("error sending data");
            }
        }
        break;
    case GET_ATTR_VALUES_MSG :
        {
            Xid         tag;
            char        *attr_val;
     
            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
            XwaHandleAttrVal (tag);
            if ( ! WCH_send (*p_data) ) {
                XwuError("error sending data");
            }
        }
        break;
    case RING_BELL_MSG :
        XBell (XwuDisplay(), 100);
        break;
    case SET_VIDEO_ATTR_MSG :
        {
            Xid               tag;
            WCH_vt_id         video_type;
            int               row, col, n_rows, n_cols;
	    Position          start, end;
	    char             *p_str;
            XmHighlightMode   mode;
            Widget            w;
	    int               i;

            if  ( ! WCH_get_id (&tag) ||
                  ! WCH_get_integer(&col) ||
                  ! WCH_get_integer(&row) ||
                  ! WCH_get_integer(&n_cols) ||
                  ! WCH_get_integer(&n_rows) ||
                  ! WCH_get_id (&video_type) ) {
                XwuError ("error getting data");
            }
            w = XwuWidget (tag);
            if ( XmIsText (w) ) {
                p_str = XmTextGetString (w);
		for (i = 0; i < n_rows; i++) {
                    XYToPos (p_str, col, row + i, &start);
                    XYToPos (p_str, col+n_cols, row + i, &end);
                    switch ( video_type ) {
                    case NORMAL_VT:
    		        mode = XmHIGHLIGHT_NORMAL; 
    		    break;
                        case INVERSE_VT:
    		        mode = XmHIGHLIGHT_SELECTED; 
    		    break;
                        case UNDERLINE_VT:
    		        mode = XmHIGHLIGHT_SECONDARY_SELECTED;
                        break;
                    case INV_UND_VT:
    		        mode = XmHIGHLIGHT_SELECTED; 
                        XmTextSetHighlight (w, start, end, mode);
                        mode = XmHIGHLIGHT_SECONDARY_SELECTED;
                        break;
                    }
                    XmTextSetHighlight (w, start, end, mode);
		}
            }
            else {
                XwuError("Wrong widget type, SET_VIDEO_ATTR");
            }
        }
        break;
    case TOGGLE_ATTENTION_MSG :
        {
            Xid               tag;
	    Widget   w;

            if  ( ! WCH_get_id (&tag) ) {
                XwuError ("error getting data");
            }
            w = XwuWidget (tag);
            if (XmIsLabel (w)) {
                xs_invert_widget (w);
            }
            else {
                XwuError("Wrong widget type, TOGGLE_ATTENTION");
            }
        }
        break;
    default:
        XwuError("Wrong message_id");
        break;
    }
}        		/* end of Receive */


static Boolean XYToPos (s, x, y, p_pos)
    char *s;
    int x;
    int y;
    Position *p_pos;
/*
search (x, y) position in string s; the first char has position 0
the first char is (1,1); every \n increments the y position and resets the x to 1,
every other character increments x

if x <= 0 or y <= 0 then return FALSE
if y > number of lines in s then return FALSE
if y <= number of lines in s and x > number of chars in line y 
  then return FALSE
  else set *p_pos to position of char (x,y)
       return TRUE
*/
{
    char *p_s;
    int i;

    if (x <= 0 || y <= 0) {
        return FALSE;
    }

    p_s = s;
    for (i = 1; i < y; i++) {
	p_s = strchr (p_s, '\n');
	if (p_s == NULL) {		/* y larger then no. of lines in s */
	    return NULL;
	}
	p_s++;				/* advance over \n */
    }
    for (i = 1; i < x; i++, p_s++) {
        if (*p_s == '\n' || *p_s == '\0') {
	    return FALSE;		/* x larger then no. of chars in line y */
        }
    }
    *p_pos = p_s - s;
    return TRUE;

}			/* end of XYToPos */


static Boolean PosToXY (s, pos, p_x, p_y)
    char *s;
    Position pos;
    int *p_x;
    int *p_y;
/*
  set *p_x and *p_y to the coordinates of the pos'th char in s
  the first char in s has position 0 and coordinates (1,1)

  if pos < 0 or pos >= strlen (s) then return FALSE
  else set *p_x and *p_y
       return TRUE
*/
{
    char *p_s;
    int i;
    int x, y;

    if (pos < 0 || pos >= strlen (s)) {
        return FALSE;
    }

    p_s = s;
    x = y = 1;
    for (i = 0; i < pos; i++, p_s++) {
        if (*p_s == '\n') {
	    y++;
	    x = 1;
        }
	else {
	    x++;
	}
    }
    *p_x = x;
    *p_y = y;
    return TRUE;

}			/* end of PosToXY */


static void HandleSetString (s, tag)
    char    *s;
    Xid     tag;
{
    Widget   w;
    XmString old_x_str;
    char *p_old_str;
    Boolean change;

    w = XwuWidget (tag);

    if ( XmIsLabelGadget (w) || XmIsLabel (w) ) {
        XtVaGetValues (w, XmNlabelString, &old_x_str, NULL);
        p_old_str = XwuXstrToStr (old_x_str);
        change = strlen (p_old_str) != strlen (s);
	XtFree (p_old_str);
        if (change) XtUnmanageChild (w);
        XtVaSetValues (w, XmNlabelString, XwuStrToXstr(s), NULL);
        if (change) XtManageChild (w);
    }
    else if ( XmIsText (w) ) {
        XmTextSetString (w, s);
    }
    else if ( XmIsSelectionBox (w) ) {
        XtVaSetValues (w, XmNtextString, XwuStrToXstr(s), NULL);
    }
    else if ( XmIsMessageBox (w) ) {
        XtVaSetValues (w, XmNmessageString, XwuStrToXstr(s), NULL);
    }
    else {
        XwuError("Wrong widget type, SET_STRING, HandleSetString");
    }
}                      /* end of HandleSetString */
