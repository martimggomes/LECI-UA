# Complete este programa como pedido no guião da aula.

def listContacts(dic):
    """Print the contents of the dictionary as a table, one item per row."""
    print("{:>12s} : {:^35s} : {:<12s}".format("Numero", "Nome", "Morada"))
    for num in dic:
        print("{:>12s} : {:^35s} : {:<12s}".format(num, dic[num][0], dic[num][1]))
        
def addContact(dic):
    name = input("Nome: ")
    numero = input("Número: ")
    morada = input("Morada: ")
    dic[numero] = (name, morada)
    
def removeContact(dic):
    numero = input("Número a remover: ")
    if numero in dic.keys():
        del dic[numero]
        
def searchNumber(dic):
    numero = input("Digite um número: ")
    if numero in dic:
        print(dic.get(numero))
    else:
        print(numero)
    
    
def filterPartName(contacts, partName):
    """Returns a new dict with the contacts whose names contain partName."""
    dict = {}
    for num in contacts:
        if partName in contacts[num]:
            dict[num] = contacts[num]
    return dict


def menu():
    """Shows the menu and gets user option."""
    print()
    print("(L)istar contactos")
    print("(A)dicionar contacto")
    print("(R)emover contacto")
    print("Procurar (N)úmero")
    print("Procurar (P)arte do nome")
    print("(T)erminar")
    op = input("opção? ").upper()   # converts to uppercase...
    return op


def main():
    """This is the main function containing the main loop."""

    # The list of contacts (it's actually a dictionary!):
    contactos = {"234370200": ("Universidade de Aveiro", "Campus de Santiago"),
        "727392822": ("Cristiano Aveiro", "Grijó"),
        "387719992": ("Maria Matos", "Porto"),
        "887555987": ("Marta Maia", "Coimbra"), 
        "876111333": ("Carlos Martins", "Arouca"), 
        "433162999": ("Ana Bacalhau", "China"), 
        }

    op = ""
    while op != "T":
        op = menu()
        if op == "T":
            print("Fim")
        elif op == "L":
            print("Contactos:")
            listContacts(contactos)
        elif op == "A":
            print("Novo Contacto: ")
            addContact(contactos)
        elif op == "R":
            removeContact(contactos)
        elif op == "N":
            searchNumber(contactos)
        elif op == "P":
            partName = input("Parte do nome: ")
            newDict = filterPartName(contactos, partName)
            listContacts(newDict)
        else:
            print("Não implementado!")
    

# O programa começa aqui
main()

