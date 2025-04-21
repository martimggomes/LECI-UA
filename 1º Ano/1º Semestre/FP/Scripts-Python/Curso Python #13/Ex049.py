n = int(input("Digite um número: "))
print("A tabuada do {} é: ".format(n))
for m in range(1, 11):
    print("{} x {} = {}".format(n, m, m*n))
