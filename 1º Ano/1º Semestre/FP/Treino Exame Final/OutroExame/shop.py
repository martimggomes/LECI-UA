# Pode correr o programa sem argumentos:
#   python3 shop
# ou passando outros ficheiros de produtos como argumento:
#   python3 shop produtos1.txt ...

def loadDataBase(fname, produtos):
    """Reads data from the file fname and updates/adds the information to a
    products dictionary with the format {code: (name, section, price, tax), ...}.
    """
    with open(fname, 'r') as f:
        lines = f.readlines()  # Read all lines from the file

    for line in lines[1:]:
        productComponents = line.strip().split(';')  # Split the line into components

        if len(productComponents) != 5:
            continue

        code = productComponents[0]
        name = productComponents[1]
        section = productComponents[2]
        price = float(productComponents[3])
        tax = float(productComponents[4].strip('%')) / 100

        produtos[code] = (name, section, price, tax)  # Update the products dictionary


def registaCompra(produtos):
    """Reads product codes (or codes and quantities),
    displays name, quantity, and final price for each,
    and returns a dictionary with {code: quantity, ...}
    """
    compra = {"totals": [0, 0, 0]}  # Initialize the purchase dictionary with the totals: [gross total, tax total, net total]
    
    while True:
        userInput = input('Code? ')
        
        if userInput == "":
            break
        
        try:
            code, amount = userInput.split(' ')  # Split the user input into code and quantity
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
    produtos = {'p1': ('Ketchup.', 'Mercearia Salgado', 1.59, 0.23)}
    # Carregar base de dados principal
    loadDataBase("C:\\Users\\MARTIM\\Desktop\\Disciplinas\\FP_EE\\OutroExame\\produtos.txt", produtos)
    # Juntar bases de dados opcionais (Não altere)
    for arg in args:
        loadDataBase(arg, produtos)

    # Use este código para mostrar o menu e ler a opção repetidamente
    MENU = "(C)ompra (F)atura (S)air ? "
    compras = {}
    repetir = True
    while repetir:
        # Utilizador introduz a opção com uma letra minúscula ou maiúscula
        op = input(MENU).upper()
        # Processar opção
        if op == "C":
            # Esta opção regista os produtos de uma compra
            compras[len(compras) + 1] = registaCompra(produtos)

        elif op == "F":
            # Esta opção apresenta a fatura de uma compra
            try:
                numCompra = int(input("Numero compra? "))
                fatura(produtos, compras[numCompra])
            except:
                continue

        elif op == "S":
            repetir = False

    print("Obrigado!")


# Não altere este código / Do not change this code
import sys

if __name__ == "__main__":
    main(sys.argv[1:])
