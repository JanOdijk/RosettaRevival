h48176
s 00030/00001/00000
d D 1.2 95/10/17 11:21:31 rous 2 1
c 
e
s 00001/00000/00000
d D 1.1 95/10/17 09:06:58 rous 1 0
c date and time created 95/10/17 09:06:58 by rous
e
u
U
f e 0
t
T
I 1
D 2
 
E 2
I 2
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
E 2
E 1
