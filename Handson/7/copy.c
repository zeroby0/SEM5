#include <stdio.h>
#include <fcntl.h>

#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>

// for strcmp
#include <string.h>

int createFile(char* fileName, int permissions) {
    int fd = creat(fileName, permissions);
    return fd;
}

int copy(char* src, char* dest) {
    // Copy file.
    // Read file and write to new file
    
    char buff[2];

    int f_src = open(src, O_RDONLY);

    if(f_src == -1) {return -1;}
    if(f_src < 3) {return -2;}
    
    int f_dest = createFile(dest, 0744);
    
    if(f_dest < 3) {return -3;}
    
    while(read(f_src, buff, 1) != 0) {
        write(f_dest, buff, 1);
    }
    
    close(f_src);
    close(f_dest);

    return f_src;
}

int main(int argc, char *argv[]) {
    char* command = argv[0];
    if(argc != 3) {
        printf("expected:\n%s <source> <destination>\n", command);
        return -1;
    }
    
    char* source = argv[1]; 
    char* destination = argv[2];
    
    if( strcmp(source, destination) == 0 ){
        printf("Source and destination cannot be same.\n");
        return(-3);
    }
    
    int result = copy(source, destination);
    if(result == -1){
        printf("%s: cannot find \'%s\': No such file\n", command, source);
    }
}