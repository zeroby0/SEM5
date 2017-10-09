#include <stdio.h>
#include <fcntl.h>

#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>

// for strcmp
#include <string.h>

int cat(char* src) {
    char buff[2];

    int f_src = open(src, O_RDONLY);

    if(f_src == -1) {return -1;}
    if(f_src < 3) {return -2;}
    
    while(read(f_src, buff, 1) != 0) {
        // writing to STDOUT
        write(2, buff, 1);
    }
    
    close(f_src);

    return f_src;
}

int main(int argc, char *argv[]) {
    char* command = argv[0];
    
    char* source = argv[1]; 

    return cat(source);
}