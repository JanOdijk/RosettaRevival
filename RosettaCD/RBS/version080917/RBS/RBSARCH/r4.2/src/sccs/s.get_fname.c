h42844
s 00026/00001/00000
d D 1.2 95/10/17 11:26:27 rous 2 1
c 
e
s 00001/00000/00000
d D 1.1 95/10/17 09:07:11 rous 1 0
c date and time created 95/10/17 09:07:11 by rous
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
E 2
E 1
