/*MPD:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : MB 
 *  Creation date   : 1991-02-07
 *  Author          : H. M. M. van de Schoot
 *                                                                  
 *  Copyright (c) 1991, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : C specification of MB module interface 
 *
 *EMP:::===================================================================*/

#ifndef _MB_H
#define _MB_H

/*=========================================================================*
 *  Imported modules
 *=========================================================================*/

#include "globdef.h"
#include "paspar.h"


/*MPC:::===================================================================*
 *
 *  Constant name  : MB_maxnumberofmailboxes
 *  Description    : Defines the maximum number of mailboxes to be used
 *                   by one process
 *
 *EMP:::===================================================================*/

#define    MB_maxnumberofmailboxes        7

/*MPC:::===================================================================*
 *
 *  Constant name  : MB_maxmbxname
 *  Description    : maximum number of characters to be used for mailboxname
 *
 *EMP:::===================================================================*/

#define    MB_maxmbxname            	  15

/*MPT:::===================================================================*
 *
 *  Type name      : MB_clienttype
 *  Description    : Definition of the different clients
 *
 *EMP:::===================================================================*/ 

typedef enum {
    rosetta, 
    lexed
}
    MB_clienttype;


/*MPT:::===================================================================*
 *
 *  Type name      : MB_actiontype
 *  Description    : Definition of the different edit actions
 *
 *EMP:::===================================================================*/ 

typedef enum {
    exitlexed, 
    editlemmas, 
    showtranslation, 
    searchtranslation, 
    selectmkey
}
    MB_actiontype;

/*MPT:::===================================================================*
 *
 *  Type name      : MB_languagetype
 *  Description    : Definition of the different language
 *
 *EMP:::===================================================================*/ 

typedef enum {
    dutch, 
    english, 
    spanish
}
    MB_languagetype;

/*MPT:::===================================================================*
 *
 *  Type name      : MB_msgtype
 *  Description    : Definition of the different types of messages
 *
 *EMP:::===================================================================*/ 

typedef enum {
    startmessage, 
    stopmessage, 
    ILFinished, 
    AmbigInfo,
    ILNextSyn, 
    ILNextLexSense, 
    ILNextStructSense,
    EmptyAnResult, 
    CorrectAnResult, 
    Crashed
}
    MB_msgtype;

/*MPT:::===================================================================*
 *
 *  Type name      : MB_communicationblock
 *  Description    : Defines the layout of the messages which will be used
 *                   by the Rosetta system
 *
 *EMP:::===================================================================*/

#define SIZEOF_MB_COMMUNICATIONBLOCK	37	/* size as defined in mb.pf !! */

typedef struct {
    int wndport;			/* only field used in C functions */
    MB_clienttype client;
}
    MB_communicationblock;

/*MPT:::===================================================================*
 *
 *  Type name      : MB_accesstype
 *  Description    : Defines the different ways of mailbox access.
 *
 *EMP:::===================================================================*/

typedef enum {
    takeaccess, 
    putaccess
}
    MB_accesstype;

/*MPT:::===================================================================*
 *
 *  Type name      : MB_mbxid
 *  Description    : 
 *
 *EMP:::===================================================================*/

typedef int MB_mbxid; /* = 1..MB_maxnumberofmailboxes */



/*MPP:::===================================================================*
 *
 *  Procedure Name : MB_init
 *  Description    : Initializes MB package.
 *  Parameters     : maxMessageLength: maximum length of any message for
 *                   the mailboxes
 *                   create : when yes, this process creates all mailboxes
 *                   when no, this process only uses existing mailboxes
 *  Precondition   : MB package may not yet have been initialized.
 *  Postcondition  : All MB functions are now ready to be used
 *
 *EMP:::===================================================================*/

extern void FUNCDEF (
MB_init, (int max_message, GLOBDEF_yntype create));


/*MPF:::===================================================================*
 *
 *  Function Name  : MB_OPEN
 *  Description    : Opens mailbox <mbx_name> for usage by the current
 *                   process. 
 *                   !! The implementation of this function is highly operating
 *                   system dependent.!!
 *  Parameters     : mbxname: string which identifies the mailbox.
 *                   access : defines whether the mailbox will be used for 
 *                            "taking" or "putting" 
 *                   var mbx_id : unique specification of the mailbox, to be
 *                                in subsequent mailbox function calls.
 *  Result         : Status which indicates whether open action was
 *                   successful.
 *  Precondition   : If the mailbox has to be created, there may not
 *                   already be a mailbox in the system with the same name.
 *                   If an existing mailbox will be used, this mailbox must
 *                   exist (sic!).
 *  Postcondition  : IF <create> THEN 
 *                      mailbox <mbxname> created with access <access>
 *                   ELSE
 *                      mailbox <mbxname> opened for useage with access 
 *                      <access>
 *  Side Effects   : 
 *
 *EMP:::===================================================================*/

extern GLOBDEF_status FUNCDEF (
MB_open, (
    PPC_string     *p_mbxname,
    MB_accesstype  access,
    MB_mbxid       *p_mbxid));




/*MPF:::===================================================================*
 *
 *  Function Name  : MB_CLOSE
 *  Description    : Closes mailbox <mbx_name> for usage by the current
 *                   process. 
 *                   !! The implementation of this function is highly operating
 *                   system dependent.!!
 *  Parameters     : mbxid : unique identification of the mailbox.
 *                   delete : specifies whether the mailbox must be deleted
 *                            or not.
 *  Result         : Status which indicates, whether close action was 
 *                   successful.  
 *  Precondition   : IF <delete> THEN 
 *                      mailbox <mbxname> has been opened and created 
 *                      by current process.
 *                   ELSE 
 *                      mailbox <mbxname> has been opened by current process. 
 *  Postcondition  : IF <delete> THEN 
 *                      mailbox <mbxname> deleted
 *                   ELSE
 *                      mailbox <mbxname> closed for useage 
 *  Side Effects   : 
 *
 *EMP:::===================================================================*/

extern GLOBDEF_status FUNCDEF (
MB_close, (
    MB_mbxid       mbxid,
    GLOBDEF_yntype delete));


/*MPF:::===================================================================*
 *
 *  Function Name  : MB_TAKE
 *  Description    : The function takes a message out of the mailbox. This 
 *                   message has a fixed layout. The mailbox will be big 
 *                   enough to contain one message. If there is no message in 
 *                   the specified mailbox, the current process is suspended 
 *                   until a message arrives. In the other case the function 
 *                   immediately returns control.
 *                   !! The implementation of this function is highly operating
 *                   system dependent.!!
 *  Parameters     : mbxid : unique identification of the mailbox. 
 *                   var message: parameter to which the message will be 
 *                                assigned. 
 *  Result         : Status which indicates, whether take action was 
 *                   successful.  
 *  Precondition   : mailbox <mbxname> has been opened by current process with
 *                   read access.
 *  Postcondition  : <message> contains the received communicationblock
 *
 *EMP:::===================================================================*/

extern GLOBDEF_status FUNCDEF (
MB_take, (
    MB_mbxid    mbxid,
    MB_communicationblock *p_message));


/*MPF:::===================================================================*
 *
 *  Function Name  : MB_PUT
 *  Description    : The function puts a message into the mailbox. This 
 *                   message has a fixed layout. The mailbox will be big 
 *                   enough to contain one message. 
 *                   The current process is suspended 
 *                   until the message is read by the receiving process. 
 *                   !! The implementation of this function is highly operating
 *                   system dependent.!!
 *  Parameters     : mbxid: unique identification of the mailbox
 *                   message: parameter which contains the message that will be
 *                            put into the mailbox.
 *  Result         : Status which indicates, whether put action was 
 *                   successful.  
 *  Precondition   : mailbox <mbxname> has been opened by current process with
 *                   write access. 
 *                   mailbox <mbxname> contains no message.
 *  Postcondition  : <message> has been sent to mailbox <mbxname>
 *
 *EMP:::===================================================================*/

extern GLOBDEF_status FUNCDEF (
MB_put, (
    MB_mbxid    mbxid,
    MB_communicationblock *p_message));

#endif /* _MB_H */
