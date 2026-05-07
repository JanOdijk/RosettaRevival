/*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : mkkey
 *  Creation date   : 1991-02-08
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

#include <fcntl.h>
#include <sys/types.h>
#include "gendef.h"
#include "mkkey.h"
#include "logc.h"

/*----------------------------------------------------------------------
 * local types and variables
 *----------------------------------------------------------------------*/


/*----------------------------------------------------------------------*
 * exported function MKK_make_filename
 *----------------------------------------------------------------------*/

char * MKK_make_filename (facility, name)
    int facility;
    char *name;
{
/*
 *  a filename is constructed as follows:
 *
 *     ./.Ros<facility><name>.<groupid>
 *
 * .<groupid> is added to distinguish between sessions under the same user;
 *
 * when facility == 'S' and name == "MBX1" and groupid == 123
 * then the following file is used
 *
 *     ./.RosSMBX1.123
 *
 */

    static char filename [100];
    char filename1 [100];
    int len;

    strcpy (filename1, "./.Ros");
    len = strlen (filename1);
    filename1 [len] = facility;
    filename1 [len+1] = 0;
    strcat (filename1, name);
    sprintf (filename, "%s.%d", filename1, getpgrp (0));
    return filename;

}            /* end of MKK_make_filename */
