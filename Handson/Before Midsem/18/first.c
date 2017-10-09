#include <fcntl.h>

#include <unistd.h>

int main(int argc, char const *argv[])
{
	int fd = open(argv[1], O_WRONLY);

	int ticket1 = 21;
	int ticket2 = 31;
	int ticket3 = 42;

	write(fd, &ticket1, sizeof(int));
	write(fd, &ticket2, sizeof(int));
	write(fd, &ticket3, sizeof(int));

	close(fd);
	return 0;
}