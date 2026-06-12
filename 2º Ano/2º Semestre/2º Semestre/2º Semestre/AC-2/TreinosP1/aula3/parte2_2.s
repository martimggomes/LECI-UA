    .equ ADDR_BASE_HI,0xBF88
    .equ TRISE,0x6100
    .equ LATE,0x6120
    equ RESET_CORE_TIMER, 12
    .equ READ_CORE_TIMER, 11
    .data
    .text
    .globl main

main:

    lui $t0,ADDR_BASE_HI

    #configurar RE4-RE1 como saida

    lw $t1,TRISE($t0)
    andi $t1,$t1,0xFFE1  #1111 1111 1110 0001
    sw $t1,TRISE($t0)

    li $t3,0

loop:   

    lw $t1,LATE($t0)
    andi $t1,$t1,0xFFE1

    sll $t4,$t3,1
    or $t1,$t1,$t4
    sw $t1,LATE($t0)


    li $v0,RESET_CORE_TIMER
    syscall

wait:li $v0,READ_CORE_TIMER
    syscall

    #blt $v0,4347826  # 4347826 = 20 000 000 /4.6
    
    blt $v0,5000000  #20000000/ f
    #f = 4 hz

    addi $t3,$t3,1
    andi $t3,$t3,0x000F


    j loop
    jr $ra