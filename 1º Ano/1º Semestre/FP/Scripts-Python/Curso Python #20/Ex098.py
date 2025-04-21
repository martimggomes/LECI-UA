from time import sleep


def contador(i, f, p):
    
    if p < 0:
        p *= -1
    if p == 0:
        p *= 1
    
    print(f"Contagem de {i} ao {f} de {p} em {p}.")
    sleep(2.5)
    
    if i < f:
        cont = i 
        while cont <= f:
            print(f"{cont}", end=' ', flush=True)
            sleep(0.5)
            cont += p
        print("Fim!")
    
    else:
        cont = i
        while cont >= f:
            print(f"{cont}", end=' ', flush=True)
            sleep(0.5)
            cont -= p
        print("Fim!")

contador(1, 10, 1)
contador(10, 0, 2) 
print("Agora é a sua vez de personalizar!!!")
ini = int(input("Início:  "))
fim = int(input("Fim:     "))
pas = int(input("Passo:   "))
contador(ini, fim, pas)