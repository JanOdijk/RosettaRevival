/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Attr.h
 *  Creation date   : 1991-05-15
 *  Author          : Y. van Dinther
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : Public header file for the user-defined widget Attr
 *
 *EMP:::===================================================================*/

#ifndef ATTR_H
#define ATTR_H

extern WidgetClass  XwattrWidgetClass;

typedef struct _XwAttrClassRec *XwAttrWidgetClass;
typedef struct _XwAttrRec      *XwAttrWidget;

#define XtNhorizontalSpace    "horizontalSpace"
#define XtNverticalSpace      "verticalSpace"
#define XtNassociate          "associate"
#define XtCAssociate          "Associate"
#define XtNrecompute          "recompute"
#define XtCRecompute          "Recompute"

#endif ATTR_H
