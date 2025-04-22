# Mapa de registos:
# value: $t0
# bit: $t1
# i: $t2	
		
	.data
str1:	.asciiz "Introuza um número: "
str2:	.asciiz	"\nO valor em binário é: "
	.text
	.globl main

main: 	li 	$v0,4			# (instrução virtual)
	la 	$a0,str1 		# (instrução virtual)
	syscall				# print_string(str1);
	
	li $v0,5
	syscall				# value=read_int();
	move $t0,$v0 			
	
	li	$v0, 4
	la	$a0,str2
	syscall
	
	li	$t2,0
	
for: 	bge 	$t2,32,endfor 		# while(i < 32) {
	li 	$t3,0x80000000 		#
	and 	$t1,$t0,$t3 		# bit=value & 0x80000000
	
if: 	beq 	$t1,0,else 		# if(bit != 0)
					# print_char('1');
	li	$v0,11
	li	$a0,'1'
	syscall
	j	endif
	
else: 					# else 			
	li	$v0,11
	li	$a0,'0'			# print_char('0');
	syscall
	
endif: 	
	sll $t0,$t0,1			# value = value << 1;
	addi $t2,$t2,1			# i++;
	j 	for 			# }
	
endfor: 				#

	jr 	$ra 			# fim do programa
	
