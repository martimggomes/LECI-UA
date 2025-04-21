num = [[], []]
for c in range(1, 8):
    valor = int(input(f"Digite um {c}º valor:"))
    if valor % 2 == 0:
        num[0].append(valor)
    else:
        num[1].append(valor)
num[0].sort()
num[1].sort()
print(f"Esta é a lista com números pares: {num[0]}")
print(f"Esta é a lista com números ímpares: {num[1]}")