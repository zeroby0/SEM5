#include <unistd.h>
#include <fcntl.h>

#include <stdio.h>

int main(int argc, char const *argv[])
{
	// int fd_1 = open(argv[1], O_APPEND);

	int fd_1 = open(argv[1], O_RDWR);

	int fd_2 = fcntl(fd_1, F_DUPFD);

	printf("%d %d\n", fd_1, fd_2);

	write(fd_1, "Append1", 7); // 8 including the /n
	write(fd_2, "Append2 ", 8);

	close(fd_2);
	close(fd_1);

	return 0;
}