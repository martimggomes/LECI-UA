n1 = int(input("Digite o primeiro número: "))
n2 = int(input("Digite o segundo número: "))
opção = 0
while opção!= 5:
    print(''' O que pretende fazer com os números?
    [1] Somar
    [2] Multiplicar
    [3] Maior
    [4] Novos números
    [5] Sair''')
    opção = int(input("Qual é a sua opção? "))
    if opção == 1:
            soma = n1 + n2
            print(f"A soma entre {n1} e {n2} é igual a {soma}")
    elif opção == 2:
            mult = n1 * n2
            print(f"A multiplicação entre {n1} e {n2} é igual a {mult}")
    elif opção == 3:
        if n1 > n2:
            maior = n1
        else:
            maior = n2
        print(f"O maior número é {maior}")
    elif opção == 4:
        n1 = int(input("Digite o primeiro número: "))
        n2 = int(input("Digite o segundo número: "))
    else:
        break 