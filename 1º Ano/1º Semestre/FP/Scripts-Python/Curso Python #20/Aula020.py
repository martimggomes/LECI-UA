def lin():
    print("-" * 30)
    
lin()
print("Eu")
lin()
print("Sou o")
lin()
print("Martim")
lin()

print()


def dobra(lst):
    pos = 0
    while pos < len(lst):
        lst[pos] *= 2
        pos += 1

valores = [6, 3, 8, 9, 5, 0]
dobra(valores)
print(valores)


def soma(*values):
    s = 0
    for num in values:
        s += num
        print(f"Somando os valores {values} temos {s}")

soma(5, 2)
soma(2, 9, 4)
