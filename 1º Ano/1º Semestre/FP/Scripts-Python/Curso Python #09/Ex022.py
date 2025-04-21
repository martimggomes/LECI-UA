nome = input("Digite o seu nome completo: ").strip()
print(nome)
print("Analisando seu nome...")
print("O seu nome em maiúsculas é {}".format(nome.upper()))
print("O seu nome em minúsculas é {}".format(nome.lower()))
print("O seu nome tem ao todo {} letras.".format(len(nome) - nome.count(" ")))
separa = nome.split()
print("O seu primeiro nome é {} e ele tem {} letras.".format(separa[0], len(separa[0])))



