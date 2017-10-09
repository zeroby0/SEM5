#include <fcntl.h>
#include <unistd.h>

#include <stdio.h>

int main(int argc, char const *argv[])
{
	int fd_src = open(argv[1], O_RDWR);

	printf("%d\n", fd_src);

	write(fd_src, "abcdefghij", 10);

	// lseek(int fildes, off_t offset, int whence);
	// If whence is SEEK_CUR, the offset is set to its current location plus offset bytes.
	printf("%d\n", (int) lseek(fd_src, 10, SEEK_CUR));

	write(fd_src, "mnopqrstuv", 10);

	close(fd_src);

	return 0;
}