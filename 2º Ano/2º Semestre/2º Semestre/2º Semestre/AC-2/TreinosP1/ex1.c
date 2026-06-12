#include <detpic32.h>

int main(void)
{

    int counter = 0;
    TRISE = TRISE & 0xFFC3; // 1111 1111 1100 0011

    TRISB = TRISB | 0x0004; // 0000 0000 0000 0100

    int freq;

    while (1)
    {

        LATE = (LATE & 0xFFC3) | (counter << 2);

        if (PORTBbits.RB2 == 1)
        {
            freq = 5.5;
            resetCoreTimer();
            while (readCoreTimer() < (20000000 / 5.5))
                ;
        }

        else if (PORTBbits.RB2 == 0)
        {
            freq = 2.3;
            resetCoreTimer();
            while (readCoreTimer() < (20000000 / 2.3))
                ;
        }

        counter = (counter + 11) % 12;

        printInt(counter, 10 | 2 << 16);
        putChar('\r');
    }
    return 0;
}

//ESTA BEM