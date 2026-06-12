#include <detpic32.h>

int main(void)
{
    TRISE = TRISE & 0xFFC0; // 1111 1111 1100 0000

    int padrao = {1, 2, 4, 8, 16, 32};
    int indice = 0;
    int freq;

    TRISB = TRISB | 0x0004 // 0000 0000 0000 0100

            while (1)
    {

        LATE = (LATE & 0xFFC0) | (padrao[indice] << 2);
        if (PORTBbits.RB2 == 1)
        {
            freq = 7;
            resetCoreTimer();
            while (readCoreTimer() < (20000000 / 7))
                ;
        }

        else if (PORTBbits.RB2 == 0)
        {
            freq = 3;
            resetCoreTimer();
            while (readCoreTimer() < (20000000 / 3))
                ;
        }

        indice = (indice + 1) % 6;
    }
}