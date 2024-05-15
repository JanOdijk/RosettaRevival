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
