#include <detpic32.h>

int main(void) {
    unsigned int padrao = 0x30;  

    TRISE = TRISE & 0xFF03;  // Configura RE7 a RE2 como saída
    TRISB = TRISB | 0x0005;  // Configura RB2 e RB0 como entrada

    while(1) {
        LATE = LATE & 0xFF03;  // Limpa os bits de saída antes de definir um novo padrão

        // Verifica o estado dos switches e define os ciclos de espera
        if (PORTBbits.RB2 == 1 && PORTBbits.RB0 == 1) {  
            resetCoreTimer();
            while(readCoreTimer() < 2739726);
             // Ambos ON, frequência = 7.3 Hz
        }
        else if (PORTBbits.RB2 == 0 && PORTBbits.RB0 == 0) {  
            resetCoreTimer();
            while(readCoreTimer() < 4347826);
          // Ambos OFF, frequência = 4.6 Hz
        }

        // Atualiza os LEDs
        LATE = (LATE & 0xFF03) | (padrao << 2);

        // Atualiza o padrão dos LEDs
        if (padrao == 0x03) {
            padrao = 0x30;
        } else {
            padrao = (padrao >> 1);
        }
    }

    return 0;
}