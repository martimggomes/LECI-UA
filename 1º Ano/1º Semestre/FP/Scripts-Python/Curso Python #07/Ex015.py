km = float(input("Km: "))
dias = int(input("Dias: "))
preço = (dias * 60) + (km * 0.15)
print("Terá de pagar {} euros pelo carro alugado.".format(preço))