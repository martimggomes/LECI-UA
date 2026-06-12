#include <detpic32.h>

int main(void)
{
    TRISBbits.TRISB4 = 1;  // aqui é so preciso meter 4 no fim
    AD1PCFGbits.PCFG4 = 0; // aqui é so preciso meter 4 no fim
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 2 - 1; // = N -1(N = conversoes por amostra)
    AD1CHSbits.CH0SA = 4;     // = x (x = 4)
    AD1CON1bits.ON = 1;

    static const int segments[] = {0x3F, 0x06, 0x5b, 0x4F, 0x66, 0x6D, 0x7C, 0x07, 0x7F, 0x67, 0x5F, 0x7C, 0x39, 0x5E, 0x79, 0x71};

    TRISB = TRISB & 0x80FF; // 1000 0000 1111 1111
    LATB = LATB & 0x80FF;

    TRISD = TRISD & 0xFF9F; // 1111 1111 1001 1111
    LATDbits.LATD5 = 1;
    LATDbits.LATD6 = 0;

    TRISEbits.RE1 = 0;
    int media;
    while (1)
    {

        resetCoreTimer();
        while (readCoreTimer() < 3333333)
            ;

        AD1CON1bits.ASAM = 1; // Inicia conversão
        while (IFS1bits.AD1IF == 0)
            ;

        media = (ADC1BUF0 + ADC1BUF1) / 2;
        printInt(media, 16 | 3 << 16);
        putchar('\r');

        int volt = (media * 9) / 1023;

        LATB = (LATB & 0x80FF) | (segments[volt] << 8);
        LATEbits.LATE1 = !LATEbits.LATE1;

        ISF1bits.AD1IF = 0;
    }
}

