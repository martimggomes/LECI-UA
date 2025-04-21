from random import randint
computador = randint(0, 10)
tentativas = 0
acertou = False
while not acertou:
    n = int(input("Digite um número de 0 a 10: ")) 
    tentativas += 1
    if n == computador:
        acertou = True
        print("Parabéns! Você acertou ao fim de {} tentativa(s)".format(tentativas))
    else:
        print("Você errou! Tente de novo")