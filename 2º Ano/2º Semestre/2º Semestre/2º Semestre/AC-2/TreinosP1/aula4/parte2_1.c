#include <detpic32.h>

int main(void)
{
    TRISB = TRISB & 0x80FF     // 1000 0000 1111 1111
    TRISD = TRISD & 0XFF9F // 1111 1111 1001 1111

    LATDbits.LATD5 = 1;

    LATDbits.LATD6 = 0;

    while (1)
    {

        char ch = getChar();

        if (ch == 'a')
            LATB = (LATB & 0x80FF) | (1 << 8);
        else if (ch == 'b')
            LATB = (LATB & 0x80FF) | (1 << 9);
        else if (ch == 'c')
            LATB = (LATB & 0x80FF) | (1 << 10);
        else if (ch == 'd')
            LATB = (LATB & 0x80FF) | (1 << 11);
        else if (ch == 'e')
            LATB = (LATB & 0x80FF) | (1 << 12);
        else if (ch == 'f')
            LATB = (LATB & 0x80FF) | (1 << 13);
        else if (ch == 'g')
            LATB = (LATB & 0x80FF) | (1 << 14);
    }

    return 0;
}