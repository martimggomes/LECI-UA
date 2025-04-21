ficha = list()

while True:
    nome = str(input("Nome: "))
    n1 = int(input("Nota 1: "))
    n2 = int(input("Nota 2: "))
    media = (n1 + n2) / 2
    ficha.append([nome, [n1, n2], media])
    res = str(input("Deseja continuar? [S/N] ")).upper()
    if res not in "SN":
        res = str(input("Deseja continuar? [S/N] ")).upper()
    elif res == "S":
        continue
    elif res == "N":
        break
print("-" * 30)
print(f"{'No.':<4}{'NOME':<10}{'MÉDIA':>8}")
print("-" * 30)
for i, a in enumerate(ficha):
    print(f"{i:<4}{a[0]:<10}{a[2]:>8}")
print("-" * 30)
while True:
    p = int(input("Mostrar notas de qual aluno? (999 para terminar) "))
    if p == 999:
        break
    if p <= len(ficha) - 1:
        print(f"Notas de {ficha[p][0]} são {ficha[p][1]}")
print("VOLTE SEMPRE!")