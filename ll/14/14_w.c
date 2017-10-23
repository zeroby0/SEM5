#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>

int main(int argc, char const *argv[])
{
	int fd = open("14.pipe", O_WRONLY);

	printf("%d\n", fd);
	write(fd, "Hello", 80);
	close(fd);
	return 0;
}