def fatorial(num=1):
    f = 1
    for c in range(num, 0, -1):
        f *= c
    return f

f1 = fatorial(5)
f2 = fatorial(4)
f3 = fatorial()
print(f"O fatorial dos números 5, 4 e 1 são, respetivamente, {f1}, {f2}, {f3}.")

print("-" * 70)

def par(numero=0):
    if numero % 2 == 0:
        return True
    else:
        return False
    

numeroescolhido = int(input("Digite um número: "))
if par(numeroescolhido) == True:
    print("É um número par!")
else:
    print("É um número ímpar!")