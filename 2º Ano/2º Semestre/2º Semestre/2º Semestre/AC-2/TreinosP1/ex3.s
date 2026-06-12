    .equ ADDR_BASE_HI,0xBF88
    .equ TRISE,0x6100  	
    .equ LATE, 0x6120 
    .equ READ_CORE_TIMER, 11
    .equ RESET_CORE_TIMER, 12
    .equ PRINT_INT, 6
    .equ PUT_CHAR,3
    .data
    .text
    .globl main

main:
    lui $t1,ADDR_BASE_HI
    lw $t2, TRISE($t1)
    andi $t2,$t2,0xFFC1    #1111 1111 1100 0001
    sw $t2,TRISE($t1)

    li $t3,0x0001


while:
    lw $t2,LATE($t1)
    andi $t2,$t2,0xFFC1
    sll $t4,$t3,1
    or $t2,$t2,$t4
    sw $t2,LATE($t1)


    li $v0,RESET_CORE_TIMER
    syscall
wait:
    li $v0,READ_CORE_TIMER
    syscall
    blt $v0,8695652,wait



    j while
endwhile:

    jr $ra