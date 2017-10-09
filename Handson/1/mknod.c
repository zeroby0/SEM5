#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>

int main(int argc, char* argv[]) {
	// man 2 mkfifo
	// http://pubs.opengroup.org/onlinepubs/7908799/xsh/sysstat.h.html
	// read, write, execute/search by owner
	mkfifo(argv[1], S_IRWXU);
}