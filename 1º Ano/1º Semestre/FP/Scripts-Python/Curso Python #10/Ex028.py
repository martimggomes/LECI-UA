from random import randint
computador = randint(0, 5)
n = int(input("Digite um número de 0 a 5: ")) 
if n == computador:
    print("Você acertou!")
else:
    print("Você errou! O número pensado pelo computador era o número {}.".format(computador))