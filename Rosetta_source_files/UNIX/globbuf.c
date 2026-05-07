/*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : GLOBBUF
 *  Creation date   : 1991-02-09
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

#include "gendef.h"
#include <errno.h>
#include <sys/types.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "globbuf.h"
#include "mkkey.h"
#include "logc.h"


/*
 * Area: definition of structure for administrating global buffers
 */

typedef struct Area {
    char *p_name;
    int memid;			/* identification of memory object (file) */
    caddr_t address;		/* address of memory region */
    int length;                 /* length of memory region */
    Boolean created;		/* is current process creator of area ? */
    struct Area *p_next;
}
    Area;

/*
 * P_area: pointer to list of Areas
 */

static Area *P_area = NULL;
/*
 * system error number: 0 when OK, else last value of errno
 */
static int Local_errno;

/*
 * status of last action (call)
 */
static GLOBBUF_Status Local_status;

static Boolean FUNCDEF (
Remove_buffer, (Area *p_entry));


/*=========================================================================*
 *  Exported function GLOBBUF_createbuffer
 *=========================================================================*/

void GLOBBUF_createbuffer (p_name, byteSize, p_startAddress)
        PPC_string *p_name;
        int byteSize;
        caddr_t *p_startAddress;
{
    char filename [100];
    char *p_filename = filename;
    char *p_cname;
    Area *p_entry;
    char c [1];
#if DEVELOPMENT
    char s [100];
#endif

    p_cname = PPC_to_string (p_name);
    p_entry = (Area *) malloc (sizeof (Area));
    p_entry->p_name = p_cname;
    p_entry->p_next = P_area;
    P_area = p_entry;
    p_filename = MKK_make_filename ('B', p_cname);
#if DEVELOPMENT
    sprintf (s, "GLOBBUF_createbuffer: name = %s, size = %d", p_cname, byteSize);
    logc (s);
#endif
    Local_errno  = 0;
    Local_status = GLOBBUF_NoError;
    p_entry->memid = open (p_filename, O_RDWR, S_IRWXU | S_IRWXG);
    if (p_entry->memid == -1) {
        p_entry->memid = open (p_filename, O_CREAT | O_RDWR, S_IRWXU | S_IRWXG);
        if (p_entry->memid == -1) {
	    perror ("p_entry->memid error");
	    logc ("p_entry->memid error");
            Local_errno  = errno;
            Local_status = GLOBBUF_Error;
	    return;
	}
#if DEVELOPMENT
	logc ("                        create");
#endif
        fseek (fdopen (p_entry->memid, "r+"), (long) byteSize-1, 0);
        write (p_entry->memid, " ", 1); /* write blank for file to be usable */
        p_entry->created = TRUE;
    }
    else {
        fseek (fdopen (p_entry->memid, "r+"), (long) byteSize-1, 0);
	/* read blank from file: sync with creating process */
        while (read (p_entry->memid, c, 1) == 0) ;
        p_entry->created = FALSE;
    }
    p_entry->length = byteSize;
    p_entry->address = mmap ((caddr_t) 0, byteSize, PROT_WRITE | PROT_READ | PROT_EXEC,
                MAP_SHARED, p_entry->memid, (off_t)0);
    if ((int) p_entry->address == -1) {
        perror ("address -1");
        Local_errno  = errno;
        Local_status = GLOBBUF_Error;
    }
    else {
        *p_startAddress = p_entry->address;
    }

}            /* end of GLOBBUF_createbuffer */


/*=========================================================================*
 *  Exported function GLOBBUF_removebuffer
 *=========================================================================*/

void GLOBBUF_removebuffer (p_name)
    PPC_string *p_name;
{
    Area *p_entry;
    char *p_cname;

    p_cname = PPC_to_string (p_name);
    Local_errno  = ENODEV;
    Local_status = GLOBBUF_Error;
    for (p_entry = P_area;  p_entry != NULL;  p_entry = p_entry->p_next) {
        if (strcmp (p_cname, p_entry->p_name) == 0) {
	    if (Remove_buffer (p_cname) ) {
                Local_errno  = 0;
                Local_status = GLOBBUF_NoError;
	    }
	    return;                            /* entry handled; return */
        }
    }
    fputs ("GLOBBUF_removebuffer: No such buffer\n", stderr);

}            /* end of GLOBBUF_removebuffer */


/*=========================================================================*
 *  Exported function GLOBBUF_removeallbuffers
 *=========================================================================*/

void GLOBBUF_removeallbuffers ()
{
    Area *p_entry;

    Local_errno  = 0;
    Local_status = GLOBBUF_NoError;
    for (p_entry = P_area;  p_entry != NULL;  p_entry = p_entry->p_next) {
        if (! Remove_buffer (p_entry)) {
            Local_errno  = errno;
            Local_status = GLOBBUF_Error;
        }
    }

}            /* end of GLOBBUF_removebuffer */


/*=========================================================================*
 *  Exported function GLOBBUF_getstatus
 *=========================================================================*/

GLOBBUF_Status GLOBBUF_getstatus ()
{
    return Local_status;

}            /* end of GLOBBUF_getstatus */


/*=========================================================================*
 *  Exported function GLOBBUF_getintegerstatus
 *=========================================================================*/

int GLOBBUF_getintegerstatus ()
{
    return Local_errno;

}            /* end of GLOBBUF_getintegerstatus */


/*=========================================================================*
 *  static function Remove_buffer
 *=========================================================================*/

static Boolean Remove_buffer (p_entry)
    Area *p_entry;
{
    int res;

    res = munmap (p_entry->address, p_entry->length);
    if (res == -1) {
        perror ("Error in munmap ()");
	return FALSE;
    }
    else {
        close (p_entry->memid);
        if (p_entry->created) {
	    res = unlink (MKK_make_filename ('B', p_entry->p_name));
            if (res == -1) {
	        char s[100];
		strcpy (s, "Error in unlink () of ");
		strcat (s, p_entry->p_name);
                logc (s);
		return FALSE;
            }
        }
    }
    return TRUE;

}		/* end of Remove_buffer */
