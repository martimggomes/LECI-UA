#n = int(input("Digite um número para ver a sua tabuada: "))
#print(f"{n} x 1 =", n)
#print(f"{n} x 2 =", 2*n)
#print(f"{n} x 3 =", 3*n)
#print(f"{n} x 4 =", 4*n)
#print(f"{n} x 5 =", 5*n)
#print(f"{n} x 6 =", 6*n)
#print(f"{n} x 7 =", 7*n)
#print(f"{n} x 8 =", 8*n)
#print(f"{n} x 9 =", 9*n)
#print(f"{n} x 10 =", 10*n)


n = int(input("Digite um número para ver a sua tabuada: "))
for i in range(0, 10):
    i += 1
    print(f"{n} x {i} =", n*i)