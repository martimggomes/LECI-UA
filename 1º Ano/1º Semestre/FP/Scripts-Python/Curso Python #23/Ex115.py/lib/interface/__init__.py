def leiaInt(msg):
    while True:
        try:
            n = int(input(msg))
        except (ValueError, TypeError):
            print("\033[0;31mErro. Digite um número inteiro válido!\033[m")
            continue 
        except KeyboardInterrupt:
            print("\033[0;31mEntrada de dados interrompida pelo usuário.\033[m")
        else:
            return n

def linha(tam=42):
    return "-" * tam

def cabeçalho(txt):
    print(linha())
    print(txt.center(42))
    print(linha())
    
def menu(lista):
    cabeçalho("MENU PRINCIPAL")
    c = 1
    for item in lista:
        print(f"[{c}] {item}")
        c += 1
    print(linha())
    opc = leiaInt("Sua Opção: ")
    return opc