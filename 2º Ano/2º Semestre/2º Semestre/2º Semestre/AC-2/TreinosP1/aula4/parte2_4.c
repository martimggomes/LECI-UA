#include <detpic32.h>
int main(void)
{
    unsigned char segment;
    // enable display low (RD5) and disable display high (RD6)
    // configure RB8-RB14 as outputs
    // configure RD5-RD6 as outputs

    TRISB = TRISB & 0x80FF;
    TRISD = TRISD & 0XFF9F;

    // LATDbits.LATD5 = 0;
    // LATDbits.LATD6 = 1;

    LATD = (LATD & 0XFF9F) | 0x00400 
    // o and mete os dois a zero e depois com o or fica so o 6 a 1
    //0x00400 -> 0000 0000 0100 0000
    while (1)
    {
        segment = 1;
        for (int i = 0; i < 7; i++)
        {
            // send "segment" value to display
            LATB = (LATB & 0x80FF | (segment << 8));
            // wait 0.5 second
            resetCoreTimer();
            while(readCoreTimer() < 10000000);
            segment = segment << 1;
        }
        // toggle display selection
        // LATDbits.LATD5 = !LATDbits.LATD5;
        // LATDbits.LATD6 = !LATDbits.LATD6;

        LATD = LATD ^ 0x0060
        //0x0060 -> 0000 0000 0110 0000
    }
    return 0;
}