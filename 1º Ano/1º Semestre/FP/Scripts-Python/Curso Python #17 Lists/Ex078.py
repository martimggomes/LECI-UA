listanum = list()
maior = 0
menor = 0

for c in range(0,5):
    listanum.append(int(input(f"Digite um número para a posição {c}: ")))
    if c == 0:
        maior = menor = listanum[c]
    elif listanum[c] < menor:
        menor = listanum[c]
    elif listanum[c] > maior:
        maior = listanum[c]
    
print(f"Os números digitados foram: {listanum}")
print(f"O maior valor digitado foi o número {maior} nas posições ", end="")
for i, v in enumerate(listanum):
    if v == maior:
        print(f"{i}... ", end="")
print()
print(f"O menor número digitado foi o número {menor} nas posições ", end="")
for i, v in enumerate(listanum):
    if v == menor:
        print(f"{i}... ", end="")
print()
    


