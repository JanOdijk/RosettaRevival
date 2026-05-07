/*MPM:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Xw: X windows userinterface program
 *  Creation date   : 1991-05-01
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

/*#include <fcntl.h>*/
/*#include <sys/types.h>*/
/*#include <sys/stat.h>*/
/*#include <ctype.h>*/
#include <Mrm/MrmAppl.h>

#include <X11/Intrinsic.h>
#include <X11/Xlib.h>
#include <Xm/Xm.h>
#include "gendef.h"
#include "logc.h"
#include "Xwuil.h"
#include "Xwa.h"
#include "Xwd.h"
#include "Xwb.h"
#include "Xwh.h"
#include "Xwl.h"
#include "Xwm.h"
#include "Xwr.h"
#include "Xwt.h"
#include "Xwu.h"

#define N_FUNCTIONS      9	/* no. of callback functions listed below */
#define N_RESOURCES      5

static MRMRegisterArg   Mrm_functions [N_FUNCTIONS + N_RESOURCES] = {
  {"XwuCreateWidget",   (caddr_t) XwuCreateWidget },
  {"XwuManageWidget",   (caddr_t) XwuManageWidget },
  {"XwuUnmanageWidget", (caddr_t) XwuUnmanageWidget },
  {"XwaAction",         (caddr_t) XwaAction },
  {"XwbAction",         (caddr_t) XwbAction },
  {"XwdAction",         (caddr_t) XwdAction },
  {"XwhAction",         (caddr_t) XwhAction },
  {"XwlAction",         (caddr_t) XwlAction },
  {"XwtAction",         (caddr_t) XwtAction },
};

/* forward declaration of static functions */

static void Set_fonts ();
static void Wait_for_expose ();


/*=========================================================================*
 *  main function
 *=========================================================================*/

main(argc, argv)
    int argc;
    char *argv[];
{
#define VERSION    	" Rosetta 3 "
#define CLASS_NAME 	"RosWin"

#define TOP_WINDOW	    "mw_window"
#define STARTUP_WINDOW      "startup_window"

#define UID_PATH            "windows.uid"

static char           *mrm_vec[] = { UID_PATH };

    MrmHierarchy    mrm_id;
    MrmCode         mrm_code;
    XtAppContext    appl_context;
    Widget          top_level;
    Widget          top_window;
    Widget          startup_level;

    MrmInitialize();

    top_window = XtVaAppInitialize (&appl_context, CLASS_NAME, NULL, 0, 
                     &argc, argv, NULL, XmNtitle, VERSION, NULL);
    XwmInitialize (appl_context, argv [1]);
    if (MrmOpenHierarchy(XtNumber(mrm_vec), mrm_vec, NULL, &mrm_id)
            != MrmSUCCESS) {
        XwuError ("can't open hierarchy");
    }

    XwuInitialize (top_window, mrm_id);
    XwtInitialize ();
    XwaInitialize ();
    XwrInitialize (X_mw_window);
    Set_fonts ();

    MrmRegisterNames(Mrm_functions, XtNumber(Mrm_functions));

    if (MrmFetchWidget(mrm_id, STARTUP_WINDOW, top_window, 
             &startup_level, &mrm_code) != MrmSUCCESS) {
        XwuError ("Can't fetch startup_window");
    }

    XtManageChild (startup_level);

    Wait_for_expose (startup_level);

    if (MrmFetchWidget(mrm_id, TOP_WINDOW, top_window, 
         &top_level, &mrm_code) != MrmSUCCESS) {
        XwuError ("Can't fetch main_window");
    }
    XtManageChild (top_level);
    XtRealizeWidget (top_window);

/*	The next call must come after XtManageChild:
 *	otherwise request for changing widgets may come in before
 *	the widget pointer is registered
*/
    XwlInitialize ();
    XwmStartCommunication ();
    XwdInitialize ();
    
    XtUnmanageChild (startup_level);

    XtAppMainLoop (appl_context);

}			/* end of main */


/*=========================================================================*
 *  Static function Wait_for_expose
 *=========================================================================*/

static void Wait_for_expose (widget)
    Widget widget;
{
  XEvent event;
  Display *display = XtDisplay(widget);

  while (!XCheckTypedWindowEvent(display, XtWindow(widget), Expose, &event)) ;
  XtDispatchEvent(&event);
  XFlush(display);

}		/* end of Wait_for_expose */


/*=========================================================================*
 *  Static function Set_fonts
 *=========================================================================*/

static void Set_fonts ()
{

#define RESOURCE_SMALL 	    "small"
#define RESOURCE_NORMAL	    "normal"
#define RESOURCE_BOLD	    "bold"
#define RESOURCE_BIG	    "big"
#define RESOURCE_BIGBOLD    "bigbold"

    static XmFontList small_font_list;
    static XmFontList normal_font_list;
    static XmFontList bold_font_list;
    static XmFontList big_font_list;
    static XmFontList bigbold_font_list;

    char *p_string;
    int i = N_FUNCTIONS;

    p_string = XGetDefault (XwuDisplay (), CLASS_NAME, RESOURCE_SMALL);
    small_font_list = XmFontListCreate (
        XLoadQueryFont (XwuDisplay (), p_string), XmFALLBACK_CHARSET);
    Mrm_functions[i].name  = RESOURCE_SMALL;
    Mrm_functions[i].value = (caddr_t) small_font_list;
    i++;

    p_string = XGetDefault (XwuDisplay (), CLASS_NAME, RESOURCE_NORMAL);
    normal_font_list = XmFontListCreate (
        XLoadQueryFont (XwuDisplay (), p_string), XmFALLBACK_CHARSET);
    Mrm_functions[i].name  = RESOURCE_NORMAL;
    Mrm_functions[i].value = (caddr_t) normal_font_list;
    i++;

    p_string = XGetDefault (XwuDisplay (), CLASS_NAME, RESOURCE_BOLD);
    bold_font_list = XmFontListCreate (
        XLoadQueryFont (XwuDisplay (), p_string), XmFALLBACK_CHARSET);
    Mrm_functions[i].name  = RESOURCE_BOLD;
    Mrm_functions[i].value = (caddr_t) bold_font_list;
    i++;

    p_string = XGetDefault (XwuDisplay (), CLASS_NAME, RESOURCE_BIG);
    big_font_list = XmFontListCreate (
        XLoadQueryFont (XwuDisplay (), p_string), XmFALLBACK_CHARSET);
    Mrm_functions[i].name  = RESOURCE_BIG;
    Mrm_functions[i].value = (caddr_t) big_font_list;
    i++;

    p_string = XGetDefault (XwuDisplay (), CLASS_NAME, RESOURCE_BIGBOLD);
    bigbold_font_list = XmFontListCreate (
        XLoadQueryFont (XwuDisplay (), p_string), XmFALLBACK_CHARSET);
    Mrm_functions[i].name  = RESOURCE_BIGBOLD;
    Mrm_functions[i].value = (caddr_t) bigbold_font_list;

}		/* end of Set_fonts */

