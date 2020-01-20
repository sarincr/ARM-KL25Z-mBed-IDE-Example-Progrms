#include "mbed.h"

DigitalOut myled1(LED_RED);
DigitalOut myled2(LED2);

int main() 
{
    while(1) 
    {
        myled1 = 1;
        wait(0.2);
        myled1 = 0;
        wait(0.2);
        myled2= 1;
        wait(0.2);
        myled2 = 0;
        wait(0.2);
    }
}
