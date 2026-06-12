    .equ READ_CORE_TIMER,11
    .equ RESET_CORE_TIMER,12
    .equ PUT_CHAR,3
    .equ PRINT_INT,6
    .data
    .text
    .globl main

#Mapa de registos
#counter : $s0

main:
    li $s0,0                    #counter = 0
    
    addiu $sp,$sp,-8
    sw $ra,0($sp)
    sw $s0,4($sp)

while:
    li $a0,'\r'
    li $v0,PUT_CHAR
    syscall                     #putChar('\r')

    move $a0,$s0
    li $a1,0x0004000A
    li $v0,PRINT_INT
    syscall                     #printInt(counter, 10 | 4 << 16)

    li $a0,100
    jal delay
   
    addi $s0,$s0,1
    j while

    li $v0,0                    #return 0

    lw $s0,4($sp)
    lw $ra,0($sp)
    addiu $sp,$sp,8

    jr $ra



delay:
        li $v0,resetCoreTimer
        syscall


        li $t0,20000000
        mulu $t1,$t0,$a0


while3:
        li $v0,readCoreTimer
        syscall
        bge $v0,$t1,endwhile3

        j while
endwhile3:

        jr $ra