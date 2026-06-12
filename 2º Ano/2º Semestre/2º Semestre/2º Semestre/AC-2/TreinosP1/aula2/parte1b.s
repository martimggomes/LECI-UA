    .equ READ_CORE_TIMER,11
    .equ RESET_CORE_TIMER,12
    .equ PUT_CHAR,3
    .equ PRINT_INT,6
    .data
    .text
    .globl main

#Mapa de registos
#counter : $t0

main:
    li $t0,0                    #counter = 0

while:
    li $a0,'\r'
    li $v0,PUT_CHAR
    syscall                     #putChar('\r')

    move $a0,$t0
    li $a1,0x0004000A
    li $v0,PRINT_INT
    syscall                     #printInt(counter, 10 | 4 << 16)

    li $v0,RESET_CORE_TIMER
    syscall                     #resetCoreTimer()

while2:
    li $v0,READ_CORE_TIMER
    syscall                     #readCoreTimer()         
    bge $v0,200000,endwhile2
    addi $t0,$t0,1              #counter++

    j while2

endwhile2:
    j while

    li $v0,0                    #return 0

    jr $ra
