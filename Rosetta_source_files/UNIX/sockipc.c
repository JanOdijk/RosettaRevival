/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Sockipc
 *  Creation date   : 1991-08-21
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

#include <errno.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <stdio.h>
#include "gendef.h"
#include "sockipc.h"
#include "mkkey.h"

#include "logc.h"

/* THE portnr: must be set via WIPC_set_port for connect processes;
   it will be set by a call to bind;
   it can be queried by a call to WIPC_get_port
*/

#define MAX_PORTS        10

static int Port [MAX_PORTS];

#define SOCK_STRUCT struct sockaddr_in
#define SOCK_TYPE   AF_INET

static void FUNCDEF (
Fill_socket, (
    SOCK_STRUCT *p_sock));


/*=========================================================================*
 *  Exported function SOCKIPC_set_port
 *=========================================================================*/

void SOCKIPC_set_port (port_nr, id)
    int port_nr;
    int id;
{
    Port [id] = port_nr;
}


/*=========================================================================*
 *  Exported function SOCKIPC_get_port
 *=========================================================================*/

int SOCKIPC_get_port (id)
    int id;
{
    return Port [id];
}

/*=========================================================================*
 *  Exported function SOCKIPC_connect
 *=========================================================================*/

int SOCKIPC_connect (id)
    int id;
{
    int sock;
    SOCK_STRUCT server;

    sock = socket (SOCK_TYPE, SOCK_STREAM, 0);
    if (sock < 0) {
        logc ("SOCKIPC_connect:opening stream socket");
    }
    else {
        Fill_socket (&server, id);
        while (connect (sock, &server, sizeof (SOCK_STRUCT)) < 0) {
            usleep (100);
        }
    }
    return sock;

}            /* end of SOCKIPC_connect */


/*=========================================================================*
 *  Exported function SOCKIPC_bind
 *=========================================================================*/

int SOCKIPC_bind (id)
    int id;
{
    int sock;
    int len;
    SOCK_STRUCT server;

    sock = socket (SOCK_TYPE, SOCK_STREAM, 0);
    if (sock < 0) {
        logc ("SOCKIPC_bind:opening stream socket");
    }
    else {
        Fill_socket (&server, id);
        if (bind (sock, &server, sizeof (SOCK_STRUCT)) < 0) {
            perror ("SOCKIPC_bind");
            logc ("SOCKIPC_bind:binding stream socket");
            close (sock);
            sock = -1;
        }
	len =  sizeof (SOCK_STRUCT);
	getsockname (sock, &server, &len);
	Port [id] = server.sin_port;
    }
    if (sock >= 0) {
	listen (sock, 5);
    }
    return sock;

}            /* end of SOCKIPC_bind */


/*=========================================================================*
 *  Exported function SOCKIPC_accept
 *=========================================================================*/

int SOCKIPC_accept (sock)
    int sock;
{
    int msgsock;

    msgsock = accept (sock, 0, 0);
    if (msgsock < 0) {
        perror ("SOCKIPC_accept");
        logc ("SOCKIPC_accept:accepting stream socket");
    }
    return msgsock;

}            /* end of SOCKIPC_accept */


/*=========================================================================*
 *  Exported function SOCKIPC_close
 *=========================================================================*/

int SOCKIPC_close (sock)
    int sock;
{
    return close (sock) == 0;

}            /* end of SOCKIPC_close */


/*=========================================================================*
 *  Static function Fill_socket
 *=========================================================================*/

static void Fill_socket (p_sock, id)
    SOCK_STRUCT *p_sock;
    int id;
{
    char *p_display, host [100];
    struct hostent *p_hostent;

    bzero ((caddr_t) p_sock, sizeof (SOCK_STRUCT));
    p_sock->sin_family = AF_INET;
    p_sock->sin_port   = Port [id];
    p_sock->sin_addr.s_addr = INADDR_ANY;
#if FALSE
    p_display = getenv ("DISPLAY");
    if (p_display == NULL) {
        p_sock->sin_addr.s_addr = INADDR_ANY;
    }
    else {
        strcpy (host, p_display);
        *(strchr (host, ':')) = '\0';
        p_hostent = gethostbyname (host);
        bcopy (&(p_hostent->h_addr), (caddr_t) (&(p_sock->sin_addr)), 
	       p_hostent->h_length);
    }
#endif

}		/* end of Fill_socket */

