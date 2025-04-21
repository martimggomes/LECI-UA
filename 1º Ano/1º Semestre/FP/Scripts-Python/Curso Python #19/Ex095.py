time = list()
jogador = dict()
partidas = list()

while True:
    jogador.clear
    jogador["Nome"] = str(input("Nome do jogador: "))
    tot = int(input(f"Quantas partidas o {jogador['Nome']} jogou: "))
    
    partidas.clear()
    for c in range(0, tot):
        partidas.append(int(input(f"Quantos golos o {jogador['Nome']} marcou na partida Nº{c + 1}: ")))

    jogador["Golos"] = partidas[:]
    jogador["Total"] = sum(partidas)

    time.append(jogador.copy())
    while True:
        resp = str(input("Quer continuar? [S/N]")).upper()[0]
        if resp in "SN":
            break
        else:
            print("Erro. Digite ou S ou N!")
    if resp == "N":
        break
    
print("-" * 50)

print("Cod ", end='')
for i in jogador.keys():
    print(f"{i:<15}", end='')
print()

for k,v in enumerate(time):
    print(f"{k:>3} ", end='')
    for d in v.values():
        print(f"{str(d):<15}", end='')
    print()

print("-" * 50)

while True:
    busca = int(input("Mostrar dados de qual jogador? (999 para parar)"))
    if busca == 999:
        break
    if busca >= len(time):
        print(f"Erro. Não existe nenhum jogador com esse código ({busca})!")
    else:
        print(f"   Levantamento de dados do jogador {time[busca]['Nome']}:")
        for i,g in enumerate(time[busca]["Golos"]):
            print(f"-> No jogo {i+1}, marcou {g} golo(s)")
    print("-" * 50)

print("Volte sempre! :)")

