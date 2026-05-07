/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Attr.c
 *  Creation date   : 1991-05-15
 *  Author          : Y. van Dinther
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : user-defined widget Attr module
 *
 *EMP:::===================================================================*/

#include	  <X11/Intrinsic.h>
#include	  <X11/IntrinsicP.h>
#include	  <X11/StringDefs.h>
#include	  <X11/CoreP.h>
#include  	  <X11/CompositeP.h>
#include	  <X11/ConstrainP.h>
#include          <Xm/Label.h>
#include          <Xm/Text.h>
#include          <Xm/TextP.h>
#include          "gendef.h"
#include          "Xwuil.h"
#include	  "Attr.h"
#include	  "AttrP.h"

/* Methods of the constraint widget */

static void             initialize ();
static void             constraint_initialize ();
static Boolean          set_values ();
static Boolean          constraint_set_values ();
static void             constraint_destroy ();
static XtGeometryResult geometry_manager ();

/* auxiliary functions */

static void             delete_label ();
static void             new_layout ();
static Dimension        compute_max_width ();
static void             compute_positions ();
static void             set_positions ();
static void             move_widget ();

static Boolean  Recompute = FALSE;

static XtResource resources[] = {
    { XtNhorizontalSpace, XtCSpace, XtRDimension, sizeof (Dimension),
      XtOffset (XwAttrWidget, attr.h_min_space), XtRString, "15"
    },
    { XtNverticalSpace, XtCSpace, XtRDimension, sizeof (Dimension),
      XtOffset (XwAttrWidget, attr.v_min_space), XtRString, "5"
    },
    { XtNrecompute, XtCRecompute, XtRBoolean, sizeof (Boolean),
      XtOffset (XwAttrWidget, attr.recompute),
      XtRBoolean, (XtPointer) &Recompute
    },
};

static XtResource attrConstraintResources[] = {
    { XtNassociate, XtCAssociate, XtRWidget, sizeof (Widget),
      XtOffset (AttrConstraints, attr.associate), XtRPointer, NULL
    },
};

XwAttrClassRec  XwattrClassRec = {
    {
	/* core_class fields  */
	(WidgetClass) & constraintClassRec,	/* superclass         */
	"Attr",			/* class_name         */
	sizeof (XwAttrRec),	/* widget_size        */
	NULL,			/* class_init         */
	NULL,			/* class_part_init    */
	FALSE,			/* class_inited       */
	initialize,		/* initialize         */
	NULL,			/* initialize_hook    */
	XtInheritRealize,	/* realize            */
	NULL,			/* actions            */
	0,			/* num_actions        */
	resources,		/* resources          */
	XtNumber (resources),	/* num_resources      */
	NULLQUARK,		/* xrm_class          */
	TRUE,			/* compress_motion    */
	TRUE,			/* compress_exposure  */
	TRUE,			/* compress_enterleave */
	TRUE,			/* visible_interest   */
	NULL,			/* destroy            */
	NULL,			/* resize             */
	NULL,			/* expose             */
	set_values,		/* set_values         */
	NULL,			/* set_values_hook    */
	XtInheritSetValuesAlmost,	/* set_values_almost  */
	NULL,			/* get_values_hook    */
	NULL,			/* accept_focus       */
	XtVersion,		/* version            */
	NULL,			/* callback_private   */
	NULL,			/* tm_table           */
	NULL,			/* query_geometry     */
	NULL,			/* display_accelerator */
	NULL,			/* extension          */
    },
    {
	/* composite_class fields */
	geometry_manager,	/* geometry_manager    */
	NULL,			/* change_managed      */
	XtInheritInsertChild,	/* insert_child        */
	XtInheritDeleteChild,	/* delete_child        */
	NULL,			/* extension           */
    },
    {
	/* constraint_class fields */
	attrConstraintResources,/* subresources        */
	XtNumber (attrConstraintResources),	/* subresource_count   */
	sizeof (AttrConstraintsRec),	/* constraint_size     */
	constraint_initialize,	/* initialize          */
	constraint_destroy,	/* destroy             */
	constraint_set_values,	/* set_values          */
	NULL,			/* extension           */
    },
    {
	/* Attr class fields */
	0,			/* ignore              */
    }
};

WidgetClass     XwattrWidgetClass = (WidgetClass) & XwattrClassRec;

static void initialize (request, new)
    XwAttrWidget    request;
    XwAttrWidget    new;
{
    /*
     * Make sure the widget's width and height are greater than zero.
     */
    if ( request->core.width <= 0 ) {
	new->core.width = 5;
    }
    if ( request->core.height <= 0 ) {
	new->core.height = 5;
    }
    new->attr.last_label = NULL;
}

static void constraint_initialize (request, new)
    Widget          request;
    Widget          new;
{
    AttrConstraints   attr_const = ATTR_CONSTRAINT (new);
    XwAttrWidget      aw = (XwAttrWidget) new->core.parent;

    if (XmIsLabel (new) ) {
        attr_const->attr.previous_line = aw->attr.last_label;
        aw->attr.last_label = new;
    }
    else {
        attr_const->attr.previous_line = (Widget) NULL;
    }
    attr_const->attr.x = attr_const->attr.y = 0;
    attr_const->attr.has_changed = FALSE;
}

static Boolean set_values (current, request, new)
    XwAttrWidget    current;
    XwAttrWidget    request;
    XwAttrWidget    new;
{
    int             redraw = FALSE;
    XGCValues       values;
    XtGCMask        value_mask;

    /*
     * If the minimum spacing has changed, recalculate the attr layout.
     * new_layout() does a redraw, so we don't need set_values to do another
     * one.
     */
    if ( new->attr.v_min_space != current->attr.v_min_space ||
	 new->attr.h_min_space != current->attr.h_min_space ) {
	new_layout (new);
	redraw = FALSE;
    }
    /*
     * If the recompute value is TRUE, recalculate the tree layout.
     * The recompute value can only have effect in an Xt-set-values routine !
     */
    if ( new->attr.recompute ) {
	new_layout (new);
        new->attr.recompute = FALSE;
	redraw = FALSE;
    }
    return (redraw);
}

static Boolean constraint_set_values (current, request, new)
    Widget          current;
    Widget          request;
    Widget          new;
{
    AttrConstraints new_const = ATTR_CONSTRAINT (new);
    AttrConstraints current_const = ATTR_CONSTRAINT (current);
    AttrConstraints assoc_const;
    XwAttrWidget    aw = (XwAttrWidget) new->core.parent;

    if ( current_const->attr.associate != new_const->attr.associate ) {
	if ( current_const->attr.associate != NULL ) {
            assoc_const = ATTR_CONSTRAINT (current_const->attr.associate);
            assoc_const->attr.associate = (Widget) NULL;
        }
	if ( new_const->attr.associate != NULL ) {
            assoc_const = ATTR_CONSTRAINT (new_const->attr.associate);
            assoc_const->attr.associate = new;
        }
    }
    return (False);
}

static void constraint_destroy (w)
    Widget          w;
{
/*
    If one child is destroyed, all children are destroyed (via XwaDestroyAttr)
    This means that no specific delete_label-function has to be called !!!

    AttrConstraints attr_const = ATTR_CONSTRAINT (w);
    int             i;

    if ( XmIsLabel (w) ) {
        delete_label (w);
    }
    else {
        delete_label (attr_const->attr.associate);
    }
*/
}

static XtGeometryResult geometry_manager (w, p_request, p_reply)
    Widget           w;
    XtWidgetGeometry *p_request;
    XtWidgetGeometry *p_reply;
{
    XwAttrWidget    aw = (XwAttrWidget) w->core.parent;

    /*
     * No position changes allowed!.
     */
    if ( ((p_request->request_mode & CWX) && p_request->x != w->core.x) ||
	 ((p_request->request_mode & CWY) && p_request->y != w->core.y) ) {
	return (XtGeometryNo);
    }
    /*
     * Allow other resize requests.
     */
    if ( p_request->request_mode & CWWidth ) {
	w->core.width = p_request->width;
    }
    if ( p_request->request_mode & CWHeight ) {
	w->core.height = p_request->height;
    }
    if ( p_request->request_mode & CWBorderWidth ) {
	w->core.border_width = p_request->border_width;
    }
    /*
     * Compute the new layout based on the new widget sizes;
     */
    new_layout (aw);
    return (XtGeometryYes);
}

static void delete_label (label)
    Widget          label;
{
    XwAttrWidget    aw = (XwAttrWidget) label->core.parent;
    Widget          w, prev_w;

    /*
     * Find the label in the label-list
     */
    prev_w = NULL;
    w = aw->attr.last_label;
    while ( w != NULL ) {
        if ( w == label ) {
            break;
        }
        prev_w = w;
        w = ATTR_CONSTRAINT(w)->attr.previous_line;
    }
    if ( w != NULL ) {
        if ( prev_w != NULL ) {
            ATTR_CONSTRAINT(prev_w)->attr.previous_line = 
                    ATTR_CONSTRAINT(w)->attr.previous_line;
        }
        else {
            aw->attr.last_label = ATTR_CONSTRAINT(w)->attr.previous_line;
        }
    }
}

static void new_layout (aw)
    XwAttrWidget    aw;
{
    XtUnmanageChild (aw);
    /*
     * reset attr widget's width and height: this way the resulting window will
     * always fit nicely
     */
    aw->core.width = 5;
    aw->core.height = 5;

    compute_positions (aw);
    set_positions (aw);
    XtManageChild (aw);

    if ( XtIsRealized (aw) ) {
	XClearArea (XtDisplay (aw), XtWindow (aw), 0, 0, 0, 0, TRUE);
    }
}

static void  compute_positions (aw)
    XwAttrWidget    aw;
{
    Widget          w, assoc;
    Position        y_pos, h_pos_text;
    Dimension       v_space, width_text, height,
                    total_height, max_width_label, max_width_text;

    total_height = compute_max_width (aw, &max_width_label, &max_width_text);

    y_pos                    = total_height;
    v_space                  = aw->attr.v_min_space;
    h_pos_text               = aw->attr.h_min_space + max_width_label;

    for ( w = aw->attr.last_label; w != NULL;
          w = ATTR_CONSTRAINT(w)->attr.previous_line ) {
        assoc = ATTR_CONSTRAINT(w)->attr.associate;
        height = MAX( w->core.height, assoc->core.height);

        ATTR_CONSTRAINT(w)->attr.x = 0;
        ATTR_CONSTRAINT(w)->attr.y = y_pos - (height + w->core.height)/2;
        ATTR_CONSTRAINT(assoc)->attr.x = h_pos_text;
        ATTR_CONSTRAINT(assoc)->attr.y = y_pos - height;
        assoc->core.width = max_width_text;
        XtManageChild (assoc);
        y_pos = y_pos - height - v_space;
    }

}

static void set_positions (aw)
    XwAttrWidget    aw;
{
    Widget     w, assoc;

    for ( w = aw->attr.last_label; w != NULL;
          w = ATTR_CONSTRAINT(w)->attr.previous_line ) {
        move_widget ( aw, w);
        assoc = ATTR_CONSTRAINT(w)->attr.associate;
        move_widget ( aw, assoc);
    }
}

static Dimension  compute_max_width (aw, p_max_width_label, p_max_width_text)
    XwAttrWidget    aw;
    Dimension       *p_max_width_label;
    Dimension       *p_max_width_text;
{
    Widget          w, assoc;
    Dimension       total_height, v_space;

    *p_max_width_label = 0;
    *p_max_width_text  = 0;
    total_height             = 0;
    v_space                  = aw->attr.v_min_space;

    for ( w = aw->attr.last_label; w != NULL;
          w = ATTR_CONSTRAINT(w)->attr.previous_line ) {
        *p_max_width_label = MAX (*p_max_width_label, w->core.width);
        assoc = ATTR_CONSTRAINT(w)->attr.associate;
        *p_max_width_text  = MAX (*p_max_width_text, assoc->core.width);

        total_height += MAX( w->core.height, assoc->core.height) + v_space;
    }
    return (total_height - v_space);
}

static void move_widget (aw, w)
    XwAttrWidget    aw;
    Widget          w;
{
    AttrConstraints    attr_const = ATTR_CONSTRAINT (w);
    Dimension          replyWidth = 0, replyHeight = 0;
    XtGeometryResult   result;

    /*
     * Move the widget into position.
     */
    XtMoveWidget (w, attr_const->attr.x, attr_const->attr.y);
    /*
     * If the widget position plus its width or height doesn't fit in the
     * attr, ask if the attr can be resized.
     */
    if ( aw->core.width < attr_const->attr.x + w->core.width ||
         aw->core.height < attr_const->attr.y + w->core.height ) {
        result = XtMakeResizeRequest ( aw, 
                    MAX (aw->core.width,  attr_const->attr.x + w->core.width),
    		    MAX (aw->core.height, attr_const->attr.y + w->core.height),
    		    &replyWidth, &replyHeight);
        /*
         * Accept any compromise.
         */
        if ( result == XtGeometryAlmost ) {
            XtMakeResizeRequest ( aw, replyWidth, replyHeight, NULL, NULL);
        }
    }
}
