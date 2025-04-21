sexo = input("Qual o seu sexo (M/F)? ").strip().upper()[0]
while sexo not in "MmFf":
    sexo = input("Dados inválidos").strip().upper()[0]
print("Sexo {} registado com sucesso".format(sexo))