/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Wipc
 *  Creation date   : 1991-04-17
 *  Author          : H. M. M. van de Schoot
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*/


/*=========================================================================*
 *  Imported modules
 *=========================================================================*/

#include <errno.h>
#include "gendef.h"
#include "wipc.h"
#include "mkkey.h"
#include "sockipc.h"

#include "logc.h"

typedef struct Wipc_type {
    int sock;		/* socket nr */
    int remains;	/* remaining chars to read */
    struct Wipc_type *p_next;
}
    Wipc_type;

static Wipc_type *Sockets = NULL;

static int FUNCDEF (
Correct_id, (WIPC id));

static WIPC FUNCDEF (
Add_channel, (int sock));

static void FUNCDEF (
Remove_channel, (WIPC id));



/*=========================================================================*
 *  Exported function WIPC_connect
 *=========================================================================*/

int WIPC_connect (p_msg_id)
    WIPC *p_msg_id;
{
    int sock;

    sock = SOCKIPC_connect (0);
    if (sock >= 0) {
        *p_msg_id = Add_channel (sock);
    }
    return sock >= 0;

}            /* end of WIPC_connect */


/*=========================================================================*
 *  Exported function WIPC_bind
 *=========================================================================*/

int WIPC_bind (p_msg_id)
    WIPC *p_msg_id; 
{
    int sock;
    int result = TRUE;

    sock = SOCKIPC_bind (0);
    if (sock >= 0) {
        *p_msg_id = Add_channel (sock);
    }
    return sock >= 0;

}            /* end of WIPC_bind */


/*=========================================================================*
 *  Exported function WIPC_accept
 *=========================================================================*/

int WIPC_accept (id, p_msg_id)
    WIPC id;
    WIPC *p_msg_id;
{
    int result = TRUE;
    int msgsock;

    if ( !Correct_id (id)) {
	logc ("WIPC_accept:Socket not yet open");
        result = FALSE;
    }
    else {
        msgsock = SOCKIPC_accept (id->sock);
	if (msgsock < 0) {
	    result = FALSE;
	}
	else {
            *p_msg_id = Add_channel (msgsock);
	}
    }
    return result;


}            /* end of WIPC_accept */


/*=========================================================================*
 *  Exported function WIPC_close
 *=========================================================================*/

int WIPC_close (id)
    WIPC id;
{
    int result = TRUE;

    if ( !Correct_id (id)) {
	logc ("WIPC_close:Socket not yet open");
        result = FALSE;
    }
    else {
        SOCKIPC_close (id->sock);
	Remove_channel (id);
    }
    return result;


}            /* end of WIPC_close */


/*=========================================================================*
 *  Exported function WIPC_send
 *=========================================================================*/

int WIPC_send (id, msg, size)
    WIPC id;
    caddr_t msg;
    int size;
{
    int result = TRUE;
    short nr;

    if ( !Correct_id (id)) {
	logc ("WIPC_send:Socket not yet open");
        result = FALSE;
    }
    else {
        nr = size;
	if (write (id->sock, &nr, sizeof(nr)) < 0 ||
	    write (id->sock, msg, size) < 0) {
	    logc ("WIPC_send:writing on stream socket");
            result = FALSE;
	}
	else {
	    char s [100];
            sprintf (s, "WIPC_send: %d bytes send to %d", nr, id->sock);
	    logc (s);
	}
    }
    return result;

}            /* end of WIPC_send */


/*=========================================================================*
 *  Exported function WIPC_receive
 *=========================================================================*/

int WIPC_receive (id, msg, size_max, p_size, p_remains)
    WIPC id;
    caddr_t msg;
    int size_max;
    int *p_size;
    int *p_remains;
{
    int result = TRUE;
    short nr;
    int n;
    char s [100];

    if ( !Correct_id (id)) {
	logc ("WIPC_receive:Socket not yet open");
        result = FALSE;
    }
    else {
	if (id->remains == 0) {
   	    n = read (id->sock, &nr, sizeof(nr));
	    if (n == 0) {	/* EOF */
                sprintf (s, "WIPC_receive: EOF on %d", id->sock);
	        logc (s);
	        return FALSE;
	    }
            sprintf (s, "WIPC_receive: %d bytes waiting on %d", nr, id->sock);
	    logc (s);
	    id->remains = nr;
	}
	n = read (id->sock, msg, MIN(size_max, id->remains));
        if (n < 0) {
	    logc ("WIPC_receive:reading stream message");
            result = FALSE;
	}
	else {
	    id->remains = id->remains > n ? id->remains - n : 0;
	    *p_size = n;
	    *p_remains = id->remains;
	    sprintf (s, "WIPC_receive: %d bytes read", n);
	    logc (s);
	}
    }
    return result;

}            /* end of WIPC_receive */


/*=========================================================================*
 *  Exported function WIPC_fileno
 *=========================================================================*/

int WIPC_fileno (msg_id)
    WIPC msg_id;
{
    return msg_id->sock;

}		/* end of WIPC_fileno */


/*=========================================================================*
 *  Static function Correct_id
 *=========================================================================*/

static int Correct_id (id)
    WIPC id;
{
    WIPC p;

    for (p = Sockets; p != NULL; p = p->p_next) {
	if (p == id) {
	    return TRUE;
	}
    }
    return FALSE;

}		/* end of Correct_id */


/*=========================================================================*
 *  Static function Add_channel
 *=========================================================================*/

static WIPC Add_channel (sock)
    int sock;
{
    WIPC new;

    new = (WIPC) malloc (sizeof (Wipc_type));
    new->sock = sock;
    new->remains = 0;
    new->p_next = Sockets;
    Sockets = new;
    return new;

}		/* end of Add_channel */


/*=========================================================================*
 *  Static function Remove_channel
 *=========================================================================*/

static void Remove_channel (id)
    WIPC id;
{
    WIPC *p_prev, *p;

    p_prev = &Sockets;
    while (*p_prev != id) {
	p_prev = &((*p_prev)->p_next);
    }
    *p_prev = id->p_next;
    free (id);

}		/* end of Remove_channel */
