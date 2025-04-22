      .data
str1: .asciiz "Introduza um numero: "
str2: .asciiz "\n O valor em binario é:"
str3: .asciiz 
      .text
      .globl main
      
# Mapa de registos:
# value: $t0
# bit: $t1
# i: $t2


main: la $a0,str1     				# (instrução virtual)
      li $v0,4     				# (instrução virtual)
      syscall     				# print_string(str1);

     li $v0,5
     syscall
     move $t0,$v0     			# value=read_int();
     
     la $a0,str2
     li $v0,4
     syscall            # print_string("str2");
     
     li $t2,0         # i = 0


for:     bge $t2,32,endfor     # while(i < 32) {
    li $t3,0x80000000     #
    and $t1,$t0,$t3     # bit=value & 0x80000000

if:     beq $t1,0,else # if(bit != 0)
    li $a0,'1'
    li $v0,11
    syscall      # print_char('1');
    j endif

else:    li $a0,'0'
    li $v0,11
    syscall      # print_char('0');

endif:     sll $t0,$t0,1    # value = value << 1;
    addi $t2,$t2,1    # i++;
    rem $t4,$t2,4

if_2:    beq $t4,0,else_2    # if(resto da divisao != 0)

    j for

else_2:    li $a0, ' '
    li $v0,11
    syscall

    j for     # }

endfor: 
    jr $ra # fim do programa
