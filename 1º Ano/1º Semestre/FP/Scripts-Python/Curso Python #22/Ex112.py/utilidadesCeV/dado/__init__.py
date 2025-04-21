def leiaDinheiro(msg):
    válido = False
    while not válido:
        entrada = str(input(msg)).replace(",", ".")
        if entrada.isalpha() or entrada.strip() == '':
            print("\033[0;31mErro. Digite um número inteiro válido!\033[m")
        else:
            válido = True
            return float(entrada)
        
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
