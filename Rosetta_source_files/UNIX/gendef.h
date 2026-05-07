/*MPD:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : PC 
 *  Creation date   : 1991-02-06                                              
 *  Author          : H. M. M. van de Schoot
 *                                                                  
 *  Copyright (c) 1991, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : This .h file defines some special constants and types
 *                    it should be included as first .h file in any .c file
 *
 *EMP:::===================================================================*/

#ifndef _GENDEF_H
#define _GENDEF_H

#ifdef sparc

#include <stdio.h>
#include <limits.h>
#include <string.h>
#include <malloc.h>
#include <assert.h>
#include <stdlib.h>

/* define access for read/write for owner and group */

#include <sys/stat.h>

#define O_RW S_IRUSR | S_IWUSR
#define G_RW S_IRGRP | S_IWGRP

/* 
 * define macro FUNCDEF according to CST definition
 * (FUNCDEF is used to turn function prototyping on or off)
*/

#define FUNCDEF(func, pars) func ()

#ifdef MIN
#undef MIN
#endif
#define MIN(a,b)   ( (a < b) ? (a) : (b) )

#ifdef MAX
#undef MAX
#endif
#define MAX(a,b)   ( (a > b) ? (a) : (b) )

#define INT_MAX_LENGTH 10

/* Define Boolean type: can have values TRUE and FALSE
 * Only to be defined outside X ( X already defines booleans )
 */

#ifndef _XtIntrinsic_h
typedef char Boolean;

#ifdef TRUE
#undef TRUE
#endif
#define TRUE 1

#ifdef FALSE
#undef FALSE
#endif
#define FALSE 0

#endif /* _XtIntrinsic_h */

#endif /* sparc */

#endif /* _GENDEF_H */
