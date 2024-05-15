#include <stdio.h>
#include <dirent.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <errno.h>
#include <stdlib.h>


main(argc, argv)
int argc;
char *argv[];
{

   if ( argc != 2 ) { printf("usage: fuid <command>\n"); exit(1);}

   if ( setuid(@) ) {
                perror(NULL);
		printf("Cannot change to apeall id.\n") ;
		exit(1);
   }

   if ( system(argv[1]) ) {
                perror(NULL);
                printf("Shell action failed.\n");
                exit(1);
   }

   exit(0);

}
