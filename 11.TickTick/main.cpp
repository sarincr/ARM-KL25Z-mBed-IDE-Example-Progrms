#include "mbed.h"

Ticker tick;
DigitalOut led1(LED_RED);
DigitalOut led2(LED_GREEN);

void flip()
{
    led2 = !led2;
}

int main()
{
    tick.attach(&flip, 0.7); // setup ticker to call flip every 0.7 seconds

    while (true) {
        led1 = !led1;
        wait (0.3); // flip led1 every 0.3 seconds
    }
}
