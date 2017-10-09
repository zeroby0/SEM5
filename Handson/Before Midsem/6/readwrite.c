#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>

int main() {
	char* c = "a";
	while(1) {
		// the integer file descriptors associated with the
        // streams stdin, stdout, and stderr are 0, 1, and 2
		// http://man7.org/linux/man-pages/man3/stdin.3.html

		read(0, &c, 1);
		write(1, &c, 1);
	}
}

