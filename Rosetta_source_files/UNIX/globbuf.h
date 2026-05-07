/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : GLOBBUF
 *  Creation date   : 1991-02-07
 *  Author          : H. M. M. van de Schoot
 *
 *  Copyright (c) 1991, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : C definition of GLOBBUF module interface
 *
 *EMP:::===================================================================*/

#ifndef _GLOBBUF_H
#define _GLOBBUF_H

/*=========================================================================*
 *  Imported modules
 *=========================================================================*/

#include <sys/types.h>
#include "paspar.h"

/*MPT:::===================================================================*
 *
 *  Type name      : GLOBBUF_Status
 *  Description    : 
 *
 *EMP:::===================================================================*/

typedef enum {
	GLOBBUF_NoError, 
	GLOBBUF_Error
}
	GLOBBUF_Status;

/*MPF:::===================================================================*
 *
 *  Procedure Name  : GLOBBUF_CreateBuffer
 *  Description     : 
 *  Parameters      : 
 *  Precondition    : 
 *  Postcondition   : 
 *  Side Effects    : 
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
GLOBBUF_createbuffer, (
	PPC_string *p_name,
	int byteSize,
	caddr_t *p_startAddress));


/*MPF:::===================================================================*
 *
 *  Procedure Name  : GLOBBUF_RemoveBuffer
 *  Description     : 
 *  Parameters      : 
 *  Precondition    : 
 *  Postcondition   : 
 *  Side Effects    : 
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
GLOBBUF_removebuffer, (
	PPC_string *p_name));


/*MPF:::===================================================================*
 *
 *  Procedure Name  : GLOBBUF_RemoveAllBuffers
 *  Description     : 
 *  Parameters      : 
 *  Precondition    : 
 *  Postcondition   : 
 *  Side Effects    : 
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
GLOBBUF_removeallbuffers, (void));


/*MPF:::===================================================================*
 *
 *  Function Name  : GLOBBUF_GetStatus
 *  Description    : 
 *  Parameters     : 
 *  Result         : 
 *  Precondition   : 
 *  Postcondition  : 
 *  Side Effects   : 
 *
 *EMP:::===================================================================*/

extern GLOBBUF_Status FUNCDEF (
GLOBBUF_getstatus, (void));


/*MPF:::===================================================================*
 *
 *  Function Name  : GLOBBUF_GetIntegerStatus
 *  Description    : 
 *  Parameters     : 
 *  Result         : 
 *  Precondition   : 
 *  Postcondition  : 
 *  Side Effects   : 
 *
 *EMP:::===================================================================*/

extern int FUNCDEF (
GLOBBUF_getintegerstatus, (void));

#endif /* _GLOBBUF_H */
