#include <fcntl.h>

#include <sys/types.h>
#include <unistd.h>

#include <stdio.h>

int main(int argc, char const *argv[])
{
	
	int fd = open(argv[1], O_RDONLY);

	struct flock lock;

	lock.l_start = 0;
	lock.l_len = 0; // Till the end of the file
	lock.l_pid = getpid();
	lock.l_type = F_RDLCK;
	lock.l_whence = SEEK_SET;

	printf("Before entering critical section\n");

	fcntl(fd, F_SETLKW, &lock);

	printf("Inside critical section\n");

	printf("Enter to unlock\n");

	getchar();

	printf("Unlocked\n");

	lock.l_type = F_UNLCK;

	fcntl(fd, F_SETLK, &lock);
	return 0;
}