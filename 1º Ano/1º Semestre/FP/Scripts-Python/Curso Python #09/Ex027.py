n = input("Digite o seu nome completo: ").strip()
nome = n.split()
print("Seu primeiro nome é {}".format(nome[0]))
print("O seu último nome é {}".format(nome[len(nome)-1])) 