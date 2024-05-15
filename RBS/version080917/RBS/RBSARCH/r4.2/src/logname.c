#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include "logname.h"


#define  LogName_MaxLogTable  200
#define  MaxEquiName          10
#define  MaxLogName           100
#define  MaxLine              119
#define  TRUE                 1
#define  FALSE                0

typedef struct {
                 char logname[MaxLogName]; 
                 char equiname[MaxEquiName] [MaxLogName];
                 int nrequis;
} LogName_TableRec;

typedef time_t                    CISAM_Time;


static LogName_TableRec LogTable[LogName_MaxLogTable];
static int              NrNames;
static int              EOFILE;
static FILE             *LogNameFile;
static int              ll, cc;
static char             line[MaxLine];
static char             ch;
static char             *status = "a";


static void GetChar()
{
    if (cc == ll)  {
       if (status == NULL)  {
         ch = ' '; cc = 1; EOFILE = TRUE;
          }
       else {
         ll = MaxLine; cc = 0;
         status = fgets(line, ll, LogNameFile);
         if (status != NULL) {
            ll = strlen(line); 

            line[ll-1] =  ' '; /* fgets reads also new-line char */
            }
         else {
            ch = ' '; cc = 1; EOFILE = TRUE;
         };
       };
    };
   cc = cc+1; ch = line[cc-1];
 } /* GetChar */;


static void GetCh()
{
    if ( EOFILE != TRUE )  GetChar();
   /* Skip Comments */
   while ( (ch == '#') && (cc == 1) && (EOFILE != TRUE)) {
      GetChar();
      while ( (cc != 1) && (EOFILE != TRUE) ) {
         GetChar();
      };
   }    
} /* GetCh */;


static void SkipSpaces()
{
   while (((ch == ' ')) && ( EOFILE != TRUE )) { GetCh(); };
} /* SkipSpaces */;


static void SkipLine()
{
   cc = ll; 
   GetCh();
} /* SkipLine */;


static void ExpandEnvVar(s)
char s[];
{
   char p1[MaxLine];
   int  len;
   char *p2;

   p1[0] = '\0';
   GetCh(); /* if ( ch != '(' ) error("Expected ( after $ in line ",curline); */
   GetCh();
   while ( ch != ')') { 
      len = strlen(p1);
      p1[len+1] = '\0';
      p1[len] = ch;
      GetCh();
   };
   GetCh();
   p2 = getenv(p1);
   if ( p2 != NULL ) strcat(s,getenv(p1));
} /* ExpandEnvVar */


void Word(s)
   char       s[];

{
   int   j;
   char  s_env[MaxLine];
   
   s[0] = '\0';
   while (( ch != ' ')) {
      if ( ch == '$' ) {
         s_env[0]='\0';
         ExpandEnvVar(s_env);
         if ( strlen(s_env) == 0 ) {
            SkipLine(); SkipSpaces();
            s[0] = '\0';
            }
         else {
            strcat(s, s_env);
         }
         }
      else {
         j = strlen(s);
         s[j+1] = '\0';
         s[j] = ch;
         GetCh();
      }
    };

 } /* Word */;


void LogName_Entry()
{
   int    nrequis, 
          continue_symbol;

   Word(LogTable[NrNames-1].logname);

   SkipSpaces();
   continue_symbol = 1;
   nrequis = 0;

   while ( continue_symbol && (EOFILE != TRUE)) {
      nrequis = nrequis+1;
      Word(LogTable[NrNames-1].equiname[nrequis-1]);
      SkipSpaces();
      if (ch != '+') {
         continue_symbol = 0;
         }
      else {
         GetCh();
         SkipSpaces();
      };
   };
   LogTable[NrNames-1].nrequis = nrequis;

} /* Entry */;


void LogName_File()
{
   SkipSpaces();
   EOFILE = FALSE;
   while ( EOFILE != TRUE ) { 
      NrNames = NrNames+1;
      LogName_Entry();
      SkipSpaces();
   };
   
}


void LogName_Init(fname)
char fname[];
{
   cc = 0; ll = 0; ch = ' ';
   LogNameFile = fopen( fname, "r" );
   LogName_File();
}


char *LogName_Tr(s1)
char s1[];
{
   static char s2[MaxLogName];
   int i,
       found;

   i = 0; found = 0; s2[0] = '\0';

   while (( i < NrNames ) && (!found)) {
      i = i+1;
      if ( strcmp(s1, LogTable[i-1].logname) == 0 ) {
         found = 1;
         strcpy(s2, LogTable[i-1].equiname[0]);
      };
   };
   return s2;
}


int LogName_TranslateEquiNr(s1, s2, equi)
char s1[];
char s2[];
int  *equi;
{
   int i,
       found;

   i = 0; found = 0; s2[0] = '\0';

   while (( i < NrNames ) && (!found)) {
      i = i+1;
      if ( strcmp(s1, LogTable[i-1].logname) == 0 ) {
         found = 1;
         if ( *equi <= LogTable[i-1].nrequis ) {
            strcpy(s2, LogTable[i-1].equiname[*equi-1]);
            if ( *equi < LogTable[i-1].nrequis ) {
               *equi = *equi+1; }
            else *equi = -1;
            }
         else {
            *equi = -1;
         }
      };
   };
   return found;
}

int LogName_IsFile(s)
char s[];
{
   static struct stat buf;

   if ( stat(s, &buf) == -1 ) {
        return FALSE;
    }
    else {
        return TRUE;
    }   
}


char *LogName_FindFile(component, file)
char component[];
char file[];
{
   static char s2[MaxLogName];
   char s[MaxLogName];
   int i,
       found;

   i = 1; found = 0; s2[0] = '\0';

   while (( i != -1 ) && (!found)) {
      if ( LogName_TranslateEquiNr(component,s,&i) ) {
         strcat(s, file);
         if ( LogName_IsFile(s) ) {
            found = 1;
            strcpy(s2, s);
         } }
      else i = -1;
   }
   return s2;
}

