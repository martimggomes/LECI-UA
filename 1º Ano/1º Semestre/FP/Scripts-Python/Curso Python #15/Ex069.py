tot18 = 0
toth = 0
totfa = 0
while True: 
    print("-" * 30)
    print("CADASTRE UMA PESSOA")
    print("-" * 30)
    idade = int(input("Digite a sua idade: "))
    sexo = ' '
    while sexo not in "MF":
        sexo = str(input("Sexo: [M/F] ")).strip().upper()[0]
    if idade >= 18:
        tot18 += 1
    if sexo == "M":
        toth += 1
    if sexo == "F" and idade < 20:
        totfa += 1    
    res = ' '   
    while res not in 'SN':
        res = str(input("Quer continuar? [S/N]")).strip().upper()[0]
    if res == "N":
        break
    
print(f"Total de pessoa com mais de 18 anos: {tot18}")
print(f"Ao todo temos {toth} homens cadastrados")
print(f"E temos {totfa} mulheres com menos de 20 anos")