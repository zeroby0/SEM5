#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>

volatile unsigned char *mmap_clk;

#define CM_GP0CTL (0x7e101070) 
#define GPFSEL0 (0x7E200000)   
#define CM_GP0DIV (0x7e101074) 
#define GPIO_BASE (0x7E200000)

#define ACCESS(offset, type) (*(volatile type*)(offset+(int)mmap_clk-0x7e000000))

void setup_fm(int state) {


    int mem_fd = open("/dev/mem", O_RDWR|O_SYNC);
    if (mem_fd < 0) {
        printf("can't open /dev/mem\n");
        exit(-1);
    }
    mmap_clk = (unsigned char *)mmap(
                  NULL,
                  0x01000000,  // len
                  PROT_READ|PROT_WRITE,
                  MAP_SHARED,
                  mem_fd,
                  0x3F000000  
              );

    if (mmap_clk == (unsigned char *)-1) {
        exit(-1);
    }


    int tmp = ACCESS(GPFSEL0, int);
    tmp = (tmp | (1<<14)) & ~ ((1<<12) | (1<<13));
    ACCESS(GPFSEL0, int) = tmp;

    struct GPCTL {
        char SRC         : 4;
        char ENAB        : 1;
        char KILL        : 1;
        char             : 1;
        char BUSY        : 1;
        char FLIP        : 1;
        char MASH        : 2;
        unsigned int     : 13;
        char PASSWD      : 8;
    };
    ACCESS(CM_GP0CTL, struct GPCTL) = (struct GPCTL) {6, state, 0, 0, 0, state, 0x5a };
}

void modulate(int period) {
    struct CM_GP0DIV_T {
        unsigned int DIV : 24;
        char PASSWD : 8;
    };

    ACCESS(CM_GP0DIV, struct CM_GP0DIV_T) = (struct CM_GP0DIV_T) { period, 0x5a };
}

void delay(int n) {
    volatile static int clock = 0;
    for (int i = 0; i < n; ++i) {
        ++clock;
   

void playWav(char *filename, int mod, float bw) {
    int fp = open(filename, 'r');
    lseek(fp, 44, SEEK_SET); //Skipping header
    short *data = (short *)malloc(1024);
    printf("Now broadcasting: %s\n", filename);

    while (read(fp, data, 1024)) {

        for (int j = 0; j<1024/2; j++) {
            int dval = (int)floor((float)(data[j])/65536.0f*bw);
            modulate(dval+mod);
            delay(2000);
        }
    }
}

int main(int argc, char **argv) {
    printf("sudo ./ s.wav freq bw\n");
    setup_fm(1);
    float freq = atof(argv[2]);
    float bw = atof(argv[3]);
    int mod = (500/freq)*4096;
    modulate(mod);
    playWav(argv[1],mod,bw);
    return 0;
}


