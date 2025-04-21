from datetime import date
n = int(input("Insira o seu ano de nascimento:"))
idade = date.today().year - n
pi = abs(idade - 18)
if idade == 18:
    print("Irá se alistar ao serviço militar este ano")
if idade < 18:
    print("Ainda falta {} ano(s) para se alistar".format(pi))
elif idade > 18:
    print("Já se passarm {} ano(s) de se ter alistado".format(pi))