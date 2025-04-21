def loadDataBase(fname, produtos):
    """Lê dados do ficheiro fname e atualiza/acrescenta a informação num
    dicionário de produtos com o formato {código: (nome, secção, preço, iva), ...}.
    """
    with open(fname, 'r', encoding='utf-8') as file:
        lines = file.readlines()
        
        for product in lines:
            productComponents = product.strip().split(";")
            
            if len(productComponents) != 5:
                continue
            
            code = productComponents[0]
            nome = productComponents[1]
            secção = productComponents[2]
            preco = productComponents[3]
            iva = productComponents[4]
    
            produtos[code] = (nome, secção, preco, iva)


def registaCompra(produtos):
    """Lê códigos de produtos (ou códigos e quantidades),
    mostra nome, quantidade e preço final de cada um,
    e devolve dicionário com {codigo: quantidade, ...}
    """
    # Implementação a ser feita pelo utilizador
    compra = {"totals" : [0, 0, 0]}
    
    while True:
        
        userInput = input("Code? ")
        
        if userInput == '':
            break
        
        try:
            code, amount = userInput.split(' ')
            amount = int(amount)
        except ValueError:
            code = userInput
            amount = 1
            
        if code in produtos:
            if code not in compra:
                compra[code] = 0
        
            compra[code] += amount
            noIvaPrice = produtos[code][2] * amount
            compra["totals"][0] += noIvaPrice
            compra["totals"][1] += noIvaPrice * produtos[code][3]
            print(f"{produtos[code][0]}  {amount}  {noIvaPrice * (1 + produtos[code][3]):.2f}")
    
    compra["totals"][2] += compra["totals"][0] + compra["totals"][1]
    return compra            


def fatura(produtos, compra):
    """Imprime a fatura de uma dada compra."""
    # Implementação a ser feita pelo utilizador
    # Obtém a lista de secções presentes na compra (por ordem alfabética)
    sections = sorted(
        list({section for section in [product[1] for code, product in produtos.items() if code in compra]}))

    # Itera as secções para apresentar os produtos ordenados por secção
    for section in sections:
        print(section)  # Mostra a secção

        # Obtém a lista de codigos usados na compra presentes na secção atual
        sectionProductsCodes = sorted([code for code in produtos if produtos[code][1] == section and code in compra])

        # Itera os códigos para apresentar as informações de cada produto
        for code in sectionProductsCodes:
            print(
                f"{compra[code]:>4} {produtos[code][0]:<31}({int(produtos[code][3] * 100):>2}%){round(compra[code] * produtos[code][2] * (1 + produtos[code][3]), 2):>11}")

    # Apresenta os totais da compra
    print(f"""{'Total Bruto:':>41}{round(compra["totals"][0], 2):>11}
{'Total IVA:':>41}{round(compra["totals"][1], 2):>11}
{'Total Liquido:':>41}{round(compra["totals"][2], 2):>11}""")


def main(args):
    # produtos guarda a informação da base de dados numa forma conveniente.
    produtos = {}
    
    # Carregar base de dados principal
    loadDataBase("C:\\Users\\MARTIM\\Desktop\\Disciplinas\\FP_EE\\OutroExame\\produtos.txt", produtos)
    
    # Juntar bases de dados opcionais
    for arg in args:
        loadDataBase(arg, produtos)

    # Use este código para mostrar o menu e ler a opção repetidamente
    MENU = "(C)ompra (F)atura (S)air ? "
    compras = {}
    repetir = True
    while repetir:
        op = input(MENU).upper()
        if op == "C":
            # Registar compra
            compras[len(compras) + 1] = registaCompra(produtos)
        elif op == "F":
            # Apresentar fatura
            try:
                numCompra = int(input("Numero compra? "))
                fatura(produtos, compras[numCompra])
            except:
                continue
        elif op == "S":
            repetir = False

    print("Obrigado!")


# Não altere este código
import sys

if __name__ == "__main__":
    main(sys.argv[1:])
