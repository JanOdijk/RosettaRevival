/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : AttrP.h
 *  Creation date   : 1991-05-15
 *  Author          : Y. van Dinther
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : Private header file for the user-defined widget Attr
 *
 *EMP:::===================================================================*/

#ifndef ATTRP_H
#define ATTRP_H

#include "Xwuil.h"

typedef struct _XwAttrClassPart {
    int         ignore;
} XwAttrClassPart;

typedef struct _XwAttrClassRec {
    CoreClassPart       core_class;
    CompositeClassPart  composite_class;
    ConstraintClassPart constraint_class;
    XwAttrClassPart     attr_class;
} XwAttrClassRec;

extern XwAttrClassRec XwattrClassRec;

typedef struct {
    Dimension      h_min_space;
    Dimension      v_min_space;
    Widget         last_label;
    Xid            chosen_attr;
    Boolean        recompute;
} XwAttrPart;

typedef struct _XwAttrRec {
    CorePart        core;
    CompositePart   composite;
    ConstraintPart  constraint;
    XwAttrPart      attr;
}  XwAttrRec;

typedef struct _AttrConstraintsPart {
  Widget        associate;
  Widget        previous_line;
  Position      x, y;
  Xid           attr_id;
  Boolean       has_changed;
} AttrConstraintsPart;

typedef struct _AttrConstraintsRec {
   AttrConstraintsPart attr;
} AttrConstraintsRec, *AttrConstraints;


#define ATTR_CONSTRAINT(w) \
                   ((AttrConstraints)((w)->core.constraints))

#endif ATTRP_H



