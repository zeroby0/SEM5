#define BCM2708_PERI_BASE        0x3F000000
#define GPIO_BASE                (BCM2708_PERI_BASE + 0x200000) /* GPIO controller */
 
 
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>
 
#define PAGE_SIZE (4*1024)
#define BLOCK_SIZE (4*1024)
 
int  mem_fd;
void *gpio_map;
 
// I/O access
volatile unsigned *gpio;
 
void INP_GPIO(int g) {
  *(gpio+((g)/10)) &= ~(7<<(((g)%10)*3));
}


void OUT_GPIO(int g) {
  *(gpio+((g)/10)) |=  (1<<(((g)%10)*3));
}

void GPIO_SET(int g) {
  *(gpio + 7) = 1 << g;
}

void GPIO_CLR(int g) {
  *(gpio + 10) = 1 << g;
}



void setup_io();
 
 
int main(int argc, char **argv)
{
  setup_io();
  int pin = 7;

  INP_GPIO(pin);
  OUT_GPIO(pin);

 
  float ch = 0;
  int incr = 1;


  while(1) {
    if(ch > 0.9) incr = -1;
    if(ch < 0.1) incr = +1;

    GPIO_SET = 1 << pin;
    usleep(ch * 1000);
    GPIO_CLR = 1 << pin;
    usleep((1 - ch) * 1000);

    ch = ch + 0.1*incr;
  }
 
  return 0;
 
} // main
 
 
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
      BLOCK_SIZE,       //Map length
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
   gpio = (volatile unsigned *)gpio_map;
 
 
} // setup_io