    .equ ADDR_BASE_HI,0xBF88
    .equ TRISE,0x6100
    .equ LATE,0x6120
    .equ TRISD,0x60C0
    .equ PORTD,0x60D0
    .data
    .text
    .globl main

main:

    lui $t1,ADDR_BASE_HI
    lw $t2,TRISE($t1)
    andi $t2,$t2,0xFFFE
    sw $t2,TRISE($t1)


    lw $t3,TRISD($t1)
    ori $t3,$t3,0x0100
    sw $t3,TRISD($t1)


    lw $t4,PORTD($t1)
    andi $t4,$t4,0x100
    srl $t4,$t4,8


    lw $t5,LATE($t1)
    andi $t5,$t5,0xFFFE
    or $t5,$t5,$t4
    sw $t5,LATE($t1)

    j while
    jr $ra
