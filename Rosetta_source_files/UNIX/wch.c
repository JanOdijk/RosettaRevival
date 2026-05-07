/*MPM:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : wch
 *  Creation date   : 1991-05-02
 *  Author          : H. M. M. van de Schoot
 *
 *  Copyright (c) 1991, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : Window Command Handler
 *
 *EMP:::===================================================================*/

/*=========================================================================*
 *  Imported modules
 *=========================================================================*/

#include <memory.h>
#include <sys/types.h>
#include <netinet/in.h>
#include "gendef.h"
#include "wch.h"
#include "logc.h"

/* static variables */

#define ALLOC_LENGTH		512	/* allocation increments */

#define BOOL_SIZE		sizeof(Boolean)
#define INT_SIZE		sizeof(int)
#define ID_SIZE			INT_SIZE


static WIPC Cur_wipc = NULL;

typedef struct {
    int length;			/* allocated length */
    int act_length;		/* message length; act_length <= length */
    char *p_msg;		/* message buffer */
    char *p_cur_pos;		/* position in message buffer
				 * p_msg <= p_cur_pos < p_msg+act_length
				 */
}
    Message;

static Message In_msg  = {0, 0, NULL, NULL};
static Message Out_msg = {0, 0, NULL, NULL};

/* forward declaration of local functions */

static Boolean FUNCDEF (
Get_msg_part, (Message *p_msg, caddr_t **pp_value, int size));

static Boolean FUNCDEF (
Put_msg_part, (Message *p_msg, caddr_t *p_value, int size));

static void FUNCDEF (
Set_cur_wipc, (WIPC msg_id));

/* Debug aids */

#define DEBUG TRUE
#if DEBUG

static int WCH_debug = TRUE;

#define T(a, i) if (WCH_debug) { \
	char s[100]; sprintf (s, "%s: value %d", a, i); logc (s); }
#define Ts(a, str) if (WCH_debug) { \
	char s[100]; sprintf (s, "%s: value '%s'", a, str); logc(s); }
#define F(a) if (WCH_debug) { \
	char s[100]; sprintf (s, "%s: ERROR", a); logc (s); }

#else

#define T(a, i)
#define Ts(a, s)
#define F(a)

#endif

/*=========================================================================*
 *  Exported function WCH_get_boolean
 *=========================================================================*/

Boolean WCH_get_boolean (p_bool)
    Boolean *p_bool;
{
    caddr_t res;

    if (Get_msg_part (&In_msg, &res, BOOL_SIZE)) {
	memcpy (p_bool, res, BOOL_SIZE); 
	T("WCH_get_boolean", *p_bool);
	return TRUE;
    }
    F("WCH_get_boolean");
    return FALSE;

}		/* end of WCH_get_boolean */

/*=========================================================================*
 *  Exported function WCH_get_id
 *=========================================================================*/

Boolean WCH_get_id (p_id)
    int *p_id;
{
    caddr_t res;

    if (Get_msg_part (&In_msg, &res, ID_SIZE)) {
	memcpy (p_id, res, ID_SIZE);
        ntohl (*p_id);
	T("WCH_get_id", *p_id);
	return TRUE;
    }
    F("WCH_get_id");
    return FALSE;

}		/* end of WCH_get_id */

/*=========================================================================*
 *  Exported function WCH_get_integer
 *=========================================================================*/

Boolean WCH_get_integer (p_int)
    int *p_int;
{
    caddr_t res;

    if (Get_msg_part (&In_msg, &res, INT_SIZE)) {
        memcpy (p_int, res, INT_SIZE);
        ntohl (*p_int);
        T("WCH_get_integer", *p_int);
	return TRUE;
    }
    F("WCH_get_integer");
    return FALSE;

}		/* end of WCH_get_integer */

/*=========================================================================*
 *  Exported function WCH_get_message_id
 *=========================================================================*/

Boolean WCH_get_message_id (p_msg_id)
    WCH_msg_id *p_msg_id;
{
    caddr_t res;

    if (Get_msg_part (&In_msg, &res, ID_SIZE)) {
        memcpy (p_msg_id, res, ID_SIZE);
        ntohl (*p_msg_id);
        T("WCH_get_message_id", *p_msg_id);
	return TRUE;
    }
    F("WCH_get_message_id");
    return FALSE;

}		/* end of WCH_get_message_id */

/*=========================================================================*
 *  Exported function WCH_get_string
 *=========================================================================*/

Boolean WCH_get_string (pp_str)
    char **pp_str;
{
    Boolean res = Get_msg_part (&In_msg, pp_str, 0);
    if (res) {
        Ts("WCH_get_string", *pp_str);
    }
    else {
        F("WCH_get_string");
    }
    return res;

}		/* end of WCH_get_string */

/*=========================================================================*
 *  Exported function WCH_get_pstring
 *=========================================================================*/

Boolean WCH_get_pstring (p_str, max_pstring_len)
    PPC_string *p_str;
    int max_pstring_len;
{
    char *p_s;

    Boolean res = WCH_get_string (&p_s);
    if (res) {
        PPC_from_string (p_str, max_pstring_len, p_s);
    }
    return res;

}		/* end of WCH_get_pstring */

/*=========================================================================*
 *  Exported function WCH_put_boolean
 *=========================================================================*/

Boolean WCH_put_boolean (bool)
    Boolean bool;
{
    T("WCH_put_boolean", bool);
    return Put_msg_part (&Out_msg, &bool, BOOL_SIZE);

}		/* end of WCH_put_boolean */

/*=========================================================================*
 *  Exported function WCH_put_id
 *=========================================================================*/

Boolean WCH_put_id (id)
    int id;
{
    T("WCH_put_id", id);
    htonl (id);
    return Put_msg_part (&Out_msg, &id, ID_SIZE);

}		/* end of WCH_put_id */

/*=========================================================================*
 *  Exported function WCH_put_integer
 *=========================================================================*/

Boolean WCH_put_integer (i)
    int i;
{
    T("WCH_put_integer", i);
    htonl (i);
    return Put_msg_part (&Out_msg, &i, INT_SIZE);

}		/* end of WCH_put_integer */

/*=========================================================================*
 *  Exported function WCH_put_message_id
 *=========================================================================*/

Boolean WCH_put_message_id (msg_id)
    WCH_msg_id msg_id;
{
    int i = (int) msg_id;
    htonl (i);
    T("WCH_put_message_id", i);
    return Put_msg_part (&Out_msg, &i, ID_SIZE);

}		/* end of WCH_put_message_id */

/*=========================================================================*
 *  Exported function WCH_put_string
 *=========================================================================*/

Boolean WCH_put_string (p_str)
    char *p_str;
{
    if (p_str == NULL) {
        Ts("WCH_put_string", "<NULL>");
	return TRUE;
    }
    else {
        Ts("WCH_put_string", p_str);
        return Put_msg_part (&Out_msg, p_str, strlen(p_str) + 1);
    }

}		/* end of WCH_put_string */

/*=========================================================================*
 *  Exported function WCH_put_pstring
 *=========================================================================*/

Boolean WCH_put_pstring (p_str)
    PPC_string *p_str;
{
    char *p_s;
    Boolean res = TRUE;

    if (p_str == NULL) {
        p_s = NULL;
    }
    else {
        p_s = PPC_to_string (p_str);
    }
    res = WCH_put_string (p_s);
    if (p_s != NULL) free (p_s);
    return res;

}		/* end of WCH_put_pstring */

/*=========================================================================*
 *  Exported function WCH_receive
 *=========================================================================*/

Boolean WCH_receive (msg_id)
    WIPC msg_id;
{
    int remains, size, length;
    Boolean res;

    Set_cur_wipc (msg_id);
    if (In_msg.length == 0) {
        In_msg.p_msg = (char *) malloc (ALLOC_LENGTH);
	In_msg.length = ALLOC_LENGTH;
    }
    res = WIPC_receive (Cur_wipc, In_msg.p_msg, In_msg.length, 
                  &In_msg.act_length, &remains);
    if (res && remains > 0) {
        length = In_msg.length + remains;
	In_msg.p_msg = (char *) realloc (In_msg.p_msg, length);
        res = WIPC_receive (Cur_wipc, In_msg.p_msg + In_msg.length, remains,
                      &size, &remains);
        In_msg.length = In_msg.act_length = length;
    }
    In_msg.p_cur_pos = In_msg.p_msg;
    return res;

}		/* end of WCH_receive */

/*=========================================================================*
 *  Exported function WCH_send
 *=========================================================================*/

Boolean WCH_send (msg_id)
    WIPC msg_id;
{
    Boolean res;
    Set_cur_wipc (msg_id);
    res = WIPC_send (Cur_wipc, Out_msg.p_msg, Out_msg.act_length);
    Out_msg.act_length = 0;
    Out_msg.p_cur_pos = Out_msg.p_msg;
    return res;

}		/* end of WCH_send */



/*=========================================================================*
 *  Static function Get_msg_part
 *=========================================================================*/

static Boolean Get_msg_part (p_msg, p_value, size)
    Message *p_msg;
    caddr_t *p_value;
    int size;
{
    int at_least = (size == 0) ? 1 : size;
    if (p_msg->p_cur_pos + at_least <= p_msg->p_msg + p_msg->act_length) {
	*p_value = (caddr_t) p_msg->p_cur_pos;
	p_msg->p_cur_pos += (size == 0) ? 
				strlen (p_msg->p_cur_pos) + 1 : size;
	return TRUE;
    }
    return FALSE;

}		/* end of Get_msg_part */

/*=========================================================================*
 *  Static function Put_msg_part
 *=========================================================================*/

static Boolean Put_msg_part (p_msg, value, size)
    Message *p_msg;
    caddr_t value;
    int size;
{
    if (p_msg->act_length + size > p_msg->length) {
        p_msg->p_msg = (char *) ((p_msg->p_msg == NULL) ?
		malloc (ALLOC_LENGTH) : 
		realloc (p_msg->p_msg, p_msg->length + ALLOC_LENGTH));
	p_msg->p_cur_pos = p_msg->p_msg + p_msg->act_length;
        p_msg->length += ALLOC_LENGTH;
    }
    memcpy (p_msg->p_cur_pos, value, size);
    p_msg->p_cur_pos += size;
    p_msg->act_length += size;
    return TRUE;

}		/* end of Put_msg_part */

/*=========================================================================*
 *  Static function Set_cur_wipc
 *=========================================================================*/

static void Set_cur_wipc (msg_id)
    WIPC msg_id;
{
    if (msg_id == NULL) {
        if (Cur_wipc == NULL) {
            while (! WIPC_connect (&Cur_wipc)) sleep (1);
	}
	else {
	    /* no action: use actual Cur_ipc */
	}
    }
    else {
        Cur_wipc = msg_id;
    }

}		/* end of Set_cur_wipc */
