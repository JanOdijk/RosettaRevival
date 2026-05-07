/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : WCH: Window Command Handler
 *  Creation date   : 1991-05-01
 *  Author          : H. M. M. van de Schoot
 *
 *  Copyright (c) 1991, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : C definition of WCH module interface
 *
 *EMP:::===================================================================*/

#ifndef _WCH_H
#define _WCH_H


/*=========================================================================*
 *  Imported modules
 *=========================================================================*/

#include "paspar.h"
#include "wipc.h"

/* definition of WCH messages */

#include "wchdef.h"

typedef int WCH_msg_id;

typedef int WCH_vt_id;		/* can have WCH_vt_id_values values */


/*MPF:::===================================================================*
 *
 *  Procedure Name  : WCH_connect
 *  Description     :
 *  Parameters      :
 *  Precondition    :
 *  Postcondition   :
 *  Side Effects    :
 *
 *EMP:::===================================================================*/

extern Boolean FUNCDEF (
WCH_get_boolean, (Boolean *p_bool));

extern Boolean FUNCDEF (
WCH_get_id, (int *p_id));

extern Boolean FUNCDEF (
WCH_get_integer, (int *p_int));

extern Boolean FUNCDEF (
WCH_get_message_id, (WCH_msg_id *p_msg_id));

extern Boolean FUNCDEF (
WCH_get_string, (char **pp_str));

extern Boolean FUNCDEF (
WCH_get_pstring, (PPC_string *p_str, int max_pstring_len));

extern Boolean FUNCDEF (
WCH_put_boolean, (Boolean bool));

extern Boolean FUNCDEF (
WCH_put_id, (int id));

extern Boolean FUNCDEF (
WCH_put_integer, (int i));

extern Boolean FUNCDEF (
WCH_put_message_id, (WCH_msg_id msg_id));

extern Boolean FUNCDEF (
WCH_put_string, (char *p_str));

extern Boolean FUNCDEF (
WCH_put_pstring, (PPC_string *p_str));

extern Boolean FUNCDEF (
WCH_receive, (WIPC msg_id));

extern Boolean FUNCDEF (
WCH_send, (WIPC msg_id));

#endif /* _WCH_H */
