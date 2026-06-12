#int main(void) {

    #configD11();

    #while(1) {
        #outD11(1);
        #delay(500);

        #outD11(0);
        #delay(600);

       # outD11(1);
        #delay(200);

       # outD11(0);
        #delay(150);

       # outD11(1);
       # delay(100);

       # outD11(0);
       # delay(600);
   # }
   # return 0
#}


    .data
    .text
    .globl main

main:

    jal configD11
while:

    li $a0,1
    jal outD11
    li $a0,500
    jal delay

    li $a0,0
    jal outD11
    li $a0,600
    jal delay

    li $a0,1
    jal outD11
    li $a0,200
    jal delay

    li $a0,0
    jal outD11
    li $a0,150
    jal delay

    li $a0,1
    jal outD11
    li $a0,100
    jal delay

    li $a0,0
    jal outD11
    li $a0,600
    jal delay


    j while

    jr $ra


    # void configD11(void)
configD11:
    lui $t0,0xBF88
    lw  $t1,0x6080($t0)
    andi $t1,$t1,0xBFFF
    sw  $t1,0x6080($t0)
    jr $ra


# void outD11(int val)
outD11:
    lui $t0,0xBF88
    lw $t1,0x60A0($t0)
    andi $t1,$t1,0xBFFF
    sll $a0,$a0,14
    or $t1,$t1,$a0
    sw $t1,0x60A0($t0)
    jr $ra



    Funcao delay()
delay:
    li $v0,RESET_CORE_TIMER
    syscall

    li $t0,20000
    mulu $t1,$t0,$a0

while:
    li $v0,READ_CORE_TIMER
    syscall
    bge $v0,$t1,endwhile

    j while

endwhile:
    jr $ra