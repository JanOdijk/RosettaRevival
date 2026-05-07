/*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : PC 
 *  Creation date   : 1991-02-06
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

#include <signal.h>
#include <string.h>
#include "gendef.h"
#include "pc.h"
#include "globdef.h"
#include "paspar.h"
#include "logc.h"

/*----------------------------------------------------------------------
 * local types and variables
 *----------------------------------------------------------------------*/

/*
 * Process: definition of structure for administrating created processes
 */

typedef struct Process {
    char name [PC_maxprocname+1];
    int  pid;
    struct Process *p_next;
}
    Process;

/*
 * P_processes: pointer to list of created processes
 */

static Process *P_processes = NULL;

/*
 * static functions
 */

static Boolean FUNCDEF (May_execute, (char *p_path));


/*----------------------------------------------------------------------*
 * Exported function PC_create     
 *----------------------------------------------------------------------*/

GLOBDEF_status PC_create (p_process, p_image, p_arg1, p_arg2)
    PPC_string *p_process, *p_image, *p_arg1, *p_arg2;
{
    char *p_env;
    int child;
    char *p_image_name;
    char file [GLOBDEF_maxfilename+1];
    char *p_file;
    char *argv[7];
    Process *p_entry;
    int i;
#ifdef DEVELOPMENT
    char name [100];
    char arg_s [200];
    char *p_slash, *p_name, *p_val, *p_dot, *p;
#endif

/*
 *  Check if the file may be executed
 */
    p_image_name = PPC_to_string (p_image);
    strcpy (file, p_image_name);
    if (!May_execute (file)) {
        return notsuccessful;
    }

    child = fork ();
    if (child == 0) {
/*
 *      Child code: start the image
 */
#ifdef DEVELOPMENT
/*
 *	when developing the program: if the environment variable
 *	DEBUG_<image_name> (e.g. DEBUG_ANALYSIS) has the value TRUE
 *      then the program is started in debug mode; otherwise it is started
 *	normally
 */
        p_slash = strrchr (p_image_name, '/');
	p_name = (p_slash == NULL) ? p_image_name : p_slash+1;
        if ((p_dot = strchr (p_name, '.')) != NULL) *p_dot = '\0';
	strcpy (name, "DEBUG_");
	strcat (name, p_name);
	for (p = name; *p != 0; p++) if (islower(*p)) *p = toupper(*p);
	if ((p_val = getenv (name)) != NULL && strcmp (p_val, "TRUE") == 0) {
/*
 *	    what will be started is the debugger; it gets the actual program
 *	    as an argument
 */
            p_file = "ups";
            argv[0] = p_file;
            argv[1] = file;
	    argv[2] = "-a";
            strcpy (arg_s, "\"");
	    strcat (arg_s, PPC_to_string (p_arg1));
	    strcat (arg_s, PPC_to_string (p_arg2));
	    argv[3] = arg_s;
	    argv[4] = NULL;
	}
	else {
#endif
/*
 *	    run the program
 */
            p_file  = file;
            argv[0] = p_file;
            argv[1] = PPC_to_string (p_arg1);
	    argv[2] = PPC_to_string (p_arg2);
            argv[3] = NULL;
#ifdef DEVELOPMENT
	}
#endif
        logc ("call execvp()");
        for (i = 0; argv [i] != NULL; i++) logc (argv[i]);
        execvp (p_file, argv);
        perror ("Error in execve");
	logc ("Error in execve");
        exit (0);
    }
    else if (child == -1) {
/*
 *      No child created: give error message
 */
        perror ("Error creating subprocess");
        logc ("Error creating subprocess");
        return notsuccessful;
    }
    else {
/*
 *      parent code: save process name and pid for identification purposes
 */
        p_entry = (Process *) malloc (sizeof (Process));
        strncpy (p_entry->name, PPC_to_string (p_process), PC_maxprocname);
        p_entry->name [PC_maxprocname] = '\0';
        p_entry->pid    = child;
        p_entry->p_next = P_processes;
        P_processes     = p_entry;
        return successful;
    }

}            /* end PC_create */


/*----------------------------------------------------------------------*
 * Exported function PC_terminate
 *----------------------------------------------------------------------*/

GLOBDEF_status PC_terminate ()

{
    Process *p_proc;
    char s[100];

    for (p_proc = P_processes; p_proc != NULL; p_proc = p_proc->p_next) {
        waitpid (p_proc->pid, NULL, 0);
	sprintf (s, "PC_terminate: proc %d stopped", p_proc->pid);
	logc (s);
    }
    return successful;

}            /* end PC_terminate */



/*----------------------------------------------------------------------*
 * Exported function PC_kill
 *----------------------------------------------------------------------*/


GLOBDEF_status PC_kill (p_process)
    PPC_string *p_process;
{
    Process *p_proc;
    char *p_name;

    p_name = PPC_to_string (p_process);
    for (p_proc = P_processes;  p_proc != NULL; p_proc = p_proc->p_next ) {
        if (strcmp (p_proc->name, p_name) == 0 ) {
            if (kill (p_proc->pid, SIGKILL) == -1) {
                logc ("Error killing process");
                return notsuccessful;
            }
            else {
                return successful;
            }
        }
    }
    return notsuccessful;

}            /* end PC_kill */


/*MPF:::===================================================================*
 *
 *  Function Name  : May_execute
 *  Description    : checks if a given file may be executed
 *  Parameters     : p_path: path of file to check
 *  Result         : TRUE when file may be executed by user, FALSE if not
 *  Precondition   : p_path is a zero-terminated char array
 *  Postcondition  :
 *           (p_path is path to an executable file     AND May_execute = TRUE)
 *         OR
 *           (p_path is not path to an executable file AND May_execute = FALSE)
 *
 *EMP:::===================================================================*/

static Boolean May_execute (p_path)
    char *p_path;
{
    struct stat s;
    uid_t uid = getuid ();
    gid_t gid = getgid ();
    Boolean res = TRUE;
    char m [200];

    if (stat(p_path, &s) == -1) {
        sprintf (m, "%s: no such file", p_path);
	res = FALSE;
    }
    else {
	if (S_ISDIR(s.st_mode)) {
	    sprintf (m, "%s is a directory", p_path);
	    res = FALSE;
	}
	else if (s.st_uid == uid && (s.st_mode & S_IXUSR)) {
	    sprintf (m, "Owner may execute %s", p_path);
	}
	else if (s.st_gid == gid && (s.st_mode & S_IXGRP)) {
	    sprintf (m, "Group may execute %s", p_path);
	}
	else if (s.st_mode & S_IXOTH) {
	    sprintf (m, "World may execute %s", p_path);
	}
	else {
	    sprintf (m, "%s cannot be executed", p_path);
	    res = FALSE;
	}
    }
    if (res) {
        logc (m);
    }
    else {
        fprintf (stderr, "%s\n", m);
    }
    return res;
}			/* end of May_execute */
