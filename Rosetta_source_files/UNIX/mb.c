/*MPD:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : MB 
 *  Creation date   : 1991-02-08
 *  Author          : H. M. M. van de Schoot
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : C implementation of MB module
 *
 *EMP:::===================================================================*/

/*=========================================================================*
 *  Imported modules
 *=========================================================================*/

#include "gendef.h"
#include "mb.h"
#include <errno.h>
#include "globdef.h"
#include "paspar.h"
#include "sockipc.h"
#include "logc.h"

/*=========================================================================*
 *  Module specific types and static variables
 *=========================================================================*/

typedef struct {
    char name [MB_maxmbxname+1];
    MB_accesstype access;
    int sock;	/* socket of connection */
}
    Mailbox_info;


static Mailbox_info Mailbox [MB_maxnumberofmailboxes+1]; /* entry 0 not used */
static int Max_mailbox = 0;

static int Max_message_length;

static Boolean Creator;

static char Ack_buffer [1] = '@';	/* acknowledge character */

/* THE socket: set by owner of mailbox(es) */
static int Socket = -1;

static GLOBDEF_status FUNCDEF (
check_mailbox, (
    MB_mbxid mbxid,
    ));

static GLOBDEF_status FUNCDEF (
add_mailbox, (
    char      *p_mbxname,
    MB_mbxid  *p_mbxid));

static void FUNCDEF (
delete_mailbox, (MB_mbxid mbxid));


/*=========================================================================*
 *  Exported function MB_init
 *=========================================================================*/

void MB_init (max_message, create)
    int max_message;
    GLOBDEF_yntype create;
{
    if (max_message > 0 && max_message != SIZEOF_MB_COMMUNICATIONBLOCK) {
        fprintf (stderr, "Incorrect SIZEOF_MB_COMMUNICATIONBLOCK defined in mb.h");
    }
    Max_message_length = (max_message == 0) ? 
                          SIZEOF_MB_COMMUNICATIONBLOCK : max_message;
    Creator = (create == GLOBDEF_yes);
    if (Creator) {
        Socket = SOCKIPC_bind (1);
    }
#if DEVELOPMENT
    { char s[100]; sprintf (s, "MB_init: messagelength = %d", max_message); logc (s); }
#endif

}            /* end of MB_init */


/*=========================================================================*
 *  Exported function MB_open
 *=========================================================================*/


GLOBDEF_status MB_open (p_mbxname, access, p_mbxid)
    PPC_string     	*p_mbxname;
    MB_accesstype       access;
    MB_mbxid            *p_mbxid;
{

    return add_mailbox (PPC_to_string (p_mbxname), access, p_mbxid);

}            /* end of MB_open */


/*=========================================================================*
 *  Exported function MB_close
 *=========================================================================*/

GLOBDEF_status MB_close (mbxid, delete)
        MB_mbxid        mbxid;
        GLOBDEF_yntype  delete;
{
    GLOBDEF_status res;

    res = check_mailbox (mbxid);
    if (res == successful) {
        if (delete == GLOBDEF_yes) {
            if (Creator) {
		SOCKIPC_close (Mailbox[mbxid].sock);
            }
            else {
                fprintf (stderr, "MB_close: not owner\n");
                res = notsuccessful;
            }
        }
        else {
            if (Creator) {
                fprintf (stderr, "MB_close: owner, so delete\n");
                res = notsuccessful;
            }
        }
        delete_mailbox (mbxid);
    }
    return res;

}            /* end of MB_close */


/*=========================================================================*
 *  Exported function MB_take
 *=========================================================================*/

GLOBDEF_status MB_take (mbxid, p_message)
    MB_mbxid        mbxid;
    MB_communicationblock *p_message;
{
    GLOBDEF_status res;
    int n;

    res = check_mailbox (mbxid);
    if (res == successful) {
        if (Mailbox[mbxid].access == takeaccess) {
            if (Mailbox[mbxid].sock < 0) {
	        Mailbox[mbxid].sock = Setup_communication ();
	    }
            if (Mailbox[mbxid].sock < 0) {
	        res = notsuccessful;
	    }
	    else {
	        n = read (Mailbox[mbxid].sock, p_message, Max_message_length);
		if (n < 0) {
		    res = notsuccessful;
		}
		else {
		    n = write (Mailbox[mbxid].sock, Ack_buffer, 1);
                    if (n < 0) {
                        res = notsuccessful;
                    }
#ifdef DEVELOPMENT
                    else {
                        print_message (p_message, "Take", Mailbox[mbxid].name);
                    }
#endif
                }
            }
        }
        else {
            fprintf (stderr, "MB_take: no take access\n");
            res = notsuccessful;
        }
    }
    return res;

}            /* end of MB_take */


/*=========================================================================*
 *  Exported function MB_put
 *=========================================================================*/

GLOBDEF_status MB_put (mbxid, p_message)
    MB_mbxid        mbxid;
    MB_communicationblock *p_message;
{
    GLOBDEF_status res;
    int n;
    char buff [1];

#ifdef DEVELOPMENT			/* print message buffer */
    print_message (p_message, "Put ", Mailbox[mbxid].name);
#endif
    res = check_mailbox (mbxid);
    if (res == successful) {
        if (Mailbox[mbxid].access == putaccess) {
            if (Mailbox[mbxid].sock < 0) {
	        Mailbox[mbxid].sock = Setup_communication ();
	    }
            if (Mailbox[mbxid].sock < 0) {
	        res = notsuccessful;
	    }
	    else {
	        n = write (Mailbox[mbxid].sock, p_message, Max_message_length);
		if (n < 0) {
		    res = notsuccessful;
		}
		else {
		    n = read (Mailbox[mbxid].sock, buff, 1);
		    if (n < 0 || buff [0] != Ack_buffer [0]) {
		        res = notsuccessful;
		    }
                }
            }
        }
        else {
            fprintf (stderr, "MB_put: no put access\n");
            res = notsuccessful;
        }
    }
    return res;

}            /* end of MB_put */


/*MPF:::===================================================================*
 *
 *  Function Name  : check_mailbox
 *  Description    : check if a mailbox is defined with the given mbxid
 *  Parameters     : mbxid: unique identification of the mailbox
 *  Result         : Status which indicates, whether a mailbox entr is defined
 *  Precondition   : 
 *  Postcondition  : 
 *
 *EMP:::===================================================================*/


static GLOBDEF_status check_mailbox (mbxid)
    MB_mbxid mbxid;
{
/*
 * mbxid is OK when it is in the range 1..MB_maxnumberofmailboxes and
 * the mbxid'th entry contains a mailbox (i.e. the name is filled)
 */

    return ( mbxid > 0 && mbxid <= MB_maxnumberofmailboxes && 
             Mailbox[mbxid].name[0] != '\0') ?
        successful : notsuccessful;

}        	/* end of check_mailbox */


/*MPF:::===================================================================*
 *
 *  Function Name  : add_mailbox
 *  Description    : add an entry to the list of mailboxes
 *  Parameters     : p_mbxname: name of the mailbox
 *                   access : access method
 *                   p_mbx_id : unique specification of the mailbox, to be used
 *                           in subsequent mailbox function calls.
 *  Result         : successful if an entry could be added
 *  Precondition   : number of mailbox entries = n (0=<n<MB_maxnumberofmailboxes)
 *  Postcondition  : number of mailbox entries = n+1
 *
 *EMP:::===================================================================*/

static GLOBDEF_status add_mailbox (p_mbxname, access, p_mbxid)
    char           *p_mbxname;
    MB_accesstype  access;
    MB_mbxid       *p_mbxid;
{
    if (Max_mailbox < MB_maxnumberofmailboxes) {
        Max_mailbox++;
        strcpy (Mailbox[Max_mailbox].name, p_mbxname);
	Mailbox[Max_mailbox].access = access;
	Mailbox[Max_mailbox].sock = -1;
        *p_mbxid = Max_mailbox;
        return successful;
    }
    else {
        return notsuccessful;
    }

}		/* end of add_mailbox */


/*MPF:::===================================================================*
 *
 *  Function Name  : delete_mailbox
 *  Description    : delete an entry from the list of mailboxes
 *  Parameters     : mbx_id : unique specification of the mailbox
 *  Result         : successful if an entry has been deleted
 *  Precondition   : number of mailbox entries = n (0<n<=MB_maxnumberofmailboxes)
 *                   and an entry exists with given mbxid
 *  Postcondition  : number of mailbox entries = n-1
 *
 *EMP:::===================================================================*/

static void delete_mailbox (mbxid)
    MB_mbxid mbxid;
{

    Mailbox[mbxid].name[0] = '\0';
    if (mbxid == Max_mailbox - 1) {
        Max_mailbox--;
    }

}		/* end of delete_mailbox */


/*MPF:::===================================================================*
 *      static function Setup_communication
 *EMP:::===================================================================*/

static int Setup_communication ()
{
    int sock;

    if (Creator) {
        sock = SOCKIPC_accept (Socket);
    }
    else {
        sock = SOCKIPC_connect (1);
    }
    return sock;

}               /* end of Setup_communication */


/*MPF:::===================================================================*
 *	static function print_message
 *EMP:::===================================================================*/

#if DEVELOPMENT

static print_message (message, function, name)
    char *message, *function, *name;
{
    char line [2] [300];
    int i, n, flip, len;

    sprintf (line [0], "%s on %s", function, name);
    len = strlen (function);
    line [1] [0] = 0;
    flip = 0;
    for (i = 0; i < Max_message_length; i++) {
	if ((i % 10) == 0) {
	    logc (line [flip]);
	    strcpy (line[0], "                             ");
	    line [0][len-1] = '\0';
	    flip = 0;
	    line [1] [0] = '\0';
	}
        sprintf (line[1-flip], "%s %4d", line[flip], (int)message[i]);
        flip = 1 - flip;
    }
    if (i % 10 != 1) 
        logc (line[flip]);

}		/* end of print_message */

#endif
