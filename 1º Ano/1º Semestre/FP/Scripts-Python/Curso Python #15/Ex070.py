totc = 0
c = 0
cont = 0
barato = 0
produtobarato = ''
print("-" * 30)
print("LOJA DO SUPER BARATÃO")
print("-" * 30)

while True:
    produto = str(input("Digite o nome do produto: "))
    preço = float(input("Preço (€): "))
    cont += 1
    totc += preço
    if preço > 1000:
        c += 1
    if cont == 1:
        barato = preço
        produtobarato = produto
    else:
        if preço < barato:
            barato = preço
            produtobarato = produto
    res = ' '
    while res not in 'SN':
        res = str(input("Deseja continuar? [S/N]")).strip().upper()[0]
    if res == 'N':
        break
print("----- FIM DO PROGRAMA -----")
    
print(f"O total da compra foram {totc}€")
print(f"Existem {c} produtos que custam mais de 1000€")
print(f"{produtobarato} é o produto mais barato, que custa {barato}€")