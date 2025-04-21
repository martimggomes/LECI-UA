# Jogo da Forca
# P8G
# 119080 119448

import random # importa o modulo random, para gerar numeros aleatórios
import os # importa o modulo os, para interagir com o sistema operativo (usar o cmd, etc)
import string # importa o modulo string, usar a lista do abecedário 
import sys # importa o modulo sys, para informações e funcionalidades do python
import platform # importa o modulo platform, para informar o sistema operativo que está a ser usado


def cls(): 

    #
    # Função que limpa a tela da linha de comandos
    #


    # verificar o tipo de sistema operativo      "Darwin" é o MAC OS
    if platform.system() == "Linux" or platform.system() == "Darwin":

        os.system("clear") # limpar a tela da linha de comandos em Linux/ MAC 

    else:
        os.system("cls") # limpar a tela da linha de comandos em Windows


# verifica se o utilizador tem a wordlist.py junto com este programa
try:
     
     from wordlist import words1, words2 # importa as variaveis words1, words2 do fichieor wordlist.py

except ModuleNotFoundError:

    print("Wordlist.py not found")
    exit()


#verifica se a(s) variaveis estão no ficheiro wordlist.py
except ImportError:

    print("Error when importing: variable(s) not found")
    exit()




# #caso não tenha o unidecode instalado no pc
try:

   from unidecode import unidecode # importa a biblioteca unidecode

except ImportError:

    # vai á linha de comandos executar este comando em Windows, Linux e Mac
    if platform.system() == "Windows":
        os.system("pip install unidecode")

    elif platform.system() == "Linux":

        os.system("sudo apt install python3-pip")
        os.system("sudo pip install unidecode")
    
    else:

        os.system("python3 pip install unidecode")

    # é preciso repetir o comando pois o python ainda não tinha acesso ao modulo
    from unidecode import unidecode
    cls()


# unidecode transforma strings/characteres acentuados em strings/characteres ASCII não acentuados
# instalar previamente o unidecode usando "pip install unidecode" na linha de comando, caso necessario também dar upgrade ao pip
# neste projeto usamos o f-string, ex:  World = "World"  print(f"Hello {World}") output: Hello World


def man(error):

    #
    # Função que mostra na tela o boneco de acordo com o número de erros cometidos
    #
    # Args:
    #   error: Número de erros causados pelo utilizador
    #

    if error == 1: 

        print("_____\n|    O\n|\n|\n|_______\n") 

    elif error == 2:

        print("_____\n|    O\n|    |\n|\n|_______\n")
    
    elif error == 3:

        print("_____\n|    O\n|   /|\n|\n|_______\n")

    elif error == 4:

        print("_____\n|    O\n|   /|\\ \n|\n|_______\n")
    
    elif error == 5:

        print("_____\n|    O\n|   /|\\ \n|   /\n|_______\n")
    
    elif error == 6:

        print("_____\n|    O\n|   /|\\ \n|   / \\ \n|_______\n")
  
    else:
        
        print("_____\n|     \n|\n|\n|_______\n") 


def word_to_underscores(secret, your_try):

    #
    # Função que mostra a palavra predefinida com underscores, tirando os espaços entre as palavras
    #
    # Args:
    #   secret: palavra predefinida, your_try: lista dos underscores da palavra
    #
    # Returns:
    #   your_try: lista dos underscores da palavra
    #

    for i in range(len(secret)):

        if secret[i] == " ":

            your_try.append("  ")

        elif secret[i] == ".":

            your_try.append(". ")

        else:

            your_try.append("_ ")

    return your_try


def isdigit(letter):

    #
    # Função que valida o input do utilizador, se é um character de um só digito
    #
    # Args:
    #   letter: input do utilizador
    #
    # Returns:
    #    True: input válido, False: input inválido
    #

    if len(letter) == 1 and letter.isalpha():

        return True
    
    else:

        print("Invalid input")

        return False
    

def already(abc, letter):
    
    #
    # Função que vê se a letra  já foi usada
    #
    # Args:
    #   abc: Lista do alfabeto com as letras introduzidas pelo utilizador ocultadas
    #   letter: input do utilizador
    #
    # Returns:
    #   True: caso o input já tenha sido usado, False: caso o input não tenha sido usado
    #

    # variável que permite ver se a letra ainda existe na lista
    flag = 0

    # verifica se a letra introduzida existe na lista
    for i in range(len(abc)):

        if letter == abc[i]:

            flag = 1

    # verifica se a letra introduzida esteja ou não na lista
    if flag == 1:

        return False
    
    else:

        return True


def found(secret, letter, abc, error):

    #
    # Função que permite saber se o input está na palavra random, atualiza o número de erros e edita a lista abc cortando o input usado
    #
    # Args:
    #   secret: palavra random, letter: input do utilizador
    #   abc: lista do abecedario, error: Número de erros causados pelo utilizador
    #
    # Returns:
    #   abc: lista do abecedario atulizada consoante o input usado, error: número de erros atualizados
    #

    # variavel que ve se a palavra tem pelo menos um lugar com aquela letra
    verify = False


    # verifica se aquela letra existe na palavra
    for i in range(len(secret)):

        if letter == unidecode(secret[i]).upper():

            verify = True
            break
    
    # caso exista altera a lista abc para "+" caso exista e "-" caso o contrario
    for i in range(len(abc)):

        if letter == abc[i]:

            if verify:

                abc[i] = "+"

            else:
                error += 1
                abc[i] = "-"

    return abc, error


def word_found(secret, your_try_s):

    #
    # Função permite ver se o utlizador já fez a palavra completa com os inputs usados
    #
    # Args:
    #   secret: palavra random, your_try_s: string apartir dos inputs corretos
    #
    # Returns:
    #   True: caso já tenha encontrado a palavra, False: caso ainda não tenha encontrado a palavra
    #

    # retira os espaços das strings your_try_s e secret
    your_try_s = "".join(your_try_s).replace(" ", "")
    secret = "".join(secret).replace(" ", "")

    # verifica se a string é igual á palavra random
    return your_try_s == secret
    


def hangman(word_list):

    #
    # Função principal do jogo da Forca
    #

    error = 0 # numero de erros do utilizador

    # caso alterem as variaveis words1 e/ou words2 apareceça uma mensagem de erro
    try:

        secret = random.choice(word_list).upper() # escolhe um elemento random da lista secret e coloca em letras maiúsculas
    
    except TypeError:

        print("Changed the type of variable(s) in the wordlist")
        exit()   
    
    your_try = [] # lista para ver o progresso da palavra
    your_try = word_to_underscores(secret, your_try) # lista com os underscores da palavra

    abc = list(string.ascii_uppercase) # lista com as letras do abecedário em maiusculas

    # continua no ciclo se não exceder os erros permitidos
    while error < 7:

        # transforma a lista numa string
        your_try_s = "".join(your_try)

        # verifica se já foi encontrada a palavra
        if word_found(secret, your_try_s):
            
            print(f"Congratulations the word is {secret}, only {error} error(s)")
            break

        # mostra o boneco consoante os erros e mostra o número de erros cometidos
        man(error)
        print(f"Erro: {error}\n")

        # transforma a lista abc numa string
        abc_s = "".join(abc)

        # input do utlizador
        print(f"{your_try_s}\n")
        letter = input(f"Try {abc_s}:")

        cls()

        # verifica se o input do utilizador é um character e só tem 1 dígito
        if(isdigit(letter) == False):

            continue

        # transforma o input do utlizador em maiúsculas
        letter = unidecode(letter.upper())

        # verifica se a letra já tenha sido usada
        if already(abc, letter):

            print(f"{letter} was already used")

            continue


        # modifica a lista abc consoante a letra usada e manda um novo erro
        abc, error_new = found(secret, letter, abc, error)

        # verifica se o erro aumentou
        if error_new == error:

            for i in range(len(secret)):

                if unidecode(secret[i]) == letter:

                    your_try[i] = secret[i] + " "
            
            continue


        # adiciona 1 ao erro 
        error = error_new

    
    if(error == 7):

        print(f"You lose, the word is {secret}")


def main():
    
    cls()
    
    while True:

        # Descomente a linha que interessar para testar
        #words = words1              # palavras sem acentos nem cedilhas.
        #words = words2             # palavras com acentos ou cedilhas.

        # caso alterem as variaveis words1 e/ou words2 apareceça uma mensagem de erro
        try:
            words = words1 + words2    # palavras de ambos os tipos

        except TypeError:

            print("Changed the type of variable(s) in the wordlist")
            exit()

        # corre o programa com as palavras dadas
        if len(sys.argv) > 1:       
            words = sys.argv[1:]
    
        # Função do Jogo da Forca
        hangman(words)

        while True:

            # input caso o utlizador ainda quiser jogar
            choise = input("Do you want to continue(Y/n): ")
            
            cls()

            # verifica se o utilizador quer continuar a jogar
            if choise.upper() == "Y" or choise.upper() == "YES":

                break
            
            elif choise.upper() == "N" or choise.upper() == "NO":

                print("Thanks for playing!")
                exit()
            

        continue

            
if __name__ == "__main__":

    main()