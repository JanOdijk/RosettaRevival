/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Sockipc
 *  Creation date   : 1991-08-21
 *  Author          : H. M. M. van de Schoot
 *
 *  Copyright (c) 1991, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : C definition of Sockipc module interface
 *
 *EMP:::===================================================================*/

#ifndef _SOCKIPC_H
#define _SOCKIPC_H


/*=========================================================================*
 *  Imported modules
 *=========================================================================*/

#include "paspar.h"

/*MPF:::===================================================================*
 *
 *  Procedure Name  : SOCKIPC_connect
 *  Description     :
 *  Parameters      :
 *  Precondition    :
 *  Postcondition   :
 *  Side Effects    :
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
SOCKIPC_set_port, (int port, int id));

extern int FUNCDEF (
SOCKIPC_get_port, (int id));

extern int FUNCDEF (
SOCKIPC_connect, (int id));

extern int FUNCDEF (
SOCKIPC_bind, (int id));

extern int FUNCDEF (
SOCKIPC_accept, (int sock));

extern int FUNCDEF (
SOCKIPC_close, (int sock));

#endif /* _SOCKIPC_H */
