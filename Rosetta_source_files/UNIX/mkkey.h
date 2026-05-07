/*MPD:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : mkkey
 *  Creation date   : 1991-02-07
 *  Author          : H. M. M. van de Schoot
 *                                                                  
 *  Copyright (c) 1991, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : Definitions and functions for Pascal parameters
 *		      in C functions
 *
 *EMP:::===================================================================*/

#ifndef _MKKEY_H
#define _MKKEY_H

#include "sys/types.h"

/*MPF:::===================================================================*
 *
 *  Function Name  : MKK_make_filename
 *  Description    : Make a unique filename 
 *  Parameters     : facility : printable character; it identifies the
 *                       the facility (or module); all facilities in one
 *                       application must have a different character
 *                   name : name of item within facility 
 *                          (must be unique within facility)
 *  Result         : pointer to a filename
 *  Precondition   : facility is unique within the application, id is unique
 *                   within the facility
 *  Postcondition  : the result of the function is a unique filename
 *
 *EMP:::===================================================================*/

extern char * FUNCDEF (
MKK_make_filename, (int facility, char *name));

#endif /* _MKKEY_H */
