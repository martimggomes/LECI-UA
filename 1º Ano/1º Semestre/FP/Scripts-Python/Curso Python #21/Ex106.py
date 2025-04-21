def ajuda(com):
    help(com)

def título(msg):
    tam = len(msg) + 4
    print("~" * tam)
    print(f"  {msg}")
    print("~" * tam)

comando = ''
while True:
    título("Sistem de Ajuda PyHelp")
    comando = str(input("Função ou Biblioteca > "))
    if comando.upper() == "FIM":
        break
    else:
        ajuda(comando)
título("Até logo!")
