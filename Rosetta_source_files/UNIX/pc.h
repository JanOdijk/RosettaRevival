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
 *  Remarks         : All functions of this module are operating sysem
 *                    dependent. Consequently, they have to be rewritten if
 *                    the system is transported to another opreating system
 *
 *EMP:::===================================================================*/

#ifndef _PC_H
#define _PC_H

/*=========================================================================*
 *  Imported modules
 *=========================================================================*/

#include "globdef.h"
#include "paspar.h"

/*MPC:::===================================================================*
 *
 *  Constant name  : PC_maxprocname
 *  Description    : Defines the maximum number of characters to be used for
 *                   a process name.
 *
 *EMP:::===================================================================*/

#define		PC_maxprocname		15


/*MPF:::===================================================================*
 *
 *  Function Name  : PC_create
 *  Description    : Creates a subprocess for the current process. The sub-
 *                   process has the same I/O devices as the current process.
 *                   !! This function is operating system dependent !!
 *  Parameters     : process : String that contains the name of the process
 *                             to be created. 
 *                   image   : Full file specification of the image file to 
 *                             be executed. If the image name is a logicale
 *                             name string, it will be translated.
 *                   arg1, arg2 : arguments for image
 *  Result         : status  : Status value, which indicates whether the
 *                             creation of the subprocess was successful.
 *                             (cf. GLOBDEF_status )  
 *  Precondition   : There is no current subprocess with the same name. 
 *  Postcondition  : A subprocess exists with name "<terminal_ID>.<process>"
 *  Side Effects   : A subprocess has been created with name 
 *                   "<terminal_ID>.<process>"
 *
 *EMP:::===================================================================*/

extern GLOBDEF_status FUNCDEF (
PC_create, (
	PPC_string *p_process,
	PPC_string *p_image,
	PPC_string *p_arg1,
	PPC_string *p_arg2));


/*MPF:::===================================================================*
 *
 *  Function Name  : PC_terminate
 *  Description    : Prepares process for image exit and enables sub-
 *                   processes of the current process to complete their
 *                   preparations for image exit. 
 *                   !! This function is operating system dependent !!
 *  Parameters     : none
 *  Result         : status  : Status value, which indicates whether the
 *                             creation of the subprocess was successful.
 *                             (cf. GLOBDEF_status )  
 *  Precondition   : Call to this function is the last statement of the 
 *                   program.
 *  Postcondition  : Process is ready to exit.
 *
 *EMP:::===================================================================*/

extern GLOBDEF_status FUNCDEF (
PC_terminate, (void));


/*MPF:::===================================================================*
 *
 *  Function Name  : PC_kill
 *  Description    : Kills a subprocess of the current process. 
 *                   !! This function is operating system dependent !!
 *  Parameters     : process : String that contains the name of the process
 *                             to be killed. 
 *  Result         : status  : Status value, which indicates whether the
 *                             killing of the subprocess was successful.
 *                             (cf. GLOBDEF_status )  
 *  Precondition   : There is one current subprocess with the specified name
 *  Postcondition  : There is no subprocess with the specified name.
 *  Side Effects   : Subprocess with name "<terminal_ID>.<process>" has been 
 *                    deleted
 *                   
 *
 *EMP:::===================================================================*/

extern GLOBDEF_status FUNCDEF (
PC_kill, (
	PPC_string *p_process));

#endif /* _PC_H */
