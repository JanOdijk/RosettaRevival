/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Xwt.c
 *  Creation date   : 1991-05-06
 *  Author          : Y. van Dinther
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : X-Windows Tree Module
 *
 *EMP:::===================================================================*/

#include <X11/Intrinsic.h>
#include <X11/Xmu/Converters.h>
#include <Xm/Xm.h>
#include <Xm/PushB.h>
#include <Mrm/MrmAppl.h>
#include "gendef.h"
#include "Xwuil.h"
#include "Xwt.h"
#include "Xwu.h"
#include "Tree.h"
#include "TreeP.h"

#define MAX_LABEL_LENGTH        9

Widget  Tree_widget = NULL;

static Widget create_tree ();
static void set_current_node ();
static Widget get_node_widget ();

void XwtAction (w, p_tag, p_reason)
    Widget              w;
    int                 *p_tag;
    XmAnyCallbackStruct *p_reason;
{
    int     simple_tag, screen_nr, edge;
    Widget  tree_area;
    Xid     tree_tag;

    XwuDecodeKey (*p_tag, &simple_tag, &screen_nr);
    tree_tag = XwuCodeKey (X_tree_area, screen_nr);

    switch ( simple_tag ) {
    case X_tree_orientation_button:
    case X_trees_orientation_button:
        {
            XtOrientation orientation;

            if ( simple_tag == X_trees_orientation_button ) {
                tree_tag = XwuCodeKey (X_trees_area, screen_nr);
            }

            tree_area = XwuWidget (tree_tag);
            if (tree_area != NULL) {
        	XtVaGetValues (tree_area, XtNorientation,
                               &orientation, NULL);
	        orientation = (orientation == XtorientVertical) ?
    		              XtorientHorizontal : XtorientVertical;
    	        XtVaSetValues (tree_area, XtNorientation,
                               orientation, NULL);
            }
        }
        break;
    case X_tree_showtree_button:
       edge = 2 * (SPACING + BORDER);
       XwuFitScrolledWindow (tree_tag, 
           XDisplayHeight(XwuDisplay(), XDefaultScreen(XwuDisplay()))
           - edge - SPACING - BUTTON_HEIGHT,
           XDisplayWidth (XwuDisplay(), XDefaultScreen(XwuDisplay())) - edge , FALSE);
       break;
    }
}

void XwtInitialize ()
{
    if (MrmRegisterClass (MrmwcUnknown, "Tree", "TreeCreate",
            create_tree, &XstreeWidgetClass) != MrmSUCCESS) {
        XwuError ("can't register Tree widget");
    }
}

void XwtDestroyTree (tag)
    Xid     tag;
{
    Widget            tree_area;
    WidgetList        list;
    Cardinal          number;
    int               i;
    TreeConstraints   constr;

    tree_area = XwuWidget (tag);
    if ( tree_area != NULL ) {
        XtVaGetValues (tree_area, XmNchildren, &list, XmNnumChildren, &number, NULL);
        for ( i = number - 1; i >= 0; i-- ) {
            if ( XmIsPushButton (list[i]) ) {
                XtDestroyWidget (list[i]);
            }
            else {
                /* this is the special root-node */
                constr = (TreeConstraints)(list[i]->core.constraints);
                XtFree ( constr->tree.sub_nodes );
                constr->tree.sub_nodes = NULL;
                constr->tree.n_sub_nodes = 0;
                constr->tree.max_sub_nodes = 0;
                constr->tree.x = 0;
                constr->tree.y = 0;
            }
        }
    }
}

void XwtStartTree (tag)
    Xid     tag;
{
    int            simple_tag, screen_nr;

    XwtDestroyTree (tag);
    Tree_widget = XwuWidget (tag);
     XwuDecodeKey (tag, &simple_tag, &screen_nr);

    ((XsTreeWidget) Tree_widget)->tree.screen_nr = screen_nr;
    ((XsTreeWidget) Tree_widget)->tree.chosen_node = X_undefined;
}

void XwtSetNode (node_tag, parent_tag, p_label1, p_label2)
    Xid     node_tag;
    Xid     parent_tag;
    char    *p_label1;
    char    *p_label2;
{
    Widget   node;
    Arg      wargs [3];
    int      n, len1, len2;
    char     p_text [2 * MAX_LABEL_LENGTH + 2];

    /* if the node has no parent, the parent_tag should be X_undefined */

    len1 = MIN ( MAX_LABEL_LENGTH, strlen(p_label1) );
    strncpy ( p_text, p_label1, len1 );
    p_text[len1] = '\n';
    len2 = MIN ( MAX_LABEL_LENGTH, strlen(p_label2) );
    strncpy ( p_text + len1 + 1, p_label2, len2 );
    p_text[len1 + 1 + len2] = '\0';

    n = 0;
    XtSetArg(wargs[n], XtNsuperNode, get_node_widget (parent_tag) ); 
    n++;
    XtSetArg(wargs[n], XmNlabelString, XwuStrToXstr (p_text));
    n++;
    XtSetArg(wargs[n], XmNmultiClick, XmMULTICLICK_KEEP);
    n++;
    node = XmCreatePushButton (Tree_widget, "node", wargs, n);
    XtAddCallback ( node, XmNactivateCallback, set_current_node, NULL);
    ((TreeConstraints)(node->core.constraints))->tree.node_id = node_tag;
    XtManageChild (node);

}

void XwtEndTree (tag)
    Xid     tag;
{
    Widget   w;

    w = XwuWidget (tag);    
    XtManageChild (w);
    XtVaSetValues (w, XtNrecompute, TRUE, NULL);
    XwuFitScrolledWindow (tag, 550, 550, FALSE);
    Tree_widget = NULL;
}

Xid XwtGetNode (tag)
    Xid     tag;
{
    XsTreeWidget   tree_area;

    tree_area = (XsTreeWidget) XwuWidget(tag);
    return tree_area->tree.chosen_node;
}

static Widget create_tree (widget, name, arglist, argcount)
    Widget widget;
    char *name;
    ArgList arglist;
    Cardinal argcount;
{
    Widget    tw;

    tw = XtCreateWidget("tree", XstreeWidgetClass, widget, arglist, argcount);
    XtManageChild (tw);
    return tw;
}

static void set_current_node (w, p_tag, p_reason)
    Widget              w;
    int                 *p_tag;
    XmAnyCallbackStruct *p_reason;
{
    XsTreeWidget    tree_area;
    Xid             expand_tag;
    Boolean         sens;

    tree_area = (XsTreeWidget) XtParent (w);
    tree_area->tree.chosen_node = 
                ((TreeConstraints)(w->core.constraints))->tree.node_id;

    if ( ((XmPushButtonCallbackStruct *) p_reason)->click_count > 1 ) {
        if ( tree_area == (XsTreeWidget) XwuWidget (
                      XwuCodeKey (X_trees_area, tree_area->tree.screen_nr)) ) {
            expand_tag = XwuCodeKey (X_trees_expand_button, tree_area->tree.screen_nr);
        }
        else {
            expand_tag = XwuCodeKey (X_tree_expand_button, tree_area->tree.screen_nr);
        }
        XtVaGetValues ( XwuWidget(expand_tag), XmNsensitive, &sens, NULL);
        if ( sens ) {
            XwbAction ( XwuWidget(expand_tag), &expand_tag, p_reason );
        }
    }
}

static Widget get_node_widget ( tag )
    Xid   tag;
{
    WidgetList        list;
    Cardinal          number;
    int               i;

    if ( tag == X_undefined ) {
        return NULL;
    }
    else {
        XtVaGetValues (Tree_widget, XmNchildren, &list, XmNnumChildren, &number, NULL);
        for ( i = number - 1; i >= 0; i-- ) {
            if ( ((TreeConstraints)(list[i]->core.constraints))->tree.node_id ==
                 tag ) {
                return list[i];
            }
        }
        XwuError ("software error in Xwt:get_node_widget");
    }
}
