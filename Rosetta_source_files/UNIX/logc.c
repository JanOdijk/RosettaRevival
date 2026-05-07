/* implementation of logc () */

#include <sys/types.h>
#include <sys/time.h>
#include <errno.h>
#include "gendef.h"
#include "logc.h"
#include "paspar.h"

extern int sys_nerr;
extern char *sys_errlist[];

static char Filename [100];
static Boolean Fixed_name = FALSE;
static Boolean First_time = TRUE;

void logc (p_s)
    char *p_s;
{
#if DEVELOPMENT
    FILE *f;
    time_t t = time(0);
    char s[50];
    char log_file [100];
    char *p_f;
    char *p_open_mode;

    sprintf (log_file, "ipc%u.log", getpid());
    p_f = Fixed_name ? Filename : log_file;
    p_open_mode = First_time ? "w" : "a";
    First_time = FALSE;
    f = fopen (p_f, p_open_mode);
    strcpy (s, ctime(&t));
    s[19] = '\0';
    fprintf (f, "%s: %s\n", &s[11], p_s);
#if FALSE
    if (errno > 0 && errno < sys_nerr) {
        fprintf (f, "    errno: %s\n", sys_errlist[errno]);
    }
#endif
    fclose (f);
#endif /* DEVELOPMENT */

}			/* end of logc */


void logp (p_pmsg)
    PPC_string *p_pmsg;
{
    logc (PPC_to_string (p_pmsg));

}			/* end of logp */

void logc_filename (name)
    char *name;
{
    strcpy (Filename, name);
    Fixed_name = TRUE;
}

void logp_filename (pname)
    PPC_string *pname;
{
    logc_filename (PPC_to_string (pname));
}

