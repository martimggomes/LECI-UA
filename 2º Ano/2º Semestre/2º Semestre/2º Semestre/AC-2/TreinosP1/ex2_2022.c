#include <detpic32.h>

int main(void)
{
    static const char disp7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    int sum, media, volt;

    TRISBbits.TRISB4 = 1;  // RBx digital output disconnected
    AD1PCFGbits.PCFG4 = 0; // RBx configured as analog input
    AD1CON1bits.SSRC = 7;  // Conversion trigger selection bits: in this
    // mode an internal counter ends sampling and
    // starts conversion
    AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
    // interrupt is generated. At the same time,
    // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16;    // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 4 - 1; // Interrupt is generated after N samples
    // (replace N by the desired number of
    // consecutive samples)
    AD1CHSbits.CH0SA = 4; // replace x by the desired input
    // analog channel (0 to 15)
    AD1CON1bits.ON = 1; // Enable A/D converter
    // This must the last command of the A/D
    // configuration sequence

    TRISB = TRISB & 0x80FF;
    TRISD = TRISD & 0xFF9F;
    TRISBbits.TRISB1 = 1;
    TRISEbits.TRISE4 = 0;
    LATEbits.LATE4 = 0;

    while (1)
    {
        resetCoreTimer();
        while (readCoreTimer() < 1666667)
            ;
        AD1CON1bits.ASAM = 1; // Start conversion
        while (IFS1bits.AD1IF == 0)
            ; // While conversion not done

        sum = (ADC1BUF0 + ADC1BUF1 + ADC1BUF2 + ADC1BUF3);
        media = sum / 4;

        printInt(media, 2 | 10 << 16);
        putChar('\n');

        volt = (media * 9) / 1023;
        volt = volt + 3;

        if (PORTBbits.RB1 == 0)
        {
            LATD = (LATD & 0xFF9F) | 0x0020; // 1111 1111 1011 1111 RD5 a 1
        }
        else
        {
            LATD = (LATD & 0xFF9F) | 0x0040;
        }

        LATB = (LATB & 0x80FF) | (disp7Scodes[volt] << 8);

        LATEbits.LATE4 = !LATEbits.LATE4;

        IFS1bits.AD1IF = 0;
    }
    return 0;
}