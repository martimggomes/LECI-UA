comunidade = list()
pessoa = dict()
soma = média = 0
while True:
    pessoa.clear()
    pessoa["Nome"] = str(input("Nome da pessoa: "))
    while True:
        pessoa["Sexo"] = str(input("Sexo [M/F]: ")).upper()[0]
        if pessoa["Sexo"] in "MF":
            break
        else:
            print("Erro. Escolhe a letra M ou F!")        
    pessoa["Idade"] = int(input("Idade: "))
    soma += pessoa["Idade"]
    comunidade.append(pessoa.copy())
    while True:
        resp = str(input("Deseja continuar? [S/N] ")).upper()[0]
        if resp in "SN":
            break
        else:
            print("Erro. Responda S ou N!")
    if resp == "N":
        break

print(f"Ao todo foram {len(comunidade)} pessoas cadastradas.")

média = soma / len(comunidade)
print(f"A média das idades foi de {média:5.2f} anos.")

print("As mulheres cadastradas foram ", end='')
for p in comunidade:
    if p['Sexo'] in "F":
        print(f"{p['Nome']} ", end='')
print()
print("Lista das pessoas que estão acima da média: ")
for p in comunidade:
    if p["Idade"] >= média:
        print("   ", end='')
        for k,v in p.items():
            print(f"{k} = {v}; ", end='')
        print()