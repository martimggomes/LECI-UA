	.data
	.text
	.globl main
	.eqv Imm,1
main: 	li $t0,0x12345678 	# instru��o virtual (decomposta em duas instru��es nativas)
	sll $t2,$t0,Imm 	#			
	srl $t3,$t0,Imm 	#	
	sra $t4,$t0,Imm 	#
	jr $ra 			# fim do programa
	
	