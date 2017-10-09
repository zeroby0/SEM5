#include <stdio.h>

int main(int argc, char const *argv[])
{
	extern char** environ;

	// BSD uses char** in contrast to ; separated values in linux
	// for linux, use
	// extern char* environ
	// printf("%s\n", environ);
	for(int i = 0; i < 50; i++) {
		printf("%s\n", environ[i]);
	}
	
	return 0;
}