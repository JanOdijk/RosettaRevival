/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Xwu.H
 *  Creation date   : 1991-05-01
 *  Author          : H. M. M. van de Schoot
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : X-Windows Utilities Module
 *
 *EMP:::===================================================================*/

#ifndef _XWU_H
#define _XWU_H

#include <X11/Intrinsic.h>
#include <Xm/Xm.h>

/* macro's for sizes */

#define BORDER                  10
#define BORDER_UP               28
#define SPACING                 10
#define BUTTON_HEIGHT           36
#define TREES_CHOICE_HEIGHT    118

#define ERR_OFFSET_X            89
#define ERR_OFFSET_Y           104

#define FILE_OFFSET_X           59
#define FILE_OFFSET_Y          127

#define HELP_WIDTH             625
#define HELP_HEIGHT            218


/* X context functions */

extern void FUNCDEF (
XwuInitialize, (Widget top_window, MrmHierarchy mrm_id));

extern Widget FUNCDEF (
XwuWidget, (Xid id));

extern Xid FUNCDEF (
XwuXid, (Widget w));

extern Display * FUNCDEF (
XwuDisplay, (void));

extern caddr_t FUNCDEF (
XwuGetLiteral, (char *p_str));

extern char * FUNCDEF (
XwuGetStr, (Sid id));

extern char * FUNCDEF (
XwuHelpDirName, (void));

/* error handling functions */

extern void FUNCDEF (
XwuError, (char  *p_str));

/* char * to XmString conversion and v.v. */

extern XmString FUNCDEF (
XwuStrToXstr, (char  *p_str));

extern char * FUNCDEF (
XwuXstrToStr, (XmString xstr));

/* common callback routines */

extern void FUNCDEF (
XwuCreateWidget, (Widget w, int *p_tag, XmAnyCallbackStruct *p_reason));

extern void FUNCDEF (
XwuManageWidget, (Widget w, int *p_tag, XmAnyCallbackStruct *p_reason));

extern void FUNCDEF (
XwuUnmanageWidget, (Widget w, int *p_tag, XmAnyCallbackStruct *p_reason));

extern void FUNCDEF (
XwuFetchWidget, (Xid id));

extern void FUNCDEF (
XwuFitScrolledWindow, (Xid tag, Dimension max_height,
                       Dimension max_width, Boolean hor_only));

extern void FUNCDEF (
XwuWindowInfo, (Xid tag, Dimension *p_x,    Dimension *p_y,
                        Position *p_width, Position *p_height ));

extern void FUNCDEF (
XwuDecodeKey, (int key, int *p_simple_key, int *p_screen_nr));

extern int FUNCDEF (
XwuCodeKey, (int simple_key, int screen_nr));

#endif _XWU_H
