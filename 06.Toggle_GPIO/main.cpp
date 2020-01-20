#include "mbed.h"
 
#define PORTA_Pins (0xA0) // PA_5 + PA_7 = PORTA_Pins
 
PortOut myPORTA_Pins(PortA, PORTA_Pins);
 
int main() 
{
    while(1)
     {   
        myPORTA_Pins = myPORTA_Pins ^ PORTA_Pins; // Toggle PORTA_Pins level
        wait(0.5); // 500 ms
    }
}
 