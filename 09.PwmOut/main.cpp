#include "mbed.h"

PwmOut led(LED1);

int main() {
    led.period(4.0f);      // 4 second period
    led = 0.5f;          // shorthand for led.write()
    while(1);
}