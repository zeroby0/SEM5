#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include <sys/types.h>
#include <pwd.h>
#include <grp.h>
#include <sys/stat.h>

#include <stdio.h>

int main(int argc, char* argv[]) {
	struct stat fileInfo;
	struct timespec timeinfo;

	stat(argv[1], &fileInfo);
 	switch (fileInfo.st_mode & S_IFMT) {
	    case S_IFBLK:  printf("block device\n");            break;
	    case S_IFCHR:  printf("character device\n");        break;
	    case S_IFDIR:  printf("directory\n");               break;
	    case S_IFIFO:  printf("FIFO/pipe\n");               break;
	    case S_IFLNK:  printf("symlink\n");                 break;
	    case S_IFREG:  printf("regular file\n");            break;
	    case S_IFSOCK: printf("socket\n");                  break;
	    default:       printf("unknown?\n");                break;
    }

	// https://en.wikipedia.org/wiki/Stat_(system_call)
	// https://linux.die.net/man/2/stat
	// man 2 stat

}