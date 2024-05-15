h29324
s 00015/00001/00000
d D 1.2 95/10/17 11:26:29 rous 2 1
c 
e
s 00001/00000/00000
d D 1.1 95/10/17 09:07:14 rous 1 0
c date and time created 95/10/17 09:07:14 by rous
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
   printf("s/@/%d/\n",getuid());
   exit(0);
}
E 2
E 1
