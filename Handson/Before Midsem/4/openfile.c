#include <fcntl.h>

int main(int argc, char* argv[]) {
	// O_EXCL          error if O_CREAT and the file exists
	// O_RDWR          open for reading and writing
	// man 2 open
	open(argv[1], O_RDWR);
}