#include <sys/select.h>
#include <stdio.h>

int main(int argc, char const *argv[])
{
	struct timeval time;

	time.tv_sec = 10;
	time.tv_usec = 0;

	fd_set set;

	FD_ZERO(&set);

	FD_SET(0, &set);

	int result = select(FD_SETSIZE, &set, NULL, NULL, &time);

	if(result == 1) {
		printf("Data available!\n");
	} else if (result == 0) {
		printf("Data was not available within 10 seconds.\n");
	}
	return 0;
}