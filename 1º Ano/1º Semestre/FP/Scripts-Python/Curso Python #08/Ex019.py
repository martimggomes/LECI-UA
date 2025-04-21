import random
a1 = input("Primeiro aluno: ")
a2 = input("Segundo aluno: ")
a3 = input("Terceiro aluno: ")
a4 = input("Quarto aluno: ")
ls = [a1, a2, a3, a4]
escolhido = random.choice(ls)
print("O aluno escolhido foi o {}.".format(escolhido))