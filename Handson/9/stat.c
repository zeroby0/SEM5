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

	printf("Inode Number: %d\n", (int) fileInfo.st_ino);
	printf("Number of hardlinks: %d\n", (int) fileInfo.st_nlink);
	printf("UID: %d\n", (int) fileInfo.st_uid);
	printf("GID: %d\n", (int) fileInfo.st_gid);
	printf("Size: %ld\n", (long int) fileInfo.st_size);
	printf("Block Size: %ld\n", (long int) fileInfo.st_blksize);
	printf("Number of blocks: %ld\n", (long int) fileInfo.st_blocks);
	printf("Time of last access: %s", ctime(&fileInfo.st_atimespec.tv_sec));
	printf("Time of last modification: %s", ctime(&fileInfo.st_mtimespec.tv_sec));
	printf("Time of last change: %s", ctime(&fileInfo.st_ctimespec.tv_sec));

	// https://en.wikipedia.org/wiki/Stat_(system_call)
	// man 2 stat

}