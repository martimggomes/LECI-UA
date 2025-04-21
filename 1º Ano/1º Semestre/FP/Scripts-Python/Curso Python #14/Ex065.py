maior = 0
menor = 0 
c = 0
somavalores = 0
while True:
    n = int(input("Digite um número: "))
    c += 1
    somavalores += n
    if c == 1:
        maior = n
        menor = n
    else:
        if n > maior:
            maior = n
        elif n < menor:
            menor = n
    res = str(input("Quer continuar? [S/N] ")).upper()
    if res == "N":
        break
    elif res == "S": 
        continue
    else:
        print("Digite S ou N!")
        while True:
            res = input("Quer continuar? [S/N] ").upper()
            if res in ["S", "N"]:
                break
            else:
                print("Digite S ou N!")

    
média = somavalores / c
print(f"Você digitou {c} números e a média foi {média}")
print(f"O maior valor é o número {maior} e o menor é o número {menor}")
