jogador = dict()
partidas = list()
jogador["Nome"] = str(input("Nome do jogador: "))
tot = int(input(f"Quantas partidas o {jogador['Nome']} jogou: "))
for c in range(0, tot):
    partidas.append(int(input(f"Quantos golos o {jogador['Nome']} marcou na partida Nº{c + 1}: ")))
jogador["Golos"] = partidas[:]
jogador["Total"] = sum(partidas)

print("-" * 50)

print(f"O jogador {jogador['Nome']} jogou {len(jogador['Golos'])} partidas:")

print()

for i, v in enumerate(jogador['Golos']):
    print(f" -> Na partida {i + 1}, marcou {v} golos.")
    
print()

print(f"Totalizando {jogador['Total']} golos durante toda a época!")

print("-" * 50)