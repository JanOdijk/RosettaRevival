/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Xwl.C
 *  Creation date   : 1991-05-01
 *  Author          : Y. van Dinther
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : X-Windows List handling routines
 *
 *EMP:::===================================================================*/

#include <X11/Intrinsic.h>
#include <Xm/Xm.h>
#include <Xm/Text.h>
#include "gendef.h"
#include "Xwuil.h"
#include "Xwl.h"
#include "Xwu.h"

static char  *Rule_names[XWL_MAX_LIST_LENGTH];
static char  *Trans_names[XWL_MAX_LIST_LENGTH];

static int   Mp_rule_start_pos  = 0;
static int   Mp_trans_start_pos = 0;
static int   Mg_rule_start_pos  = 0;
static int   Mg_trans_start_pos = 0;


static void  list_add ();
static void  list_remove ();
static void  list_select ();
static void  list_scroll ();
static void  convert_string ();
static void  read_file ();

void XwlInitialize ()
{
    XmString   x_str_arr[XWL_MAX_LIST_LENGTH];
    int        n_items;

    /* Important !!!!!!:
       The files read for the info-lists should:
       1. be sorted alphabetically,
       2. only contain uppercase characters,
       3. have exactly one word per line and
       4. contain no spaces or empty lines.  
    */

    read_file ("rulenames.list",  Rule_names, x_str_arr, &n_items);
    XtVaSetValues ( XwuWidget(X_mp_rule_info_list), XmNitemCount, n_items,
                                                    XmNitems, x_str_arr, NULL);
    XtVaSetValues ( XwuWidget(X_mg_rule_info_list), XmNitemCount, n_items,
                                                    XmNitems, x_str_arr, NULL);

    read_file ("transnames.list", Trans_names, x_str_arr, &n_items);
    XtVaSetValues ( XwuWidget(X_mp_trans_info_list), XmNitemCount, n_items,
                                                     XmNitems, x_str_arr, NULL);
    XtVaSetValues ( XwuWidget(X_mg_trans_info_list), XmNitemCount, n_items,
                                                     XmNitems, x_str_arr, NULL);

}

void XwlAction (w, p_tag, p_reason)
    Widget w;
    Xid    *p_tag;
    XmAnyCallbackStruct *p_reason;
{

    switch (*p_tag) {

    case X_mp_rule_add_text:
        list_add (X_mp_rule_sel_list, X_mp_rule_info_list,
                  X_mp_rule_scroll_text, Rule_names, &Mp_rule_start_pos);
        break;
    case X_mp_rule_remove_button:
        list_remove (X_mp_rule_sel_list);
        break;
    case X_mp_rule_clear_button:
        XmListDeleteAllItems ( XwuWidget (X_mp_rule_sel_list) );
        break;
    case X_mp_rule_info_list:
        list_select (X_mp_rule_sel_list, X_mp_rule_info_list, 
                     X_mp_rule_scroll_text);
        break;
    case X_mp_rule_scroll_text:
        list_scroll(X_mp_rule_info_list, X_mp_rule_scroll_text,
                    Rule_names, &Mp_rule_start_pos);
        break;

    case X_mp_trans_add_text:
        list_add (X_mp_trans_sel_list, X_mp_trans_info_list,
                  X_mp_trans_scroll_text, Trans_names, &Mp_trans_start_pos);
        break;
    case X_mp_trans_remove_button:
        list_remove (X_mp_trans_sel_list);
        break;
    case X_mp_trans_clear_button:
        XmListDeleteAllItems ( XwuWidget (X_mp_trans_sel_list) );
        break;
    case X_mp_trans_info_list:
        list_select (X_mp_trans_sel_list, X_mp_trans_info_list, 
                     X_mp_trans_scroll_text);
        break;
    case X_mp_trans_scroll_text:
        list_scroll(X_mp_trans_info_list, X_mp_trans_scroll_text,
                    Trans_names, &Mp_trans_start_pos);
        break;

    case X_mg_rule_add_text:
        list_add (X_mg_rule_sel_list, X_mg_rule_info_list,
                  X_mg_rule_scroll_text, Rule_names, &Mg_rule_start_pos);
        break;
    case X_mg_rule_remove_button:
        list_remove (X_mg_rule_sel_list);
        break;
    case X_mg_rule_clear_button:
        XmListDeleteAllItems ( XwuWidget (X_mg_rule_sel_list) );
        break;
    case X_mg_rule_info_list:
        list_select (X_mg_rule_sel_list, X_mg_rule_info_list, 
                     X_mg_rule_scroll_text);
        break;
    case X_mg_rule_scroll_text:
        list_scroll(X_mg_rule_info_list, X_mg_rule_scroll_text,
                    Rule_names, &Mg_rule_start_pos);
        break;

    case X_mg_trans_add_text:
        list_add (X_mg_trans_sel_list, X_mg_trans_info_list,
                  X_mg_trans_scroll_text, Trans_names, &Mg_trans_start_pos);
        break;
    case X_mg_trans_remove_button:
        list_remove (X_mg_trans_sel_list);
        break;
    case X_mg_trans_clear_button:
        XmListDeleteAllItems ( XwuWidget (X_mg_trans_sel_list) );
        break;
    case X_mg_trans_info_list:
        list_select (X_mg_trans_sel_list, X_mg_trans_info_list, 
                     X_mg_trans_scroll_text);
        break;
    case X_mg_trans_scroll_text:
        list_scroll(X_mg_trans_info_list, X_mg_trans_scroll_text,
                    Trans_names, &Mg_trans_start_pos);
        break;
    }
}

static void list_add (list_id, info_list_id, line_text_id,
                      list_names, p_start_pos)
    Xid        list_id;
    Xid        info_list_id;
    Xid        line_text_id;
    char       **list_names;
    int        *p_start_pos;
{
    char       *p_str;
    XmString   x_str;
    Widget     w1, w2;

    w1 = XwuWidget (line_text_id);
    w2 = XwuWidget (list_id);
    p_str = XmTextGetString ( w1 );
    convert_string (p_str);
    if ( strcmp (p_str, "") != 0 ) {
        if ( strncmp (p_str, list_names[*p_start_pos], strlen(p_str)) == 0 ) {
            p_str = list_names[*p_start_pos];
        }
        x_str = XwuStrToXstr ( p_str );
        if ( ! XmListItemExists ( w2, x_str ) &&
             XmListItemExists (XwuWidget (info_list_id), x_str)) {
            XmListAddItemUnselected ( w2, x_str, 0);
            XmListSetBottomItem ( w2, x_str );
        }
        XmTextSetString ( w1, "" );
        *p_start_pos = 0;
    }
    XtFree (p_str);
    if (!XmProcessTraversal (w1, XmTRAVERSE_CURRENT)) {
        XwuError ("Traversal not successfull");
    }
}

static void list_remove (list_id)
    Xid        list_id;
{
    Widget     w;
    int        *p_pos_list;
    int        count, i;

    w = XwuWidget (list_id);
    if ( XmListGetSelectedPos (w, &p_pos_list, &count) ) {
        for ( i = 0; i < count; i++ ) {
            XmListDeletePos ( w, p_pos_list[i] - i );
        }
        XtFree (p_pos_list);
    }
}

static void list_select (list_id, info_list_id, line_text_id)
    Xid        list_id;
    Xid        info_list_id;
    Xid        line_text_id;
{
    int             count;
    Widget          w1, w2, w3;
    XmString        x_str;
    XmStringTable   str_table;

    w1 = XwuWidget (line_text_id);
    w2 = XwuWidget (list_id);
    w3 = XwuWidget (info_list_id);
    XtVaGetValues( w3, XmNselectedItems, &str_table,
                      XmNselectedItemCount, &count, NULL );
    if ( count > 0 ) {
        x_str = str_table[0];
        if ( ! XmListItemExists ( w2, x_str ) ) {
            XmListAddItemUnselected ( w2, x_str, 0);
            XmListSetBottomItem ( w2, x_str );
        }
        XmTextSetString ( w1, "" );
    
        if (!XmProcessTraversal (w1, XmTRAVERSE_CURRENT)) {
	        XwuError ("Traversal not successfull");
        }
    }
    XtFree (str_table);
}

static void list_scroll (info_list_id, line_text_id,
                         list_names, p_start_pos)
    Xid        info_list_id;
    Xid        line_text_id;
    char       **list_names;
    int        *p_start_pos;
{
    char       *p_str;
    int        slen, i, result, old_pos;
    Boolean    found;

    p_str = XmTextGetString ( XwuWidget (line_text_id) );
    convert_string (p_str);
    if ( strcmp (p_str, "") != 0 ) {
        slen = strlen(p_str);
        old_pos = *p_start_pos;
        if ( strncmp ( p_str, list_names[*p_start_pos], slen ) <= 0 ) {
            *p_start_pos = 0;
        }
        found = FALSE;           
        for ( i = *p_start_pos; list_names[i] != NULL; i++ ) {
            result = strncmp (p_str, list_names[i], slen);
            if ( result <= 0 ) {
                if ( result == 0 ) {
                    found = TRUE;
                }
                break;
            }
        }
        if ( ! found ) {
            XBell(XwuDisplay(), 100);
            *p_start_pos = old_pos;

            p_str = XmTextGetString ( XwuWidget (line_text_id) );
            p_str[slen - 1] = '\0';
            XmTextSetString (XwuWidget (line_text_id), p_str);
            XmTextSetInsertionPosition (XwuWidget (line_text_id), slen -1);
        }
        else {
            XmListSetPos(XwuWidget (info_list_id), i+1);
            *p_start_pos = i;
        }
    }
    XtFree (p_str);
}

static void  convert_string (p_str)
    char   *p_str;
{
    int   i;

    for ( i = 0; i < strlen(p_str); i++) {
        p_str[i] = toupper (p_str[i]);
    }
}

static void  read_file (p_filename, pp_array, p_x_array, p_len)
    char      *p_filename;
    char      **pp_array;
    XmString  *p_x_array;
    int       *p_len;
{
    FILE           *p_file;
    struct stat    statbuf;
    int            file_length;
    char           *p_file_string, *p_old_str, *p_new_str;
    char           name [100];

    /* open the file and determine its length
     */
    strcpy (name, XwuHelpDirName ());
    strcat (name, p_filename);
    if ( (p_file = fopen (name, "r" )) == NULL ) {
        XwuError ("Cannot open list file");
        return;
    }
    if ( stat (name, &statbuf) == 0 ) {
        file_length = statbuf.st_size;
    }
    else {
        XwuError ("file info error");
        return;
    }

    /* allocate space for the file, read the file into a string
     * and close the file again
     */
    p_file_string = (char *) malloc ((unsigned) file_length + 1);
    fread (p_file_string, sizeof(char), file_length, p_file);
    *(p_file_string+file_length) = '\0';
    if ( fclose (p_file) != NULL ) {
        XwuError ("Cannot close list file");
    }

    /* Every \n in the file-string is now replaced with a \0 and
     * the string-pointers in the array point to the positions right after every \0
     */
    *p_len = 0;
    p_old_str = p_file_string;
    while ( (p_new_str = strchr (p_old_str, '\n')) != NULL &&
            *p_len < XWL_MAX_LIST_LENGTH ) {
        *p_new_str = '\0';
        pp_array[*p_len] = p_old_str;
        p_x_array[*p_len] = XwuStrToXstr (p_old_str);
        (*p_len)++;
        p_old_str = p_new_str + 1;
    }
    if ( *p_len >= XWL_MAX_LIST_LENGTH ) {
        XwuError ("exceeded maximum list length");
    }
    pp_array[*p_len] = p_old_str;
    p_x_array[*p_len] = XwuStrToXstr (p_old_str);
    (*p_len)++;
    
    pp_array[*p_len] = NULL;
    p_x_array[*p_len] = NULL;

}		/* end of read_file */
