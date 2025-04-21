from random import randint
from operator import itemgetter
jogo = {"Jogador1": randint(1,6),
        "Jogador2": randint(1,6),
        "Jogador3": randint(1,6),
        "Jogador4": randint(1,6)}
print("Valores sorteados: ")
print()
ranking = list()
for k,v in jogo.items():
    print(f"O {k} tirou o número {v} no dado!")                  #KEY -> "JOGADOR(1,2,3,4,)", VALUE -> RANDINT(1,6)
ranking = sorted(jogo.items(), key=itemgetter(1), reverse=True)
print("-" * 36)
print("Classificação")
print()
for i, v in enumerate(ranking): 
    print(f"{i+1}º lugar: {v[0]} com {v[1]} pontos!")            #OS ITEMS SÃO O 0,1,2,3,4 (COMO ESTÁ i +1) -> 1,2,3,4
                                                                 #OS VALUES SÃO, NA VARIÁVEL JOGO, V[0] -> "JOGADOR(1,2,3,4,)", V[1] -> RANDINT(1,6)
