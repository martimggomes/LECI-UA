def ficha(jog='<desconhecido>', gol=0):
    print(f"O jogador {jog} fez {gol} golo(s) no campeonato.")
    

n = str(input("Digite o nome do jogador: "))
g = str(input("Quantos golos o jogador marcou? "))
if g.isnumeric:
    g = int(g)
else:
    g = 0
if n.strip() == '':
    ficha(gol=g)
else:
    ficha(n, g)
