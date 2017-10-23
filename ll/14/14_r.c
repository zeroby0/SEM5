#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>

int main(int argc, char const *argv[])
{
	int fd = open("14.pipe", O_RDONLY);
	printf("%d\n", fd);

	char buf[80];

	read(fd, buf, 80);

	printf("%s\n", buf);
	return 0;
}