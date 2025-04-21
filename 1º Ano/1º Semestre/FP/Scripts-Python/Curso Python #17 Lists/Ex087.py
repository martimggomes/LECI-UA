matriz = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
spar = 0
s3col = 0
maiorseg = 0
for l in range(0, 3):
    for c in range(0, 3):
        matriz[l][c] = int(input(f"Digite um valor para [{l}, {c}]: "))
for l in range(0, 3):
    for c in range(0, 3):
        print(f"[{matriz[l][c]:^5}]", end="")
        if matriz[l][c] % 2 == 0:
            spar += matriz[l][c]
    print()

print(f"A soma de todos os valores pares digitados é {spar}")

for l in range(0,3):
    s3col += matriz[l][2]
    
print(f"A soma dos valores da última coluna é {s3col}")

for c in range(0, 3):
    if c == 0:
        maiorseg = matriz[1][c]
    elif matriz[1][c] > maiorseg:
        maiorseg = matriz[1][c]
        
print(f"O maior valor da segunda linha é o {maiorseg}")