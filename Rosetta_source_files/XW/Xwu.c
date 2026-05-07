/*MPM:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Xwu: X windows utilities module
 *  Creation date   : 1991-05-02
 *  Author          : H. M. M. van de Schoot
 *
 *  Copyright (c) 1991, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         :
 *
 *EMP:::===================================================================*/

/*=========================================================================*
 *  Imported modules
 *=========================================================================*/

#include <X11/Intrinsic.h>
#include <X11/Xlib.h>
#include <Xs/libXs.h>
#include <Xm/Xm.h>
#include <Xm/ScrolledW.h>
#include <Xm/DialogS.h>
#include <Xm/SelectioBP.h>
#include <Mrm/MrmAppl.h>
#include "gendef.h"
#include <stdlib.h>
#include "Xwuil.h"
#include "Xwr.h"
#include "Xwu.h"


/* static variables */

static Widget   	Widgets [X_LAST];
static MrmHierarchy 	Mrm_id;
static Widget    	Top_window;
static Display  	*P_display;
static int              Create_offset = 0;

/* static functions */

static void  get_shell ();

/*=========================================================================*
 *  Exported function XwuInitialize
 *=========================================================================*/

void XwuInitialize (top_window, mrm_id)
    Widget  top_window;
    MrmHierarchy mrm_id;
{
    Top_window = top_window;
    P_display = XtDisplay(top_window);
    Mrm_id = mrm_id;
    Widgets[X_undefined] = NULL;

}		/* end of XwuInitialize */

/*=========================================================================*
 *  Exported function XwuWidget
 *=========================================================================*/

Widget XwuWidget (id)
    Xid id;
{
    return Widgets [id];

}		/* end of XwuWidget */


/*=========================================================================*
 *  Exported function XwuXid
 *=========================================================================*/

Xid  XwuXid (w)
    Widget  w;
{
    int     i;
    
    for ( i = 0; i < X_LAST; i++) {
        if ( Widgets[i] == w ) {
            return i;
        }
    }
    return X_undefined; 

}		/* end of XwuXid */

/*=========================================================================*
 *  Exported function XwuDisplay
 *=========================================================================*/

Display *XwuDisplay ()
{
    return P_display;

}		/* end of XwuDisplay */

/*=========================================================================*
 *  Exported function XwuGetLiteral
 *=========================================================================*/

caddr_t XwuGetLiteral (p_str)
    char *p_str;
{
    caddr_t value;
    MrmCode type;

    if ( MrmFetchLiteral (Mrm_id, p_str, XwuDisplay(),
                          &value, &type) != MrmSUCCESS ) {
        XwuError ("An error occurred while fetching a literal...");
        value = NULL;
    }
    return value;

}		/* end of XwuGetLiteral */

/*=========================================================================*
 *  Exported function XwuGetXstr
 *=========================================================================*/

char * XwuGetStr (id)
    Sid id;
{
    static Boolean strings_read = FALSE;
    static char **strings;
    MrmCode type;

    if (! strings_read) {
	strings_read = TRUE;
        if ( MrmFetchLiteral (Mrm_id, "Sid_strings", XwuDisplay(),
                              &strings, &type) != MrmSUCCESS ) {
            XwuError ("An error occurred while fetching a literal...");
        }
    }
    return *(strings + id);

}		/* end of XwuGetStr */


/*=========================================================================*
 *  Exported function XwuHelpDirName
 *=========================================================================*/

char * XwuHelpDirName ()
{
    static char dir_name [100] = '\0';
    char *p_help;

    if (dir_name [0] == '\0' ) {
        p_help = getenv ("RBS_ARCHIVE");
        if (p_help != NULL) {
            strcat (dir_name, p_help);
	    p_help = getenv ("RBS_RELEASE");
	    if (p_help != NULL) {
	        strcat (dir_name, p_help);
	        strcat (dir_name, "/");
	    }
        }
        strcat (dir_name, "help/");
    }
    return dir_name;

}		/* end of XwuHelpDirName */

/*=========================================================================*
 *  Exported function XwuError
 *=========================================================================*/

void XwuError (p_str)
    char *p_str;
{
    printf ("%s\n", p_str);

}		/* end of XwuError */

/*=========================================================================*
 *  Exported function XwuStrToXstr
 *=========================================================================*/

XmString XwuStrToXstr (p_str)
    char  *p_str;

{
    return XmStringCreateLtoR ( p_str, XmFALLBACK_CHARSET );

}		/* end of XwuStrToXstr */

/*=========================================================================*
 *  Exported function XwuStrToXstr
 *=========================================================================*/

char * XwuXstrToStr (xstr)
    XmString xstr;

{
    char *p_str;

    if ( XmStringGetLtoR (xstr, XmFALLBACK_CHARSET, &p_str)) {
        return p_str;
    }
    else {
        p_str = XtMalloc (sizeof(char));
        p_str[0] = '\0';
    }
}		/* end of XwuStrToXstr */

/*=========================================================================*
 *  Exported function XwuCreateWidget
 *=========================================================================*/

void XwuCreateWidget (w, p_tag, p_reason)
    Widget w;
    int    *p_tag;
    XmAnyCallbackStruct *p_reason;
{
    Xid   def_id;

    if ( *p_tag > DEFAULT_BUTTON_OFFSET ) {
        def_id = *p_tag / DEFAULT_BUTTON_OFFSET + Create_offset;
        *p_tag = *p_tag % DEFAULT_BUTTON_OFFSET + Create_offset;
        XwrAddDefaultButton ( *p_tag, def_id );
    }
    else {
        *p_tag = *p_tag + Create_offset;
    }

    Widgets [*p_tag] = w;

    if ( *p_tag == X_mw_window ) {
        XtVaSetValues ( XtParent(w), XmNminWidth, 390, XmNminHeight, 475, NULL);
    }
    if ( *p_tag == X_trees_window ) {
        XtVaSetValues ( XtParent(w), XmNminWidth, 555, XmNminHeight, 265, NULL);
    }
    if ( *p_tag == X_attr_window ) {
        XtVaSetValues ( XtParent(w), XmNminWidth, 350, XmNminHeight, 125, NULL);
    }
    if ( *p_tag == X_tree_window ) {
        XtVaSetValues ( XtParent(w), XmNminWidth, 555, XmNminHeight, 125, NULL);
    }
    if ( *p_tag == X_help_window ) {
        XtVaSetValues ( XtParent(w), XmNminWidth, 133, XmNminHeight, 125, NULL);
    }
    if ( *p_tag == X_dbg_window ) {
        XtVaSetValues ( XtParent(w), XmNminWidth, 353, XmNminHeight, 100, NULL);
    }
    if ( *p_tag == X_hn_window ) {
        XtVaSetValues ( XtParent(w), XmNminWidth, 250, XmNminHeight, 125, NULL);
    }

}		/* end of XwuCreateWidget */

/*=========================================================================*
 *  Exported function XwuManageWidget
 *=========================================================================*/

void XwuManageWidget (w, p_tag, p_reason)
    Widget w;
    int    *p_tag;
    XmAnyCallbackStruct *p_reason;
{
    XtManageChild (Widgets[*p_tag]);

}		/* end of XwuCreateWidget */

/*=========================================================================*
 *  Exported function XwuUnmanageWidget
 *=========================================================================*/

void XwuUnmanageWidget (w, p_tag, p_reason)
    Widget w;
    int    *p_tag;
    XmAnyCallbackStruct *p_reason;
{
    XtUnmanageChild (Widgets[*p_tag]);

}		/* end of XwuUnmanageWidget */


/*=========================================================================*
 *  Exported function XwuFetchWidget
 *=========================================================================*/

void XwuFetchWidget (id)
    Xid  id;
{
    int      screen_nr, simple_id;
    char     *p_name;
    MrmType  mrm_code;

    if ( Widgets[id] == NULL ) {
        if ( id >= SCREEN_START ) {
            XwuDecodeKey (id, &simple_id, &screen_nr);
            Create_offset = screen_nr * SCREEN_OFFSET;

            switch ( simple_id ) {
                case X_tree_window:
                    p_name = "tree_window";
                    break;
                case X_trees_window:
                    p_name = "trees_window";
                    break;
                case X_attr_window:
                    p_name = "attr_window";
                    break;
                case X_hn_window:
                    p_name = "hn_window";
                    break;
                default:
                    XwuError ( "wrong widget id to be fetched");
                    return;
            }
            MrmFetchWidget (Mrm_id, p_name, Top_window, &Widgets[id], &mrm_code);

            Create_offset = 0;
        }
        else {
            XwuError ("the non-dynamic widgets should all have been fetched");
        }
    }

}		/* end of XwuFetchWidget */

/*=========================================================================*
 *  Exported function XwuFitScrolledWindow
 *=========================================================================*/

void XwuFitScrolledWindow (tag, max_height, max_width, hor_only )
    Xid          tag;
    Dimension    max_height;
    Dimension    max_width;
    Boolean      hor_only;
{
    Widget       child_w, parent_w, bar, shell;
    Dimension    c_height, c_width, height, width, spacing, bar_height,
                 scr_wid, scr_hei, edge;
    Position     x, y;
    Xid          rtag;
    int          screen_nr;

    /* Make sure the scrolled window fits tightly around the child_w */

    child_w = XwuWidget (tag);
    XtVaGetValues ( child_w, XmNheight, &c_height, XmNwidth, &c_width, NULL);
    parent_w = XtParent (XtParent (child_w));
    if ( XmIsScrolledWindow (parent_w) ) {
        XtVaGetValues ( parent_w, XmNspacing, &spacing, NULL);
        height =  MIN(c_height+spacing, max_height);
        if ( hor_only ) {
            max_height = height;
        }
        width = MIN(c_width+spacing, max_width);
        if ( width == max_width ) {
            XtVaGetValues ( parent_w, XmNhorizontalScrollBar, &bar, NULL);
            XtVaGetValues ( bar, XmNheight, &bar_height, NULL);
            height = MIN(height+bar_height+2*spacing, max_height);
        }
        else if ( height == max_height ) {
            XtVaGetValues ( parent_w, XmNverticalScrollBar, &bar, NULL);
            XtVaGetValues ( bar, XmNwidth, &bar_height, NULL);
            width = MIN(width+bar_height+2*spacing, max_width);
        }
        if ( hor_only ) {
            XtVaSetValues (parent_w, XmNwidth, width, NULL);
        }
        else {
            XtVaSetValues (parent_w, XmNheight, height, XmNwidth, width, NULL);
        }
        get_shell ( parent_w, &shell);
        XtVaGetValues (shell, XmNx, &x, XmNy, &y, NULL);
        scr_wid =  XDisplayWidth (XwuDisplay(), XDefaultScreen(XwuDisplay())); 
        scr_hei =  XDisplayHeight(XwuDisplay(), XDefaultScreen(XwuDisplay())); 
        edge = SPACING + BORDER;
        if ( x + width + edge > scr_wid ) {
            XtVaSetValues (shell, XmNx, scr_wid - width - edge - SPACING, NULL);
        }
        edge = 2*SPACING + BORDER + BUTTON_HEIGHT;
        XwuDecodeKey (tag, &rtag, &screen_nr);
        if ( rtag == X_trees_area ) {
            edge += 2*SPACING + TREES_CHOICE_HEIGHT;
        }
        if ( ! hor_only && (y + height + edge > scr_hei) ) {
            XtVaSetValues (shell, XmNy, scr_hei - height - edge - SPACING, NULL);
        }
    }
}

void XwuWindowInfo ( tag, p_x, p_y, p_width, p_height )
    Xid       tag;
    Dimension *p_x;
    Dimension *p_y;
    Position  *p_width;
    Position  *p_height;
{
    Widget   w, shell;

    w = Widgets[tag];
    get_shell (w, &shell);
    XtVaGetValues ( shell, XmNx, p_x, XmNy, p_y,
                           XmNwidth, p_width, XmNheight, p_height, NULL);
}

void XwuDecodeKey ( key, p_simple_key, p_screen_nr )
    int   key;
    int   *p_simple_key;
    int   *p_screen_nr;
{
    if ( key >= SCREEN_START ) {
        *p_screen_nr = (key - SCREEN_START) / SCREEN_OFFSET;
        *p_simple_key = key - (*p_screen_nr) * SCREEN_OFFSET;
    }
    else {
        *p_screen_nr = 0;
        *p_simple_key = key;
    }
}

int XwuCodeKey ( simple_key, screen_nr )
    int  simple_key;
    int  screen_nr;
{
    return ( simple_key + screen_nr * SCREEN_OFFSET );
}

static void get_shell ( w, p_shell )
    Widget    w;
    Widget    *p_shell;
{
    *p_shell = w;
    while ( ! XmIsDialogShell(*p_shell) && ! XtIsApplicationShell(*p_shell) ) {
        *p_shell = XtParent(*p_shell);
    }
}
