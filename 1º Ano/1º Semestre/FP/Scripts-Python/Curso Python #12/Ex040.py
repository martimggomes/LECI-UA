nota1 = float(input("Valor da 1º nota: "))
nota2 = float(input("Valor da 2º nota: "))
m = (nota1 + nota2) / 2
if m < 5.0:
    print("Reprovado com média de {} valores".format(m))
elif 5.0 < m < 6.9:
    print("Recuperação com média de {} valores".format(m))
else: 
    print("Aprovado com média de {} valores".format(m))