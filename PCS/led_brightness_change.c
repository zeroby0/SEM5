#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <time.h>
#include <unistd.h>

#define BCM2708_PERI_BASE        0x3F000000
#define GPIO_BASE                (BCM2708_PERI_BASE + 0x200000) /* GPIO controller */
 
int  mem_fd;
void *gpio_map;
 
// I/O access
unsigned *gpio;
 
// GPIO setup macros. Always use INP_GPIO(x) before using OUT_GPIO(x) 
void INP_GPIO(int g){
        *(gpio+((g)/10)) &= ~(7<<(((g)%10)*3));
}
 
void OUT_GPIO(int g){
        *(gpio+((g)/10)) |=  (1<<(((g)%10)*3));
}

void GPIO_SET(int g){
        *(gpio+7) = 1 << g;
}  // sets   bits which are 1 ignores bits which are 0

void GPIO_CLR(int g){
        *(gpio+10) = 1<<g;
}// clears bits which are 1 ignores bits which are 0

void setup_io();

int main(int argc, char **argv)
{
  // Set up gpi pointer for direct register access
  setup_io();
 
  INP_GPIO(16); //setting gpio 3 to input
  OUT_GPIO(16); //setting gpio 3 to output

  float ch = 0;
  int inc = 1;
  while(1){
    if (ch>0.9) {inc = -1;}
    if (ch < 0.1){inc  = 1;}

        GPIO_SET(16);
        usleep(20*1000*ch);
        printf("done blinking! %f\n", 5*ch);
        GPIO_CLR(16);
        usleep(20*1000*(1-ch));
        printf("done clearing!               %f\n", 5*(1-ch));
        ch = ch + inc*0.1;
  }

  return 0;
 
} 
 
//
// Set up a memory regions to access GPIO
//
void setup_io()
{
   /* open /dev/mem */
   if ((mem_fd = open("/dev/mem", O_RDWR|O_SYNC) ) < 0) {
      printf("can't open /dev/mem \n");
      exit(-1);
   }

   /* mmap GPIO */
   gpio_map = mmap(
      NULL,             //Any adddress in our space will do
      4*1024,       //Map length
      PROT_READ|PROT_WRITE,// Enable reading & writting to mapped memory
      MAP_SHARED,       //Shared with other processes
      mem_fd,           //File to map
      GPIO_BASE         //Offset to GPIO peripheral
   );
 
   close(mem_fd); //No need to keep mem_fd open after mmap
 
   if (gpio_map == MAP_FAILED) {
      printf("mmap error %d\n", (int)gpio_map);//errno also set!
      exit(-1);
   }
 
   // Always use volatile pointer!
   gpio = (unsigned *)gpio_map;
 
 
}


