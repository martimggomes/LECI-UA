somaidade = 0
maioridade = 0
maior = 0
nomevelho = ''
c = 0
for p in range(1, 5):
    print(f"----- {p}ª pessoa -----")
    nome = str(input("Nome: "))
    idade = int(input("Idade: "))
    sexo = str(input("Sexo [M/F]: " )).upper()
    somaidade += idade

    if sexo == "M":
        if p == 1:
            maioridade = idade
            nomevelho = nome
        else:
            if idade > maioridade:
                maioridade = maior
                nomevelho = nome
            
    if sexo == "F" and idade < 20:
        c += 1
        
            
média = somaidade / 4
print(f"A média das idades é {média} anos")
print(f"O homem mais velho é o {nomevelho}")
print(f"Existem {c} mulheres com menos de 20 anos")