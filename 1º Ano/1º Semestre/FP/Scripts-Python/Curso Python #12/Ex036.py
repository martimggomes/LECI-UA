casa = float(input("Digite o valor da casa: "))
salário = float(input("Digite o valor do seu salário: "))
anos = int(input("Digite em quantos anos pretende pagar a casa: "))
prestação = casa / (anos * 12)
minimo = salário * 0.30
print("Para pagar uma casa de {:.2f} euros, a prestação será de {:.2f} euros".format(casa, prestação))
if prestação <= minimo:
    print("Será feito o empréstimo.")
else: 
    print("Não será feito o empréstimo.")