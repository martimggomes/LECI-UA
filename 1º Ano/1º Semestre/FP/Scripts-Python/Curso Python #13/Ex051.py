pt = int(input("Digite o primeiro termo: "))
ra = int(input("Digite a razão: "))
decimo = pt + (10 -1) * ra
for c in range(pt, decimo + ra ,ra):
    print(c,  end = " -> ")
print("Acabou")