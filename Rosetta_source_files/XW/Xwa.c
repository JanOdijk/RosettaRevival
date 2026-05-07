/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Xwa.c
 *  Creation date   : 1991-05-06
 *  Author          : Y. van Dinther
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : X-Windows Attribute Module
 *
 *EMP:::===================================================================*/

#include <X11/Intrinsic.h>
#include <Xm/Xm.h>
#include <Mrm/MrmAppl.h>
#include <Xm/Label.h>
#include <Xm/Text.h>
#include "gendef.h"
#include "Xwuil.h"
#include "Xwa.h"
#include "Xwu.h"
#include "wch.h"
#include "Attr.h"
#include "AttrP.h"

static Widget  Attr_widget = NULL;

static Widget  create_attr ();
static void    set_current_attr ();
static void    set_changed_attr ();
static void    adapt_string ();
static Widget  get_attr_widget ();
static Widget  search_attr_in_widget ();

void XwaAction (w, p_tag, p_reason)
    Widget              w;
    int                 *p_tag;
    XmAnyCallbackStruct *p_reason;
{

}

void XwaInitialize ()
{
    if (MrmRegisterClass (MrmwcUnknown, "Attr", "AttrCreate",
            create_attr, &XwattrWidgetClass) != MrmSUCCESS) {
        XwuError ("can't register Attr widget");
    }
}

void XwaDestroyAttr (tag)
    Xid     tag;
{
    Widget            attr_area;
    WidgetList        list;
    Cardinal          number;
    int               i;

    attr_area = XwuWidget (tag);
    if ( attr_area != NULL ) {
	XtUnmanageChild (attr_area);
        XtVaGetValues (attr_area, XmNchildren, &list, XmNnumChildren, &number, NULL);
        for ( i = number - 1; i >= 0; i-- ) {
            XtDestroyWidget (list[i]);
        }
        ((XwAttrWidget) attr_area)->attr.last_label = NULL;
	XtManageChild (attr_area);
    }
}

void XwaStartAttr (tag)
    Xid     tag;
{
    XwaDestroyAttr (tag);
    Attr_widget = XwuWidget (tag);
    ((XwAttrWidget) Attr_widget)->attr.chosen_attr = X_undefined;
}

void XwaSetAttr ()
{
    Xid      attr_tag;
    char     *p_label;
    Boolean  complex, editable;
    char     *p_text;
    Widget   label, text;
    Arg      wargs [7];
    int      i, n, nr_lines, max_width;
    char     result[300];

    if  ( ! WCH_get_id (&attr_tag) ||
          ! WCH_get_string (&p_label) ||
          ! WCH_get_boolean (&complex) ||
          ! WCH_get_boolean (&editable) ) {
        XwuError ("error getting data");
    }

   i = 0;
    max_width = 1;
    nr_lines = 0;
    while ( WCH_get_string (&p_text) ) {
        strncpy ( result + i, p_text, strlen(p_text));
        i += strlen(p_text);
        result[i] = '\n';
        i++;
        max_width = MAX (max_width, strlen(p_text));
        nr_lines++;
    }
    if ( i == 0 ) {
        result[i] = '\0';
        nr_lines = 1;
    }
    else {
        /* delete the last \n : */
        result[i-1] = '\0';
    }

    n = 0;
    XtSetArg(wargs[n], XmNlabelString, XwuStrToXstr (p_label));
    n++;
    label = XmCreateLabel (Attr_widget, "attr_label", wargs, n);

    /* Only the label widget has to be referenced ! */
    ((AttrConstraints)(label->core.constraints))->attr.attr_id = attr_tag;

    n = 0;
/*
    adapt_string(p_text, result, &nr_lines, &max_width);
*/
    if ( complex || nr_lines > 1 ) {
        XtSetArg ( wargs[n], XmNeditMode, XmMULTI_LINE_EDIT );
        n++;
        XtSetArg ( wargs[n], XmNrows, nr_lines );
        n++;
        XtSetArg ( wargs[n], XmNresizeHeight, TRUE );
        n++;
    }
    XtSetArg ( wargs[n], XmNcolumns, max_width );
    n++;
    XtSetArg( wargs[n], XmNvalue, result );
    n++;
    XtSetArg ( wargs[n], XmNeditable, editable );
    n++;
    XtSetArg ( wargs[n], XmNmarginHeight, 1);
    n++;
    text = XmCreateText (Attr_widget, "attr_text", wargs, n);

    XtVaSetValues ( label, XtNassociate, text , NULL);
    XtAddCallback ( text, XmNmotionVerifyCallback, set_current_attr, NULL );
    if ( editable ) {
        XtAddCallback ( text, XmNmodifyVerifyCallback, set_changed_attr, NULL );
    }
    XtManageChild (label);

/*  text cannot be managed yet, this is done after the width has been set in Attr.c
*/
}

void XwaEndAttr (tag)
    Xid     tag;
{
    Widget   w;

    w = XwuWidget (tag);    
    XtManageChild (w);
    XtVaSetValues (w, XtNrecompute, TRUE, NULL);
    XwuFitScrolledWindow (tag, 400, 550, FALSE);
}

Xid XwaGetAttr (tag)
    Xid     tag;
{
    XwAttrWidget   attr_area;

    attr_area = (XwAttrWidget) XwuWidget (tag);
    return attr_area->attr.chosen_attr;
}

void   XwaGetAttrChanged ()
{
    Xid    attr_id;
    Widget attr_w;
    Widget attr;

    if  ( ! WCH_get_id (&attr_id) ) {
        XwuError ("error getting data");
    }
    attr_w = XwuWidget (attr_id);
    if ( ! WCH_put_message_id (SEND_ID_LIST_MSG) ) {
        XwuError ("error putting data");
    }
    attr = ((XwAttrWidget) attr_w)->attr.last_label;
    while (attr != NULL ) {
        if ( ATTR_CONSTRAINT(ATTR_CONSTRAINT(attr)->attr.associate)->attr.has_changed ){
            if ( ! WCH_put_id (ATTR_CONSTRAINT(attr)->attr.attr_id) ) {
                XwuError ("error putting data");
            }
        }
        attr = ATTR_CONSTRAINT(attr)->attr.previous_line;
    }

    if  ( ! WCH_send (NULL) ) {
        XwuError ("error sending data");
    }
    
}

void   XwaHandleAttrVal (tag)
    Xid     tag;
{
    char       *p_str, *p_substr, *p_new_substr;
    Widget     label;
    XmString   x_str_val;
    
    label = get_attr_widget (tag);
    if ( ! WCH_put_message_id (SEND_STRING_LIST_MSG) ) {
        XwuError ("error sending data");
    }
    XtVaGetValues ( label, XmNlabelString, &x_str_val, NULL);
    p_str = XwuXstrToStr (x_str_val);
    if ( ! WCH_put_string (p_str) ) {
        XwuError ("error sending data");
    }

    p_str =  XmTextGetString(ATTR_CONSTRAINT(label)->attr.associate);
    p_substr = p_str;
    while ( (p_new_substr = strchr (p_substr, '\n')) != NULL ) {
        *p_new_substr = '\0';
        if ( ! WCH_put_string (p_substr) ) {
            XwuError ("error sending data");
        }
        p_substr = p_new_substr + 1;
    }
    if ( ! WCH_put_string (p_substr) ) {
        XwuError ("error sending data");
    }
    
    return;
}

static Widget create_attr (widget, name, arglist, argcount)
    Widget widget;
    char *name;
    ArgList arglist;
    Cardinal argcount;
{
    Widget   aw;

    aw = XtCreateWidget("attr", XwattrWidgetClass, widget, arglist, argcount);
    XtManageChild ( aw );
    return aw;
}

static void set_current_attr (w, p_tag, p_reason)
    Widget              w;
    int                 *p_tag;
    XmAnyCallbackStruct *p_reason;
{
    XwAttrWidget    attr_area;

    if ( ! XmIsLabel (w) ) {
        w = ATTR_CONSTRAINT(w)->attr.associate;
    }
    attr_area = (XwAttrWidget) XtParent(w);
    attr_area->attr.chosen_attr =
                ((AttrConstraints)(w->core.constraints))->attr.attr_id;
}

static void set_changed_attr (w, p_tag, p_reason)
    Widget              w;
    int                 *p_tag;
    XmAnyCallbackStruct *p_reason;
{
    ATTR_CONSTRAINT(w)->attr.has_changed = TRUE;
}

static void  adapt_string ( p_in, p_out, p_nr_lines, p_max_width )
    char   *p_in;
    char   *p_out;
    int    *p_nr_lines;
    int    *p_max_width;
{
    Boolean    in_space;
    int        i, j, first_space, width;

    /* This function takes all spaces, tabs or EOLs as string
       separators and transforms one or more of these into one EOL
       ( except for trailing blanks at the beginning or the end; these
         are removed ).
       Furthermore the number of lines and the maximum line width are
       calculated.
    */

    in_space = FALSE;
    *p_nr_lines = 1;
    *p_max_width = 0;
    width = 0;

    for ( i = 0, j = 0; p_in[i] != '\0'; i++ ) {
        if ( p_in[i] == ' ' || p_in[i] == '\t' || p_in[i] == '\n' ) {
            if ( ! in_space && j != 0 ) {
                p_out[j] = '\n';
                in_space = TRUE;
                first_space = j;
                (*p_nr_lines)++;
                *p_max_width = MAX( *p_max_width, width);
                width = 0;
                j++;
            }
        }
        else {
            p_out[j] = p_in[i];
            in_space = FALSE;
            width++;
            j++;
        }
    }
    if ( in_space ) {
        p_out[first_space] = '\0';
        (*p_nr_lines)--;
    }
    else {
        p_out[j] = '\0';
        *p_max_width = MAX( *p_max_width, width);
    }
    return;
}

static Widget get_attr_widget ( tag )
    Xid   tag;
{
    Widget    w, attr;
    int       i, j;

    attr = search_attr_in_widget ( tag , Attr_widget );
    if (attr != NULL) {
        return attr;
    }
    for ( j = 0; j < 2; j++ ) {
        for ( i = 0; i < MAX_SCREENS; i++ ) {
            switch (j) {
                case 0: w = XwuWidget(XwuCodeKey(X_attr_area, i)); break;
                case 1: w = XwuWidget(XwuCodeKey(X_hn_area, i));   break;
            }
            if ( w != Attr_widget ) {
                attr = search_attr_in_widget (tag, w);
                if (attr != NULL) {
                    return attr;
                }
            }
        }
    }
    XwuError ("software error in Xwa:get_attr_widget");
}

static Widget search_attr_in_widget ( tag, w )
    Xid      tag;
    Widget   w;
{
    Widget   attr;
 
    if ( w != NULL && XtIsManaged(w) ) {
        attr = ((XwAttrWidget) w)->attr.last_label;
        while (attr != NULL ) {
            if ( ATTR_CONSTRAINT(attr)->attr.attr_id == tag ) {
                return attr;
            }                    
            attr = ATTR_CONSTRAINT(attr)->attr.previous_line;
        }
    }
    return NULL;
}
