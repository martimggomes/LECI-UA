	.data
	.text
	.globl main
	.eqv Inn,1
main:   li $t0,2
	srl $t1,$t0,Inn      #(bin >> 1) � um deslocamento � direita	
	xor $t2,$t1,$t0      #elevado � um xor
	jr $ra