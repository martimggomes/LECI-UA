from lib.interface import *
from lib.arquivo import *

arq = 'Curso Python #23/Ex115.py/cursoemvideo.txt'

if not arquivoExiste(arq):
    criarArquivo(arq)

while True:
    resposta = menu(["Ver Pessoas Cadastradas", "Cadastrar Nova Pessoa", "Sair do Programa"])

    if resposta == 1:
        #opção de listar o conteúdo de um arquivo
        lerArquivo(arq)
    elif resposta == 2:
        cabeçalho("NOVO CADASTRO")
        nome = str(input("Nome: "))
        idade = int(input("Idade: "))
        cadastrar(arq, nome, idade)
    elif resposta == 3:
        print("Saíndo do Programa... Até logo!")
        break
    else:
        print("\033[0;31mErro. Digite uma opção válida!\033[m")