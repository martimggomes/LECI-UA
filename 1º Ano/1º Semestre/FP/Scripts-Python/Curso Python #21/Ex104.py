def LeiaInt(msg):
    ok = False
    valor = 0
    while True:
        n = str(input(msg))
        if n.isnumeric():
            valor = int(n)
            ok = True
        else:
            print("\033[0;31mErro. Digite um número inteiro válido!\033[m") #cor
        if ok:
            break  
    return valor

n = LeiaInt("Digite um número: ")
print(f"Você digitou o número {n}")


    
    
    
    
