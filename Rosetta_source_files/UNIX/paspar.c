/*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : PPC
 *  Creation date   : 1991-02-07
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

#include "gendef.h"
#include "paspar.h"

/*----------------------------------------------------------------------
 * local types and variables
 *----------------------------------------------------------------------*/


/*----------------------------------------------------------------------*
 * Exported function PPC_to_string
 *----------------------------------------------------------------------*/

char * PPC_to_string (p_s)
    PPC_string *p_s;
{
    char *p_string;

/*
 *      allocate space for string plus terminating '\0'
 */
    p_string = (char *) malloc (p_s->len + 1);
    strncpy (p_string, p_s->data, p_s->len);
    p_string [p_s->len] = '\0';
    return p_string;

}            /* end PPC_to_string */


/*----------------------------------------------------------------------*
 * Exported function PPC_from_string
 *----------------------------------------------------------------------*/

void PPC_from_string (p_pstring, max_pstring_len, p_string)
    PPC_string *p_pstring;
    int max_pstring_len;
    char *p_string;
{
    int len = MIN(strlen (p_string), max_pstring_len);

    p_pstring->len = len;
    strncpy (p_pstring->data, p_string, len);

}            /* end PPC_from_string */

