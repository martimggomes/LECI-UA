#include <detpic32.h>

int main(void)
{
    TRISE = TRISE & 0xFF87; // 1111 1111 1000 0111

    int counter = 0;

    LATE = (LATE & 0xFF87) | counter << 3;

    resetCoreTimer();
    while(readCoreTimer() < 7407407); //  f = 2.7hz

    counter = (counter + 9) %10;
}