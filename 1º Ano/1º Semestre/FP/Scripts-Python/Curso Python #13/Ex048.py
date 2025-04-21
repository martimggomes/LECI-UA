s = 0
c = 0
for n in range(1, 501):
    if n % 2 != 0 and n % 3 == 0:
        c += 1
        s += n
print("A soma de todos os {} valores é de {}".format(c, s), end = " ")