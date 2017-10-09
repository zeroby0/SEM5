#include <fcntl.h>
#include <stdio.h>

int main(int argc, char const *argv[])
{
	int fd_1 = open(argv[1], O_RDWR);

	int fcn = fcntl(fd_1, F_GETFL);

	printf("mode: %d\n", fcn);
	
	if (fcn == O_RDWR) {
		printf("File opened in O_RDWR mode\n");
	}

	return 0;
}

/*
           O_RDONLY        open for reading only
           O_WRONLY        open for writing only
           O_RDWR          open for reading and writing
           O_NONBLOCK      do not block on open or for data to become available
           O_APPEND        append on each write
           O_CREAT         create file if it does not exist
           O_TRUNC         truncate size to 0
           O_EXCL          error if O_CREAT and the file exists
           O_SHLOCK        atomically obtain a shared lock
           O_EXLOCK        atomically obtain an exclusive lock
           O_NOFOLLOW      do not follow symlinks
           O_SYMLINK       allow open of symlinks
           O_EVTONLY       descriptor requested for event notifications only
           O_CLOEXEC       mark as close-on-exec
*/