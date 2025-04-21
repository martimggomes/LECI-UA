from lib.interface import *

def arquivoExiste(nome):
    try:
        a = open(nome, "rt")                                    #rt = read text(file)
        a.close()
    except FileNotFoundError:
        return False
    else: 
        return True
    
    
def criarArquivo(nome):
    try:
        a = open(nome, "wt+")                                   #wt+ = wrtie text(file) (+ = adicionar caso não exista)
        a.close()
    except:
        print("\033[0,31mErro na criação do arquivo\033[m")
    else:
        print(f"Arquivo {nome} criado com sucesso!")
        

def lerArquivo(nome):
    try:
        a = open(nome, "rt")                                    #rt = read text
    except: 
        print("\033[0,31mErro ao ler os arquivos\033[m")
    else:
        cabeçalho("PESSOAS CADASTRADAS")
        for linha in a:
            dado = linha.split(';')
            dado[1] = dado[1].replace("\n", "")
            print(f"{dado[0]:<30}{dado[1]:>3} anos")
        print(a.read())
    finally:
        a.close()
    
    
def cadastrar(arq, nome="Desconhecido", idade=0):
    try:
        a = open(arq, 'at')                                    #at = append to text(file)
    except:
        print("Erro na abertura do arquivo")
    else:
        try:
            a.write(f"{nome};{idade}\n")
        except:
            print("Erro ao escrever os dados")
        else:
            print(f"Novo registro de {nome} adicionado!")
            a.close()