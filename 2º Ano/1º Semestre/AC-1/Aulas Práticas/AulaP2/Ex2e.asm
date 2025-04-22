	.data
	.text
	.globl main

main:	li $t0, 2           # Carregar o valor Gray de teste (2) no registrador $t0 (gray)
    
    	move $t1, $t0       # Copiar o valor de $t0 (gray) para $t1 (num)
    
    	# Passo 1: num = num ^ (num >> 4)
    	srl $t2, $t1, 4     # Desloca $t1 (num) 4 bits para a direita e coloca o resultado em $t2
    	xor $t1, $t1, $t2   # Faz XOR de $t1 (num) com o valor deslocado e armazena em $t1
    
    	# Passo 2: num = num ^ (num >> 2)
    	srl $t2, $t1, 2     # Desloca $t1 (num) 2 bits para a direita e coloca o resultado em $t2
    	xor $t1, $t1, $t2   # Faz XOR de $t1 com o valor deslocado e armazena o resultado em $t1
    
    	# Passo 3: num = num ^ (num >> 1)
    	srl $t2, $t1, 1     # Desloca $t1 (num) 1 bit para a direita e coloca o resultado em $t2
    	xor $t1, $t1, $t2   # Faz XOR de $t1 com o valor deslocado e armazena o resultado em $t1
    
    	# O resultado final de binário está agora em $t1
    	move $t3, $t1       # Colocar o resultado final (binário) em $t3
    
    	jr $ra              # Retornar da função (fim do programa)
