#include <unistd.h>
#include <stdio.h>

int main(int argc, char* argv[]) {
	// man symlink
	printf("softlink: %s %s", argv[1], argv[2]);
	return symlink(argv[1], argv[2]);
}