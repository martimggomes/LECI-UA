.data
    .equ ADDR_BASE_HI,0xBF88
    .equ TRISE, 0x6100
    .equ LATE, 0x6120
    .equ putChar, 3
    .equ printInt, 6
    .equ readCoreTimer, 11
    .equ resetCoreTimer, 12
    .text
    .globl main

main:
    lui $t0,ADDR_BASE_HI
    lw $t1,TRISE($t0)
    andi $t1,$t1,0xFF83             #1111 1111 1000 0011
    sw $t1,TRISE($t0)

    li $t2,0                        #counter = 0

    lw $t1,LATE($t0)
    andi $t1,$t1,0xFF83
    sw $t1,LATE($t0)

while:
    andi $a0,$t2,0x1F
    li $a1, 5
    sll $a1,$a1,16
    or $a1,$a1,2                    #printInt(counter, 2 | 5 << 16)
    li $v0, printInt
    syscall

    li $a0, '\n'
    li $v0, putChar
    syscall

    andi $t1,$t1,0xFF83
    or $t1,$t1,$t2
    sw $t1,LATE($t0)

if:
    beq $t2,0,else
    addi $t2,$t2,-1

    j endif

else:
    li $t2,24

endif:

    li $v0, resetCoreTimer
    syscall
wait:
    li $v0, readCoreTimer
    syscall

    blt $v0,4347826,wait

    j while

    li $v0,0                        #return 0

    jr $ra