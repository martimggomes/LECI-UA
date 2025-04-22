	.data
	.text
	.globl main
	.eqv Inn,1
main:   li $t0,2
	srl $t1,$t0,Inn      #(bin >> 1) é um deslocamento à direita	
	xor $t2,$t1,$t0      #elevado é um xor
	jr $ra