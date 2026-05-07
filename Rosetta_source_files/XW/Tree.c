/**********************************************************************************
  * Tree.c: The Tree Widget Source File
  *         From:
  *                   The X Window System,
  *            Programming and Applications with Xt
  *                   OSF/Motif Edition
  *         by
  *                Douglas Young
  *              Prentice Hall, 1990
  *
  *                 Example described on pages: 397-419
  *
  *
  *  Copyright 1989 by Prentice Hall
  *  All Rights Reserved
  *
  * This code is based on the OSF/Motif widget set and the X Window System
  *
  * Permission to use, copy, modify, and distribute this software for
  * any purpose and without fee is hereby granted, provided that the above
  * copyright notice appear in all copies and that both the copyright notice
  * and this permission notice appear in supporting documentation.
  *
  * Prentice Hall and the author disclaim all warranties with regard to
  * this software, including all implied warranties of merchantability and fitness.
  * In no event shall Prentice Hall or the author be liable for any special,
  * indirect or cosequential damages or any damages whatsoever resulting from
  * loss of use, data or profits, whether in an action of contract, negligence
  * or other tortious action, arising out of or in connection with the use
  * or performance of this software.
  *
  * Open Software Foundation is a trademark of The Open Software Foundation, Inc.
  * OSF is a trademark of Open Software Foundation, Inc.
  * OSF/Motif is a trademark of Open Software Foundation, Inc.
  * Motif is a trademark of Open Software Foundation, Inc.
  * DEC is a registered trademark of Digital Equipment Corporation
  * HP is a registered trademark of the Hewlett Packard Company
  * DIGITAL is a registered trademark of Digital Equipment Corporation
  * X Window System is a trademark of the Massachusetts Institute of Technology
  **********************************************************************************/


#include	  <X11/Intrinsic.h>
#include	  <X11/IntrinsicP.h>
#include	  <X11/StringDefs.h>
#include	  <X11/CoreP.h>
#include  	  <X11/CompositeP.h>
#include	  <X11/ConstrainP.h>
#include          <Xm/Xm.h>
#include          "gendef.h"
#include	  "Tree.h"
#include	  "TreeP.h"
#include	  "Xwuil.h"

/* Methods of the constraint widget */

static void             initialize ();
static void             constraint_initialize ();
static Boolean          set_values ();
static Boolean          constraint_set_values ();
static XtGeometryResult geometry_manager ();
static void             redisplay ();

/* auxiliary functions */

static void             insert_new_node ();
static void             delete_node ();
static void             new_layout ();
static int              compute_positions ();
static void             shift_subtree ();
static void             set_positions ();
static TreeOffsetPtr    create_offset ();
static void             reset_offset ();
static void             realloc_offset ();
static Position         get_position ();
static Dimension        get_max_width ();
static void             set_position ();
static void             set_max_width ();
static Dimension        sum_of_max_array ();
static void             move_widget ();
static void             get_fan_out ();

static XtOrientation Orientation = XtorientHorizontal;
static Boolean       Recompute   = FALSE;

static XtResource resources[] = {
    { XtNhorizontalSpace, XtCSpace, XtRDimension, sizeof (Dimension),
      XtOffset (XsTreeWidget, tree.h_min_space), XtRString, "15"
    },
    { XtNverticalSpace, XtCSpace, XtRDimension, sizeof (Dimension),
      XtOffset (XsTreeWidget, tree.v_min_space), XtRString, "5"
    },
    { XtNforeground, XtCForeground, XtRPixel, sizeof (Pixel),
      XtOffset (XsTreeWidget, tree.foreground), XtRString, "Black"
    },
    { XtNorientation, XtCOrientation, XtROrientation, sizeof (XtOrientation),
      XtOffset (XsTreeWidget, tree.orientation),
      XtROrientation, (XtPointer) &Orientation
    },
    { XtNrecompute, XtCRecompute, XtRBoolean, sizeof (Boolean),
      XtOffset (XsTreeWidget, tree.recompute),
      XtRBoolean, (XtPointer) &Recompute
    },
};

static XtResource treeConstraintResources[] = {
    { XtNsuperNode, XtCSuperNode, XtRPointer, sizeof (Widget),
      XtOffset (TreeConstraints, tree.super_node), XtRPointer, NULL
    },
};

XsTreeClassRec  XstreeClassRec = {
    {
	/* core_class fields  */
	(WidgetClass) & constraintClassRec,	/* superclass         */
	"Tree",			/* class_name         */
	sizeof (XsTreeRec),	/* widget_size        */
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
	redisplay,		/* expose             */
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
	NULL,      		/* change_managed      */
	XtInheritInsertChild,	/* insert_child        */
	XtInheritDeleteChild,	/* delete_child        */
	NULL,			/* extension           */
    },
    {
	/* constraint_class fields */
	treeConstraintResources,/* subresources        */
	XtNumber (treeConstraintResources),	/* subresource_count   */
	sizeof (TreeConstraintsRec),	/* constraint_size     */
	constraint_initialize,	/* initialize          */
	NULL,	                /* destroy             */
	constraint_set_values,	/* set_values          */
	NULL,			/* extension           */
    },
    {
	/* Tree class fields */
	0,			/* ignore              */
    }
};

WidgetClass     XstreeWidgetClass = (WidgetClass) & XstreeClassRec;

static void initialize (request, new)
    XsTreeWidget    request;
    XsTreeWidget    new;
{
    Arg             wargs[2];
    XGCValues       values;
    XtGCMask        value_mask;

    /*
     * Make sure the widget's width and height are greater than zero.
     */
    if ( request->core.width <= 0 ) {
	new->core.width = 5;
    }
    if ( request->core.height <= 0 ) {
	new->core.height = 5;
    }
    /*
     * Create a graphics context for the connecting lines.
     */
    value_mask = GCForeground | GCBackground;
    values.foreground = new->tree.foreground;
    values.background = new->core.background_pixel;
    new->tree.gc = XtGetGC (new, value_mask, &values);
    /*
     * Create the hidden root widget.
     */
    new->tree.tree_root = (Widget) NULL;
    XtSetArg (wargs[0], XtNwidth, 1);
    XtSetArg (wargs[1], XtNheight, 1);
    new->tree.tree_root =
	XtCreateWidget ("root", widgetClass, new, wargs, 2);
    /*
     * Allocate the tables used by the layout algorithm.
     */
    new->tree.offset = create_offset (10);

    new->tree.screen_nr = -1;
    new->tree.chosen_node = X_undefined;
}

static void constraint_initialize (request, new)
    Widget          request;
    Widget          new;
{
    TreeConstraints   tree_const = TREE_CONSTRAINT (new);
    XsTreeWidget      tw = (XsTreeWidget) new->core.parent;

    /*
     * initialize the widget to have no sub-nodes.
     */
    tree_const->tree.n_sub_nodes = 0;
    tree_const->tree.max_sub_nodes = 0;
    tree_const->tree.sub_nodes = (WidgetList) NULL;
    tree_const->tree.x = tree_const->tree.y = 0;
    /*
     * If this widget has a super-node, add it to that widget' sub-nodes list.
     * Otherwise make it a sub-node of the tree_root widget.
     */
    if ( tree_const->tree.super_node != NULL ) {
	insert_new_node (tree_const->tree.super_node, new);
    }
    else if ( tw->tree.tree_root != NULL ) {
	insert_new_node (tw->tree.tree_root, new);
    }
    tree_const->tree.node_id = X_undefined;
}

static Boolean set_values (current, request, new)
    XsTreeWidget    current;
    XsTreeWidget    request;
    XsTreeWidget    new;
{
    int             redraw = FALSE;
    XGCValues       values;
    XtGCMask        value_mask;

    /*
     * If the orientation has changed, recalculate the tree layout.
     * new_layout() does a redraw, so we don't need set_values to do another
     * one.
     */
    if ( new->tree.orientation != current->tree.orientation ) {
	new_layout (new);
	redraw = FALSE;
    }
    /*
     * If the foreground color has changed, redo the GC's and indicate a
     * redraw.
     */
    if ( new->tree.foreground != current->tree.foreground ||
	 new->core.background_pixel != current->core.background_pixel ) {
	value_mask = GCForeground | GCBackground;
	values.foreground = new->tree.foreground;
	values.background = new->core.background_pixel;
	XtReleaseGC (new, new->tree.gc);
	new->tree.gc = XtGetGC (new, value_mask, &values);
	redraw = TRUE;
    }
    /*
     * If the minimum spacing has changed, recalculate the tree layout.
     * new_layout() does a redraw, so we don't need set_values to do another
     * one.
     */
    if ( new->tree.v_min_space != current->tree.v_min_space ||
	 new->tree.h_min_space != current->tree.h_min_space ) {
	new_layout (new);
	redraw = FALSE;
    }
    /*
     * If the recompute value is TRUE, recalculate the tree layout.
     * The recompute value can only have effect in an Xt-set-values routine !
     */
    if ( new->tree.recompute ) {
	new_layout (new);
        new->tree.recompute = FALSE;
	redraw = FALSE;
    }
    return (redraw);
}

static Boolean constraint_set_values (current, request, new)
    Widget          current;
    Widget          request;
    Widget          new;
{
    TreeConstraints new_const = TREE_CONSTRAINT (new);
    TreeConstraints current_const = TREE_CONSTRAINT (current);
    XsTreeWidget    tw = (XsTreeWidget) new->core.parent;

    /*
     * If the super_node field has changed, remove the widget from the old
     * widget's sub_nodes list and add it to the new one.
     */
    if ( current_const->tree.super_node != new_const->tree.super_node ) {
	if ( current_const->tree.super_node != NULL ) {
	    delete_node (current_const->tree.super_node, new);
        }
	if ( new_const->tree.super_node != NULL ) {
	    insert_new_node (new_const->tree.super_node, new);
        }
    }
    return (False);
}

static XtGeometryResult geometry_manager (w, p_request, p_reply)
    Widget           w;
    XtWidgetGeometry *p_request;
    XtWidgetGeometry *p_reply;
{
    XsTreeWidget    tw = (XsTreeWidget) w->core.parent;

    /*
     * No position changes allowed!.
     */
    if ( ((p_request->request_mode & CWX) && p_request->x != w->core.x) ||
	 ((p_request->request_mode & CWY) && p_request->y != w->core.y) ) {
	return (XtGeometryNo);
    }
    /*
     * Allow all resize requests.
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
    new_layout (tw);
    return (XtGeometryYes);
}

static void redisplay (tw, p_event, region)
    XsTreeWidget    tw;
    XEvent          *p_event;
    Region          region;
{
    int             i, j;
    TreeConstraints tree_const;
    Widget          child;

    /*
     * If the Tree widget is visible, visit each managed child.
     */
    if ( tw->core.visible ) {
	for ( i = 0; i < tw->composite.num_children; i++ ) {
	    child = tw->composite.children[i];
	    tree_const = TREE_CONSTRAINT (child);
	    /*
	     * Draw a line between the right/bottom edge of each widget
             * and the left/top edge of each of its sub_nodes.
             * Don't draw lines from the fake tree_root.
	     */
	    if ( child != tw->tree.tree_root &&
                 tree_const->tree.n_sub_nodes != 0 ) {
		for ( j = 0; j < tree_const->tree.n_sub_nodes; j++ ) {
                    if ( tw->tree.orientation == XtorientVertical ) {
   		        XDrawLine (XtDisplay (tw), XtWindow (tw), tw->tree.gc,
			      child->core.x + child->core.width / 2,
			      child->core.y + child->core.height,
			      tree_const->tree.sub_nodes[j]->core.x +
			      tree_const->tree.sub_nodes[j]->core.width / 2,
			      tree_const->tree.sub_nodes[j]->core.y);
                    }
                    else {
   		        XDrawLine (XtDisplay (tw), XtWindow (tw), tw->tree.gc,
			      child->core.x + child->core.width,
			      child->core.y + child->core.height / 2,
			      tree_const->tree.sub_nodes[j]->core.x,
			      tree_const->tree.sub_nodes[j]->core.y +
			      tree_const->tree.sub_nodes[j]->core.height / 2);
                    }
                }
            }
	}
    }
}

static void insert_new_node (super_node, node)
    Widget          super_node;
    Widget          node;
{
    TreeConstraints super_const = TREE_CONSTRAINT (super_node);
    TreeConstraints node_const = TREE_CONSTRAINT (node);
    int             index = super_const->tree.n_sub_nodes;

    node_const->tree.super_node = super_node;
    /*
     * If there is no more room in the sub_nodes array, allocate additional
     * space.
     */
    if ( super_const->tree.n_sub_nodes == super_const->tree.max_sub_nodes ) {
	super_const->tree.max_sub_nodes +=
	    (super_const->tree.max_sub_nodes / 2) + 2;
	super_const->tree.sub_nodes =
	    (WidgetList) XtRealloc (super_const->tree.sub_nodes,
				    (super_const->tree.max_sub_nodes) *
				    sizeof (Widget));
    }
    /*
     * Add the sub_node in the next available slot and increment the counter.
     */
    super_const->tree.sub_nodes[index] = node;
    super_const->tree.n_sub_nodes++;
}

static void delete_node (super_node, node)
    Widget          super_node;
    Widget          node;
{
    TreeConstraints node_const = TREE_CONSTRAINT (node);
    TreeConstraints super_const;
    int             pos, i;

    /*
     * Make sure the super_node exists.
     */
    if ( super_node == NULL ) {
	return;
    }

    super_const = TREE_CONSTRAINT (super_node);
    /*
     * Find the sub_node on its super_node's list.
     */
    for ( pos = 0; pos < super_const->tree.n_sub_nodes; pos++ ) {
	if ( super_const->tree.sub_nodes[pos] == node ) {
	    break;
        }
    }
    if ( pos == super_const->tree.n_sub_nodes ) {
	return;
    }
    /*
     * Decrement the number of sub_nodes
     */
    super_const->tree.n_sub_nodes--;
    /*
     * Fill in the gap left by the sub_node. Zero the last slot for good luck.
     */
    for ( i = pos; i < super_const->tree.n_sub_nodes; i++ ) {
	super_const->tree.sub_nodes[i] =
	    super_const->tree.sub_nodes[i + 1];
    }
    super_const->tree.sub_nodes[super_const->tree.n_sub_nodes] = NULL;
}

static void new_layout (tw)
    XsTreeWidget    tw;
{
    XtUnmanageChild (tw);
    /*
     * reset tree widget's width and height: this way the resulting window will
     * always fit nicely
     */
    tw->core.width = 5;
    tw->core.height = 5;
    /*
     * Reset the auxiliary tables.
     */
    reset_offset (tw->tree.offset);
    /*
     * Compute each widget's x,y position and move each widget in place
     */
    compute_positions (tw, tw->tree.tree_root, 0);
    set_positions (tw, tw->tree.tree_root, 0);
    /*
     * Trigger a redisplay of the lines connecting nodes.
     */
    XtManageChild (tw);
    if ( XtIsRealized (tw) ) {
	XClearArea (XtDisplay (tw), XtWindow (tw), 0, 0, 0, 0, TRUE);
    }
}

static int compute_positions (tw, w, level)
    XsTreeWidget    tw;
    Widget          w;
    int             level;
{
    Dimension       height, width, max_width, v_min_space;
    Position        *p_tree_y_pos;
    Position        y_pos, top, bottom;
    int             i;
    int             depth = 0;
    TreeConstraints tree_const = TREE_CONSTRAINT (w);

    /*
     * Set some parameters that differ for horizontal and vertical
     * orientations. The names are chosen as if the orientation was
     * horizontal. 
     */
    if ( tw->tree.orientation == XtorientVertical ) {
        height       = w->core.width;
        width        = w->core.height;
        p_tree_y_pos = &(tree_const->tree.x);
        v_min_space  = tw->tree.h_min_space;
    }
    else {
        height       = w->core.height;
        width        = w->core.width;
        p_tree_y_pos = &(tree_const->tree.y);
        v_min_space  = tw->tree.v_min_space;
    }
    y_pos     = get_position  ( tw->tree.offset, level );
    max_width = get_max_width ( tw->tree.offset, level );
    set_max_width ( tw->tree.offset, level, MAX (max_width, width) );

    if ( tree_const->tree.n_sub_nodes == 0 ) {
	*p_tree_y_pos = y_pos;
    }
    else {
        if ( tw->tree.orientation == XtorientVertical ) {
   	    for ( i = 0; i < tree_const->tree.n_sub_nodes; i++ ) {
	        depth = compute_positions ( tw, tree_const->tree.sub_nodes[i],
		   		            level + 1);
            }
        }
        else {
   	    for ( i = tree_const->tree.n_sub_nodes - 1; i >= 0; i-- ) {
	        depth = compute_positions ( tw, tree_const->tree.sub_nodes[i],
		   		            level + 1);
            }
        }
	/*
	 * Find the vertical extent of all sub_nodes and set the node's
         * position to the center of its sub-nodes.
	 */
        get_fan_out (tw, w, &top, &bottom);
	*p_tree_y_pos = (top + bottom) / 2 - (height / 2);
	/*
	 * If this position is less than the next available position, correct
	 * it to be the next available position, calculate the amount by which
	 * all sub_nodes must be shifted, shift the entire sub-tree, and set
         * the next available space at all levels below the current level.
	 */
	if ( *p_tree_y_pos < y_pos ) {
	    Dimension       offset = y_pos - *p_tree_y_pos;

            for ( i = 0; i < tree_const->tree.n_sub_nodes; i++ ) {
		shift_subtree (tw, tree_const->tree.sub_nodes[i], offset);
            }
	    for ( i = level + 1; i <= depth; i++ ) {
		Position        pos = get_position (tw->tree.offset, i);

		set_position (tw->tree.offset, i, pos + offset);
	    }
	    *p_tree_y_pos = y_pos;
	}
    }
    set_position (tw->tree.offset, level, v_min_space + *p_tree_y_pos + height);
    return (MAX (depth, level));
}

static void shift_subtree (tw, w, offset)
    XsTreeWidget    tw;
    Widget          w;
    Dimension       offset;
{
    int             i;
    TreeConstraints tree_const = TREE_CONSTRAINT (w);

    /*
     * Shift the node by the offset.
     */
    if ( tw->tree.orientation == XtorientVertical ) {
        tree_const->tree.x += offset;
    }
    else {
        tree_const->tree.y += offset;
    }
    /*
     * Shift each sub-node into place.
     */
    for ( i = 0; i < tree_const->tree.n_sub_nodes; i++ ) {
	shift_subtree (tw, tree_const->tree.sub_nodes[i], offset);
    }
}

static void set_positions (tw, w, level)
    XsTreeWidget    tw;
    Widget          w;
    int             level;
{
    int             i;

    if ( w != NULL ) {
	TreeConstraints tree_const = TREE_CONSTRAINT (w);

	/*
	 * Add up the sum of the widths of all nodes to this depth, and use
	 * it as the x position.
	 */
        if ( tw->tree.orientation == XtorientVertical ) {
	    tree_const->tree.y = (MAX(0, level - 1) * tw->tree.v_min_space) +
    	                     sum_of_max_array (tw->tree.offset, level);
        }
        else {
	    tree_const->tree.x = (MAX(0, level - 1) * tw->tree.h_min_space) +
 	                         sum_of_max_array (tw->tree.offset, level);
        }
        move_widget ( tw, w);

	/*
	 * Set the positions of all sub_nodes.
	 */
	for ( i = 0; i < tree_const->tree.n_sub_nodes; i++ ) {
	    set_positions (tw, tree_const->tree.sub_nodes[i], level + 1);
        }
    }
}

static TreeOffsetPtr create_offset (max_level)
    int            max_level;
{
    TreeOffsetPtr   offset = (TreeOffsetPtr) XtMalloc (sizeof (TreeOffset));

    offset->max_level = max_level;
    offset->y_position = (Position *) XtMalloc (max_level * sizeof (Position));
    offset->max_width = (Dimension *) XtMalloc (max_level * sizeof (Dimension));
    return (offset);
}

static void reset_offset (offset)
    TreeOffsetPtr   offset;
{
    int            i;

    for ( i = 0; i < offset->max_level; i++ ) {
	offset->y_position[i] = 0;
	offset->max_width[i] = 0;
    }
}

static void realloc_offset ( offset, level )
    TreeOffsetPtr   offset;
    int             level;
{
    int   old_max, i;

    if ( level >= offset->max_level ) {
        old_max = offset->max_level;
	offset->max_level = level + level / 2;
	offset->y_position =
	    (Position *) XtRealloc (offset->y_position,
				    offset->max_level * sizeof (Position));
	offset->max_width =
	    (Dimension *) XtRealloc (offset->max_width,
				     offset->max_level * sizeof (Dimension));
        for ( i = old_max; i < offset->max_level; i++ ) {
	    offset->y_position[i] = 0;
	    offset->max_width[i] = 0;
        }
    }
}

static Position  get_position (offset, level)
    TreeOffsetPtr   offset;
    int             level;
{
    if ( level >= offset->max_level ) {
	return (0);
    }
    return (offset->y_position[level]);
}

static Dimension  get_max_width (offset, level)
    TreeOffsetPtr   offset;
    int             level;
{
    if ( level >= offset->max_level ) {
	return (0);
    }
    return (offset->max_width[level]);
}

static void set_position (offset, level, value)
    TreeOffsetPtr   offset;
    int             level;
    Position        value;
{
    realloc_offset(offset, level);
    offset->y_position[level] = value;
}

static void set_max_width (offset, level, value)
    TreeOffsetPtr   offset;
    int             level;
    Dimension       value;
{
    realloc_offset(offset, level);
    offset->max_width[level] = value;
}

static Dimension sum_of_max_array (offset, level)
    TreeOffsetPtr   offset;
    int             level;
{
    int             i;
    Dimension       sum = 0;
    int             stop = level;

    if ( level > offset->max_level ) {
	stop = offset->max_level;
    }
    for ( i = 0; i < stop; i++ ) {
	sum += offset->max_width[i];
    }
    return (sum);
}

static void move_widget (tw, w)
    XsTreeWidget    tw;
    Widget          w;
{
    TreeConstraints    tree_const = TREE_CONSTRAINT (w);
    Dimension          replyWidth = 0, replyHeight = 0;
    XtGeometryResult   result;

    /*
     * Move the widget into position.
     */
    XtMoveWidget (w, tree_const->tree.x, tree_const->tree.y);
    /*
     * If the widget position plus its width or height doesn't fit in the
     * tree, ask if the tree can be resized.
     */
    if ( tw->core.width < tree_const->tree.x + w->core.width ||
         tw->core.height < tree_const->tree.y + w->core.height ) {
        result = XtMakeResizeRequest ( tw, 
                    MAX (tw->core.width,  tree_const->tree.x + w->core.width),
    		    MAX (tw->core.height, tree_const->tree.y + w->core.height),
    		    &replyWidth, &replyHeight);
        /*
         * Accept any compromise.
         */
        if ( result == XtGeometryAlmost ) {
            XtMakeResizeRequest ( tw, replyWidth, replyHeight, NULL, NULL);
        }
    }
}

static void get_fan_out ( tw, w, p_top, p_bottom)
    XsTreeWidget    tw;
    Widget          w;
    Position        *p_top;
    Position        *p_bottom;
{
    Widget            first_kid, last_kid;
    TreeConstraints   const1, const2;
    TreeConstraints   tree_const = TREE_CONSTRAINT (w);

    first_kid = tree_const->tree.sub_nodes[0];
    last_kid =  tree_const->tree.sub_nodes[tree_const->tree.n_sub_nodes - 1];
    const1 = TREE_CONSTRAINT (first_kid);
    const2 = TREE_CONSTRAINT (last_kid);
    if ( tw->tree.orientation == XtorientVertical ) {
	*p_top = const1->tree.x + first_kid->core.width / 2;
	*p_bottom = const2->tree.x + last_kid->core.width / 2;
    }
    else {
	*p_top = const1->tree.y + first_kid->core.height / 2;
	*p_bottom = const2->tree.y + last_kid->core.height / 2;
    }
}
