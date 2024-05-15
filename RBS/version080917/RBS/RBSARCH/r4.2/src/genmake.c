#include <stdio.h>
#include <dirent.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <errno.h>
#include <stdlib.h>
#include "logname.h"
#include "genmake.h"

#define  MaxLine              119
#define  MaxDepth             5
#define  TRUE                 1
#define  FALSE                0

static    char          r_cur_file[MaxDepth][MaxLine];
static    char          f_name[MaxLine];
static    char          target[MaxLine];
static    int           DepFound = FALSE;
static    int           Silent = FALSE;
static 	  int           SelectSources = FALSE;

static    int           EOFILE;
static    FILE		*mf;
static    char		ch;
static    char          *status = "a";
static    int		ll, cc;
static    char          *line;
static    int           curline;
static    int		Targets,
   			Sources,
  			Actions;

static    int           r_EOFILE[MaxDepth];
static    FILE		*r_mf[MaxDepth];
static    char		r_ch[MaxDepth];
static    char          *r_status[MaxDepth] = {"a","a","a","a","a"};
static    int		r_ll[MaxDepth], r_cc[MaxDepth];
static    char          r_line[MaxDepth][MaxLine];
static    int           r_curline[MaxDepth];
static    int		r_Targets[MaxDepth],
   			r_Sources[MaxDepth],
  			r_Actions[MaxDepth];
static    int           cd = 0;

static void error(s,i)
char *s;
int  i;
{
  
   printf("\n\n\n !!! ERROR: %s %d in file %s \n", s,i, r_cur_file[cd]);
   exit(1);
}

static void Assign()
{
EOFILE 	= r_EOFILE[cd];
mf	= r_mf[cd];
ch 	= r_ch[cd];
status 	= r_status[cd];
ll 	= r_ll[cd];
cc 	= r_cc[cd];
line 	= r_line[cd];
curline = r_curline[cd];
Targets = r_Targets[cd];
Sources = r_Sources[cd];
Actions = r_Actions[cd];

}

static void GetChar()
{
    if (r_cc[cd] == r_ll[cd])  {
       if (r_status[cd] == NULL)  {
         r_ch[cd] = ' '; r_cc[cd] = 1; r_EOFILE[cd] = TRUE;
          }
       else {
         if ( !Silent ) printf("\n");
         r_ll[cd] = MaxLine; r_cc[cd] = 0;
         r_status[cd] = fgets(r_line[cd], r_ll[cd], r_mf[cd]);
         r_curline[cd] = r_curline[cd]+1;
         if (r_status[cd] != NULL) {
            r_ll[cd] = strlen(r_line[cd]); 

            r_line[cd][r_ll[cd]-1] =  ' '; /* fgets reads also new-line char */
            }
         else {
            r_ch[cd] = ' '; r_cc[cd] = 1; r_EOFILE[cd] = TRUE;
         };
       };
    };
   r_cc[cd] = r_cc[cd]+1; r_ch[cd] = r_line[cd][r_cc[cd]-1];
   r_Targets[cd] = Targets;
   r_Sources[cd] = Sources;
   r_Actions[cd] = Actions;

   Assign();

 } /* GetChar */;


static void PutChar(c)
char c;
{
   if ( c == '%' ) c = '$'; 
   if ( !Silent ) printf("%c",c);
} /* PutChar */;


static void PutChars(s)
char s[];
{
   int i; 
   int len;
   len = strlen(s);
   for (i = 0; i<=len-1; i++) PutChar(s[i]);
   /* if ( !Silent ) printf("%s",s); */
} /* PutChars */;


static int IsEndOfLine()
{
   if ((cc==ll) || EOFILE) return(TRUE); else return(FALSE);
} /*IsEndOfLine*/;


static void GetCh()
{
    if ( EOFILE != TRUE ) GetChar();
   /* Skip Comments */
   while ( (ch == '#') && (cc == 1) && (EOFILE != TRUE)) {
      PutChar(ch); GetChar();
      while ( (cc != 1) && (EOFILE != TRUE) ) {
         PutChar(ch);
         GetChar();
      };
   }    
   /* Escape Text */
   while ( (ch == '^') && (cc == 1) && (EOFILE != TRUE)) {
      GetChar();
      while ( (cc != 1) && (EOFILE != TRUE) ) {
         PutChar(ch);
         GetChar();
      };
   }    
} /* GetCh */;


static void SkipSpaces()
{
   while (((ch == ' ') || (ch == '\t')) && ( EOFILE != TRUE )) { 
      PutChar(ch); 
      GetCh(); 
   };
} /* SkipSpaces */;


static void SkipSpacesNoLine()
{
   while ( ((ch == ' ') || (ch == '\t')) && (cc < ll) ) {
      PutChar(ch);
      GetCh(); 
   };
} /*SkipSpacesNoLine*/;


static void SkipLine()
{
   cc = ll; 
   GetCh();
} /* SkipLine */;


static void FindFile(fin1,fin2,fout)
char fin1[];
char fin2[];
char fout[];

{
   char s[MaxLine]; 

   fout[0] = '\0'; 

   strcat(fout, LogName_FindFile(fin1,fin2));

   if ( strlen(fout) == 0 ) {
      if ((Targets || Sources) && (strlen(fin1) != 0) && (fin1[0] != '$') ) {
         strcat(fout, fin1);
         strcat(fout, "/target/");
         strcat(fout, fin2);
         }
      else {
         strcat(fout, fin1);
         strcat(fout, "/");
         strcat(fout, fin2);
      }
   }
   
} /*FindFile*/;


static void ExpandLogname(s)
char s[];
{
   char p1[MaxLine];
   char p2[MaxLine];
   int  len;

   p1[0] = '\0';
   p2[0] = '%';
   p2[1] = '(';
   p2[2] = '\0';
   GetCh(); if ( ch != '(' ) error("Expected ( after $ in line ",curline);
   GetCh();
   while ( ch != ')') { 
      len = strlen(p1);
      p1[len+1] = '\0';
      p1[len] = ch;
      p2[len+3] = '\0';
      p2[len+2] = ch;
      GetCh();
   };
   GetCh();
   len = strlen(p2);
   p2[len+1] = '\0';
   p2[len] = ')';
   strcat(s,LogName_Tr(p1));
   if ( strlen(s) == 0 ) {
      strcat(s,p2);
   }
} /* ExpandLogname */


static void ProcessFileName()
{
   char part1[MaxLine];
   char npart[MaxLine];
   int len;

   part1[0] = '\0';
   f_name[0] = '\0';
   npart[0] = '\0';

   while (( ch != '/') && (ch != '\\') && (ch != ':') && (ch != ';') && ( ch != ' ') && ( ch != '\t')) {
      if ( ch == '%' ) ExpandLogname(part1);
      else {
         len = strlen(part1);
         part1[len+1] = '\0';
         part1[len] = ch;
         GetCh();
      }
   };
   if ((ch == '/')  ) {
      GetCh();
      while ((ch != '\\') && (ch != ';') && (ch != ':') && ( ch != ' ') && ( ch != '\t')) {
         if ( ch == '%' ) ExpandLogname(f_name);
         else {
            len = strlen(f_name);
            f_name[len+1] = '\0';
            f_name[len] = ch;
            GetCh();
         }
      };
      if ( !Silent ) FindFile(part1, f_name, npart);
      PutChars(npart);
      }
   else PutChars(part1);

   SkipSpacesNoLine();
} /* ProcessFileName */;


static void ProcessIncludeFile()
{
   char part1[MaxLine];
   char part2[MaxLine];
   char npart[MaxLine];
   int len;

   part1[0] = '\0';
   part2[0] = '\0';
   npart[0] = '\0';

   while (( ch != '/') && (ch != '\\') && (ch != ':') && (ch != ';') && ( ch != ' ') && ( ch != '\t')) {
      if ( ch == '%' ) ExpandLogname(part1);
      else {
         len = strlen(part1);
         part1[len+1] = '\0';
         part1[len] = ch;
         GetCh();
      }
   };
   if ((ch == '/')  ) {
      GetCh();
      while ((ch != '\\') && (ch != ';') && (ch != ':') && ( ch != ' ') && ( ch != '\t')) {
         if ( ch == '%' ) ExpandLogname(part2);
         else {
            len = strlen(part2);
            part2[len+1] = '\0';
            part2[len] = ch;
            GetCh();
         }
      };
      FindFile(part1, part2, npart);
      if ( cd == MaxDepth-1 ) error("Too many nested include files", curline);
      cd = cd+1;
      ExpandMake(npart);
      cd = cd-1;
      Assign();
      }
   else {
      if ( cd == MaxDepth-1 ) error("Too many nested include files", curline);
      cd = cd+1;
      ExpandMake(part1);
      cd = cd-1;
      Assign();
   };

   SkipSpacesNoLine();

} /* ProcessIncludeFile */;


static void DepDescr()
{

   int nextsource; 
   int nexttarget;
   char part1[MaxLine];
   char part2[MaxLine];
   char npart[MaxLine];
   int len;

   part1[0] = '\0';
   part2[0] = '\0';
   npart[0] = '\0';

   Targets = TRUE;
   nexttarget = FALSE;

   do {
      SkipSpacesNoLine();
      ProcessFileName();
      if ((strcmp(f_name,target) == 0) && SelectSources ) DepFound = TRUE;
      if (ch != ':' ) {
         if (ch == '\\' ) {
            PutChar(ch); GetCh(); SkipSpacesNoLine();
            SkipLine();
            nexttarget = TRUE;
            }
         else
            if ( nexttarget == TRUE ) 
               error("Expected : or \\ on line ", curline);
            else
               nexttarget = TRUE;
         }
      else nexttarget = FALSE; 
   } while ( nexttarget );

   SkipSpacesNoLine();
   if (ch != ':')  error("Expected colon in line ",curline);
   PutChar(ch); GetCh(); SkipSpacesNoLine();

   Targets = FALSE;
   Sources = TRUE;
   if (IsEndOfLine() ) {
      /*no dependencies*/ 
      SkipLine();
      }
   else {
      nextsource = FALSE;
      do {
         SkipSpacesNoLine();
         if ( DepFound && SelectSources ) Silent = FALSE;
         ProcessFileName();
         if (ch == '\\' ) { 
            PutChar('\\'); GetCh(); SkipSpacesNoLine(); 
            SkipLine();
            if ( DepFound && SelectSources ) Silent = TRUE;
            nextsource = TRUE;
            }
         else if (ch == ';' ) { 
               PutChar(';'); GetCh(); SkipSpacesNoLine();
               SkipLine();
               if ( DepFound && SelectSources ) Silent = TRUE;
               nextsource = FALSE;
            }
         else {
            if ( nextsource == TRUE ) 
               error("Expected ; or \\ on line ", curline);
            else
               nextsource = TRUE;
         };
      } while ( nextsource );
   };

   if ( SelectSources ) Silent = TRUE;
   Sources = FALSE;
   Actions = TRUE;
   SkipSpacesNoLine();
   while ( !IsEndOfLine() ) {
      if (ch == '@' ) {
         PutChar(ch); GetCh();
      };
      part1[0] = '\0';
      part2[0] = '\0';
      while ((ch != '/') && ( ch != ' ')) {
         len = strlen(part1);
         part1[len+1] = '\0';
         part1[len] = ch;
         GetCh();
      };
      if (strcmp(part1,"actions") == 0) {
         if (ch == '/' ) GetCh();


         while (( ch != ' ') && ( ch != '\t')) {
            if ( ch == '%' ) ExpandLogname(part2);
            else {
               len = strlen(part2);
               part2[len+1] = '\0';
               part2[len] = ch;
               GetCh();
            }
         };


         FindFile(part1, part2, npart);
         PutChars(npart);
         while ( !IsEndOfLine() ) {
            PutChar(ch); GetCh();
         }
         }
      else {
         PutChars(part1);
         while ( !IsEndOfLine() ) {
            PutChar(ch); GetCh();
         }
      };
      SkipLine(); 
      SkipSpacesNoLine();
   };
   Actions = FALSE;
} /*DepDescr*/;


static void MakeFile()
{
   char include[MaxLine];
   int len;

   SkipSpaces();
   while ( !EOFILE && !DepFound ) {
      if (ch == '!' ) {
         GetCh(); include[0] = '\0';
         while ( (ch != ' ') && !IsEndOfLine() ) {
            len = strlen(include);
            include[len+1] = '\0';
            include[len] = ch;
            GetCh();
         };
         if (strcmp(include,"include") == 0 ) {
            SkipSpacesNoLine();
            ProcessIncludeFile();
            }
         else {
            PutChar('.'); PutChars(include);
            while ( !IsEndOfLine ) {
            PutChar(ch); GetCh();
            };
         }
         }
      else if (ch == '.' ) {
         PutChar('.'); GetCh(); DepDescr();
         }
      else DepDescr();
      SkipSpaces();
   };

} /* MakeFile */;


void ExpandMake(f)
char f[];
{
   r_cc[cd] = 0; r_ll[cd] = 0; r_curline[cd] = 0; r_ch[cd] = ' ';
   r_EOFILE[cd] = 0; r_Targets[cd] = 0; r_Sources[cd] = 0; r_Actions[cd] = 0;
   r_status[cd] = "a";
  
   r_mf[cd] = fopen( f, "r" );

   r_cur_file[cd][0] = '\0'; strcat(r_cur_file[cd], f);

   Assign();
   
   MakeFile();

   fclose(r_mf[cd]);
};


void SetTarget(t)
char t[];
{
   target[0] = '\0';
   strcat(target,t);
   if ( strlen(target) > 0 ) { SelectSources = TRUE; Silent = TRUE; }
};


main(argc, argv)
int argc;
char *argv[];
{

   if (( argc != 5 ) && ( argc !=4 )) 
      { printf("usage: genmake <paths> <makecomp> <makefile> [<target>] \n"); exit(1);}

   LogName_Init(argv[1]);

   if ( argc == 5 ) SetTarget(argv[4]);
   else SetTarget("\0");

   ExpandMake(LogName_FindFile(argv[2],argv[3]));
   exit(0);

}
