	.data
	.text
	.globl main
	.eqv Imm,0
main: 	li $t0,0x862A5C1B 	# instru��o virtual (decomposta em duas instru��es nativas)
	sll $t2,$t0,Imm 	#			
	srl $t3,$t0,Imm 	#	
	sra $t4,$t0,Imm 	#
	jr $ra 			# fim do programa
	