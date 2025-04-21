s = 0
c = 0
for n in range(1, 7):
    n = int(input("Digite um número: "))
    if n % 2 == 0:
        s += n
        c += 1
        continue
print("Você informou {} números pares e a soma foi {}".format(c, s))