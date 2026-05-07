/*MPM:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Xwh: X windows help module
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

#include <sys/types.h>
#include <sys/stat.h>
#include <ctype.h>
#include <Mrm/MrmAppl.h>

#include <X11/Intrinsic.h>
#include <X11/Xlib.h>
#include <Xs/libXs.h>

#include <Xm/Text.h>
#include "gendef.h"
#include "Xwuil.h"
#include "Xwh.h"
#include "Xwu.h"


/* forward declaration of local functions */

static void Do_help ();

/*=========================================================================*
 *  Exported function XwhAction
 *=========================================================================*/

void XwhAction (w, p_tag, p_reason)
    Widget w;
    Xid    *p_tag;
    XmAnyCallbackStruct *p_reason;
{
    static Xid        saved_tag = X_undefined;
    static Boolean    restore_help = FALSE;

    switch (*p_tag) {
    case X_mw_help_button:
    case X_mw_keys_button:
    case X_mw_tutorial_button:
    case X_mw_version_button:
    case X_amb1_help_button:
    case X_amb2_help_button:
    case X_amb3_help_button:
    case X_attr_help_button:
    case X_dbg_help_button:
    case X_mp_help_button:
    case X_mg_help_button:
    case X_dbgset_help_button:
    case X_env_help_button:
    case X_trees_help_button:
    case X_tree_help_button:
    case X_mps_help_button:
    case X_hn_help_button:
        saved_tag = *p_tag;
        Do_help (*p_tag);
        break;

    case X_help_help_button:
        restore_help = TRUE;
        Do_help (*p_tag);
        break;

    case X_help_ok_button:
        if ( restore_help ) {
            Do_help (saved_tag);
            restore_help = FALSE;
        }
        else {
            XtUnmanageChild(XwuWidget(X_help_window));
        }
        break;

    default:
        XwuError ("not defined...");
        break;
    }

}		/* end of XwhAction */


/*=========================================================================*
 *  Static function Do_help
 *=========================================================================*/

static void Do_help (id)
    int id;
{
    char *p_name;
    char name [100];
    char error_s [120];
    int tag;
    FILE *p_f;
    struct stat statbuf;
    int file_length;
    char * p_file_string;
    Position   x,y;
    Dimension  width, height;
    int  screen_width, screen_height;
    char *p_help;
    Boolean was_allocated = FALSE;

    strcpy (name, XwuHelpDirName ());
    switch (id) {
    case X_mw_help_button:
        p_name = "onHelp";
        break;
    case X_mw_keys_button:
        p_name = "onKeys";
        break;
    case X_mw_tutorial_button:
        p_name = "tutorial";
        break;
    case X_mw_version_button:
        p_name = "onVersion";
        break;
    case X_amb1_help_button:
    case X_amb2_help_button:
    case X_amb3_help_button:
        p_name = "amb";
        break;
    case X_attr_help_button:
        p_name = "attr";
        break;
    case X_dbg_help_button:
        p_name = "dbg";
        break;
    case X_mp_help_button:
        p_name = "mp";
        break;
    case X_mg_help_button:
        p_name = "mg";
        break;
    case X_dbgset_help_button:
        p_name = "opt_dbg";
        break;
    case X_env_help_button:
        p_name = "opt_env";
        break;
    case X_trees_help_button:
        p_name = "treeset";
        break;
    case X_tree_help_button:
        p_name = "tree";
        break;
    case X_mps_help_button:
        p_name = "mps";
        break;
    case X_hn_help_button:
        p_name = "hn";
        break;
    case X_help_help_button:
        p_name = "help_help";
        break;
    default:
        p_name = "rosgen";
        break;
    }
    strcat (name, p_name);
    strcat (name, ".help");
    if ( (p_f = fopen (name, "r" )) == NULL) {
         sprintf(error_s, "Warning: cannot open file %s.\n", name);
         p_file_string = error_s;
    }   
    else {
        if (stat (name, &statbuf) == 0) {
            file_length = statbuf.st_size;
        }
        else {
            file_length = 1000000; /* arbitrary file length */
        }

        /* read the file string */    
        p_file_string = (char *) XtMalloc((unsigned)file_length);
	was_allocated = TRUE;
        fread (p_file_string, sizeof(char), file_length, p_f);
        *(p_file_string+file_length) = '\0';

        /* close up the file */
        if (fclose (p_f) != NULL) {
            fprintf (stderr, "Warning: unable to close file.\n");
        }
    }
    /* added the file string to the text widget */
    XmTextSetString(XwuWidget (X_help_area), p_file_string);
    if (was_allocated) XtFree (p_file_string);

    if ( ! XtIsManaged (XwuWidget(X_help_window)) ) {
        if ( id != X_help_help_button ) {
/*
 *	Position help window
 */
            screen_width  = XDisplayWidth (XwuDisplay(), XDefaultScreen(XwuDisplay()));
            screen_height = XDisplayHeight (XwuDisplay(), XDefaultScreen(XwuDisplay()));
            XtUnmanageChild (XwuWidget (X_help_window));
            XwuWindowInfo (id, &x, &y, &width, &height);
            if ( x + width/2  > screen_width/2 ) {
                x = MAX(x - HELP_WIDTH - 3*BORDER , 0);
            }
            else {
                x = MIN(x + width + BORDER, screen_width - HELP_WIDTH - 2*BORDER);
            }
            if ( y + height/2 > screen_height/2 ) {
                y = MAX(y - HELP_HEIGHT - BORDER - 2*BORDER_UP, 0);
            }
            else {
                y = MIN(y + height + BORDER,
                        screen_height - HELP_HEIGHT - BORDER - BORDER_UP);
            }
            XtVaSetValues (XwuWidget (X_help_window), XmNx, x, XmNy, y, NULL);
        }
        XtManageChild (XwuWidget (X_help_window));
    }
}		/* end of Do_help */
