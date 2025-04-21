valores = []
while True:
    valores.append(int(input("Digite um número: ")))
    resp = str(input("Quer continuar? [S/N]"))
    if resp in "Nn":
        break
print(f"A lista tem {len(valores)} elementos.")
valores.sort(reverse=True)
print(f"A lista em forma decrescente fica: {valores}")
if 5 in valores:
    print("O número 5 está contido na lista!")
else:
    print("O número 5 não foi encontrado na lista!")