c = 0                     #ou c = s = 0
s = 0
while True:
    n = int(input("Digite um número (999 para parar): "))
    if n != 999:
        c += 1
        s += n
    else:
        break

print(f"Você digitou {c} números e a soma entre eles foi {s}")