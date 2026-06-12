#include <detpic32.h>

#include <detpic32.h>

void send2displays(unsigned char value)
{
    static const char disp7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    static char displayFlag = 0; // static variable: doesn't loose its value between calls to function

    int digit_low = value & 0x0F;
    int digit_high = value >> 4;

    if (displayFlag == 0)
    {
        // Envia "digit_low" para o display baixo (RB8-RB11)

        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_low] << 8); // Configura os pinos RB8-RB11 com os segmentos correspondentes
        LATD = (LATD & 0xFF9F) | 0x0020;                        // RD5 = 1
    }
    else
    {
        // Envia "digit_high" para o display alto (RB12-RB14)

        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_high] << 8); // Configura os pinos RB12-RB14 com os segmentos correspondentes
        LATD = (LATD & 0xFF9F) | 0x0040;                         // RD6 = 1
    }

    // Toggle displayFlag
    displayFlag = !displayFlag;
}

int main(void)
{
    // declare variables
    int counter, i;
    // initialize ports
    TRISB = TRISB & 0x80FF;
    TRISD = TRISD & 0xFF9F;
    counter = 0;
    while (1)
    {
        i = 0;
        do
        {
            send2displays(counter);
            resetCoreTimer();
            while (readCoreTimer() < 400000)
                ;
            // wait 20 ms (1/50Hz)
 } while(++i < 10);//200/20
 // increment counter (mod 256)
 counter = (counter + 1) % 256;
    }
    return 0;
}