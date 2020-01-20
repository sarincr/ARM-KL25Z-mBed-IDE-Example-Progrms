#include "mbed.h"

PwmOut led(LED1);

int main() {
    led.period(4.0f);      // 4 second period
    led.write(0.50f);      // 50% duty cycle, relative to period
    while(1);
}