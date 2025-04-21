import os

def main():
    while True:
        chamadas = []
        
        print("""1) Registar Chamada
2) Ler ficheiro
3) Listar clientes
4) Fatura
5)Terminar""")
        
        opcao = int(input("Opção: "))
        if opcao == 1:
            registar_chamada(chamadas)
        elif opcao == 2:
            ler_ficheiro(chamadas)
        elif opcao == 3:
            listar_clientes(chamadas)
        elif opcao == 4:
            gerar_fatura(chamadas)
        else:
            exit(0)
        
            
        
def validar_numero(numero):
    
    if len(numero) >= 3 and (numero.isdigit() or (numero.startswith('+') and numero[1:].isdigit())):
        return True
    else:
        return False
    

def registar_chamada(chamadas):
    
    origem = input("Telefone Origem? ")
    while not validar_numero(origem):
        print("Telefone de oigem inválido!")
        origem = input("Telefone Origem? ")

    destino = input("Telefone destino? ")
    while not validar_numero(destino):
        print("Telfone de destino inválido!")
        destino = input("Telefone Destino? ")
        
    duracao = int(input("Duração (s)? "))
    
    chamadas.append((origem, destino, duracao))
    print("Chamada registada com sucesso!\n")


def ler_ficheiro(chamadas):
    
    ficheiro = input("Ficheiro? ")
    if os.path.exists(ficheiro):
        with open(ficheiro, 'r') as file:
            readfilelines = file.readlines()
            for linha in readfilelines:
                origem, destino, duracao = linha.strip().split()
                chamadas.append((origem, destino, int(duracao)))
        print("Ficheiro lido com sucesso!\n")
    else:
        print("Ficheiro inválido!\n")
            

def listar_clientes(chamadas):
    clientes = sorted(set(chamada[0] for chamada in chamadas))
    print("Clientes:"," ".join(clientes), "\n")
    

def gerar_fatura(chamadas):
    
    cliente = input("Cliente? ")
    fatura = []
    custo_total = 0
    
    for origem, destino, duracao in chamadas:
        if origem == cliente:
            if destino.startswith("2"):
                custo = 0.02 * duracao / 60
            elif destino.startswith("+"):
                custo = 0.80 * duracao / 60
            elif origem[:2] == destino[:2]:
                custo = 0.04 * duracao / 60
            else:
                custo = 0.10 * duracao / 60
                
        fatura.append((destino, duracao, round(custo, 2)))
        custo_total += custo
    
    if fatura:
        print("Fatura do cliente {}".format(cliente))
        print("Destino             Duração      Custo")
        for destino, duracao, custo in fatura:
            print(f"{destino:<20}{duracao:<12}{custo:.2f}")
        print(f"Total:       {round(custo_total, 2)}\n")
    else:
        print(f"Nenhuma chamada encontrada para o cliente {cliente}.\n")
                    
if __name__ == '__main__':
    main()