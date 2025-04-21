v = float(input("Qual a velocidade a que o carro estava a andar? "))
m = (v - 80) * 7
if v > 80:
    print("Você foi multado. Terá de pagar {} euros de multa.".format(m))
else:
    print("A carteira está safe!")
    