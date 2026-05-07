/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Wipc
 *  Creation date   : 1991-04-17
 *  Author          : H. M. M. van de Schoot
 *
 *  Copyright (c) 1991, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : C definition of Wipc module interface
 *
 *EMP:::===================================================================*/

#ifndef _WIPC_H
#define _WIPC_H


/*=========================================================================*
 *  Imported modules
 *=========================================================================*/

#include "paspar.h"

typedef struct Wipc_type *WIPC;

/*MPF:::===================================================================*
 *
 *  Procedure Name  : WIPC_connect
 *  Description     :
 *  Parameters      :
 *  Precondition    :
 *  Postcondition   :
 *  Side Effects    :
 *
 *EMP:::===================================================================*/

extern int FUNCDEF (
WIPC_connect, (WIPC *p_msg_id));

extern int FUNCDEF (
WIPC_bind, (WIPC *p_msg_id));

extern int FUNCDEF (
WIPC_accept, (WIPC msg_id, WIPC *p_msg_id));

extern int FUNCDEF (
WIPC_close, (WIPC msg_id));

extern int FUNCDEF (
WIPC_send, (WIPC msg_id, caddr_t msg, int size));

extern int FUNCDEF (
WIPC_receive, (WIPC msg_id, caddr_t msg, int max_size, 
              int *p_size, int *p_remains));

extern int FUNCDEF (
WIPC_fileno, (WIPC msg_id));

#endif /* _WIPC_H */
