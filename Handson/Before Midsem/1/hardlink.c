#include <unistd.h>
#include <stdio.h>

int main(int argc, char* argv[]) {
	// man 2 link
	printf("hardlink: %s %s", argv[1], argv[2]);
	link(argv[1], argv[2]);
}