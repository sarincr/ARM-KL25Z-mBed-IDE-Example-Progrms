#include "mbed.h"
#include "TSISensor.h"

int main(void) {
    PwmOut led(LED_GREEN);
    TSISensor tsi;
    
    while (true) {
        led = 1.0 - tsi.readPercentage();
        wait(0.1);
    }
}