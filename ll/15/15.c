#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>



int main() {
	char* fifo = "./15.fifo";

	int fd_w = open(fifo, O_WRONLY);
	printf("%d\n", fd_w);
	int fd_r = open(fifo, O_RDONLY);

	printf("%d %d\n", fd_r, fd_w);

	return(-1);

	if(!fork()) {

		int fd_cw = fcntl(fd_w, F_DUPFD);
		int fd_cr = fcntl(fd_r, F_DUPFD);

		close(fd_cw);
		char buf[80];
		read(fd_cr, buf, 80);

		printf("Message from parent: %s\n", buf);

		close(fd_cr);

		// ----------

		fd_cw = open(fifo, O_WRONLY);

		write(fd_cw, "sdkfhvdsjhv", 80);

		close(fd_cw);
		
	} else {

		close(fd_r);
		write(fd_w, "jhb", 80);

		close(fd_w);

		// -------
		fd_r = open(fifo, O_RDONLY);

		char buf[80];
		read(fd_r, buf, 80);

		close(fd_r);




	}
}