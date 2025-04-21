from random import randint
c = 0

print("-" * 35)
print("VAMOS JOGAR AO PAR OU ÍMPAR")
print("-" * 35)

while True:
    v = int(input("Digite um valor: "))
    computador = randint(0, 10)
    r = ''
    s = v + computador 
    choose = str(input("Par ou Ímpar: ")).upper()
    while choose not in "PARÍMPAR":
        print("Erro. Digite PAR ou ÍMPAR") 
        choose = str(input("Par ou Ímpar: ")).upper()
    print("-" * 35)
    if s % 2 == 0:
        r = "PAR"
        print(f"Você jogou {v} e o computador jogou {computador}. Total de {s}, deu {r}")
    else:
        r = "ÍMPAR"
        print(f"Você jogou {v} e o computador jogou {computador}. Total de {s}, deu {r}")
    print("-" * 35)
    if choose == r:
        print("Você ganhou!")
        c += 1
    else:
        print("Você perdeu!")
        
    print("-" * 35)
    print(f"Você venceu {c} vez(es)")