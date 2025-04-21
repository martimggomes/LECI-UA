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

def leiaFloat(msg):
    while True:
        try:
            n = float(input(msg))
        except (ValueError, TypeError):
            print("\033[0;31mErro. Digite um número inteiro válido!\033[m")
        except KeyboardInterrupt:
            print("\033[0;31mErro. O usuário preferiu não digitar esse número!\033[m")
        else:
            return n
    
num = leiaInt("Digite um número inteiro: ")
num2 = leiaFloat("Digite um número real: ")
print(f"O valor digitado foi o número inteiro {num} e o número real {num2}")

