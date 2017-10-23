#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

int main() {

	int fd_w = open("./14.fifo", O_RDONLY);

	char buf[80];
	read(fd_w, buf, 80);

	printf("%s\n", buf);
	close(fd_w);
}
