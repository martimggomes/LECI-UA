    .equ ADDR_BASE_HI, 0XBF88
    .equ TRISE,  0x6100
    .equ LATE, 0x6120
    .equ TRISB, 0x6040
    .equ PORTB, 0x6050
    .equ
    .data
    .text
    .globl main

main:

    lui $t0,ADDR_BASE_HI                #$t0 = 0xBF880000
    lw $t1, TRISE($t0)
    andi $t1,$t1,0xFFFE                 #bit 0 a 0
    sw $t1,TRISE($t0)


    lw $t2,TRISB($t0)
    ori $t2,$t2,0x0001
    sw $t2,TRISE($t0)


while:

    lw $t3,PORTB($t0)
    andi $t3,#t3,0x0001
    xori $t3,$t3,0x0001         #xori e p inverter

    lw $t4,LATE($t0)
    andi $t4,$t4,0xFFFE 
    or $t4,$t4,$t3
    sw $t4,LATE($t0)


    j while
    jr $ra