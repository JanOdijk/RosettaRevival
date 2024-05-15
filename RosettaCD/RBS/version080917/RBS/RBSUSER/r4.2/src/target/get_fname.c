#include <stdio.h>
#include <dirent.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <errno.h>
#include <stdlib.h>
#include "logname.h"


main(argc, argv)
int argc;
char *argv[];
{

   LogName_Init(argv[1]);


   if ( argc != 4 ) 
      { printf("usage: get_fname < paths> <component> <filename> \n"); exit(1);}

   printf("%s", LogName_FindFile(argv[2],argv[3]));


   exit(0);

}
