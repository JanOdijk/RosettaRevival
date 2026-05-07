/*MPD:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : GLOBDEF
 *  Creation date   : 91-02-06
 *  Author          : H. M. M. van de Schoot
 *                                                                  
 *  Copyright (c) 1991, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : Contains globally available constants and types.
 *
 *EMP:::===================================================================*/

#ifndef _GLOBDEF_H
#define _GLOBDEF_H

/*=========================================================================*
 *  Imported modules
 *=========================================================================*/


/*MPC:::===================================================================*
 *
 *  Constant name  : GLOBDEF_maxstring
 *  Description    : Defines the maximum number of characters to be used for
 *                   strings
 *
 *EMP:::===================================================================*/

#define		GLOBDEF_maxstring	100

/*MPC:::===================================================================*
 *
 *  Constant name  : GLOBDEF_maxlogname
 *  Description    : Defines the maximum number of characters to be used for
 *                   logical name strings
 *
 *EMP:::===================================================================*/

#define		GLOBDEF_maxlogname	63

/*MPC:::===================================================================*
 *
 *  Constant name  : GLOBDEF_maxfilename
 *  Description    : Defines the maximum number of characters to be used for
 *                   file name strings
 *
 *EMP:::===================================================================*/

#define		GLOBDEF_maxfilename	GLOBDEF_maxstring

/*MPC:::===================================================================*
 *
 *  Constant name  : GLOBDEF_maxwordchar
 *  Description    : Definition of the maximum number of characters to be
 *                   used in one word ( without blanks )
 *
 *EMP:::===================================================================*/

#define		GLOBDEF_maxwordchar	50


/*MPT:::===================================================================*
 *
 *  Type name      : GLOBDEF_status
 *  Description    : Definition of possible status values which can
 *                   be returned by operating system dependent functions
 *
 *EMP:::===================================================================*/

typedef enum {
	successful, notsuccessful
}
	GLOBDEF_status;

       
/*MPT:::===================================================================*
 *
 *  Type name      : GLOBDEF_yntype
 *  Description    : 
 *
 *EMP:::===================================================================*/

typedef enum {
	GLOBDEF_yes, GLOBDEF_no
}
	GLOBDEF_yntype;

/*MPT:::===================================================================*
 *
 *  Type name      : GLOBDEF_leveltype
 *  Description    : Definition of the interface levels of the Rosetta
 *                   system.
 *                 -1:alayout:0:amorph:1:sparser:2:mparser:3:atransfer:4:
 *                  4:gtransfer:5:mgenerator:6:linearizer:7:gmorph:8:glayout:9
 *EMP:::===================================================================*/

typedef short int 	GLOBDEF_leveltype; /* -1..9 */


/*MPT:::===================================================================*
 *
 *  Type name      : GLOBDEF_AnGenMode
 *  Description    : Can be used for determining the current executable
 *
 *EMP:::===================================================================*/

typedef enum {
	anmode, genmode, controlmode
}
	GLOBDEF_AnGenMode;


/*MPT:::===================================================================*
 *
 *  Type name      : GLOBDEF_InteractionMode
 *  Description    : Determines whether the system runs in interactive mode
 *                   or not
 *
 *EMP:::===================================================================*/

typedef Boolean GLOBDEF_InteractionMode;

#endif /* _GLOBDEF_H */
