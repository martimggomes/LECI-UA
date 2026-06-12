#include <detpic32.h>

void send2displays(unsigned char value)
{
    static const char disp7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    static char displayFlag = 0; // static variable: doesn't loose its
    // value between calls to function
    int digit_low = value & 0x0F;
    int digit_high = value >> 4;

    if (displayFlag == 0)
    {
        // ativar display low(RD6 = 0, RD5 = 1)
        LATD = (LATD & 0xFF9F) | 0x0020;
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_low] << 8);
    }
    else
    {
        LATD = (LATD & 0xFF9F) | 0x0040;
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_high] << 8);
        // Ativar display high (RD6 = 1, RD5 = 0)
    }

    displayFlag = !displayFlag;
    // if "displayFlag" is 0 then send "digit_low" to display_low
    // else send "digit_high" to didplay_high
    // toggle "displayFlag" variable
}

int main(void)
{

    int main(void)
    {
        // Configure RB8-RB14 as outputs
        TRISB = TRISB & 0x80FF; // 1000 0000 1111 1111

        // Configure RD5-RD6 as outputs
        TRISD = TRISD & 0xFF9F; // 1111 1111 1001 1111

        while (1)
        {

            send2displays(0x15);
            // Wait 0.2s
            resetCoreTimer();
            while (readCoreTimer() < 4000000)
                ; // 20000000 x 0.2
        }
        return 0;
    }
}