#include "mbed.h"

DigitalOut myled1(LED_BLUE);
DigitalOut myled2(LED_RED);
DigitalOut myled3(LED_GREEN);

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
        myled3= 1;
        wait(0.2);
        myled3 = 0;
        wait(0.2);
    }
}
