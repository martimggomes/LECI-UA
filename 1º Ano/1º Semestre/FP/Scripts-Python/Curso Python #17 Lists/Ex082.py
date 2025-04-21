num = []
pares = []
impares = []
while True:
    num.append(int(input("Digite um número: ")))
    resp = str(input("Quer continuar? [S/N]"))
    if resp in "Nn":
        break
num.sort()
for c in num:
    if c % 2 == 0:
        pares.append(c)
    else:
        impares.append(c)

print(f"Esta é a lista normal: {num}")
print(f"Esta é a lista com números pares: {pares}")
print(f"Esta é a lista com números ímpares: {impares}")
        
            
            
