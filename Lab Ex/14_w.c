#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

int main() {

	int fd_w = open("./14.fifo", O_WRONLY);

	write(fd_w, "char", strlen(char));

	close(fd_w);
}
