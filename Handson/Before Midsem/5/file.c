#include <fcntl.h>

int main() {
	open("1.txt", O_WRONLY);
	open("2.txt", O_WRONLY);
	open("3.txt", O_WRONLY);
	open("4.txt", O_WRONLY);
	open("5.txt", O_WRONLY);

	getchar();
}