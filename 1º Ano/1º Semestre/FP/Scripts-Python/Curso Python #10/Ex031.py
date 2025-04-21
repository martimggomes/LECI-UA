d = float(input("Indique a distânica percorrida da viagem: "))
pv = d * 0.50
gv = d * 0.45
if d <= 200:
    print("O preço da passaagem é de {} euros.".format(pv))
else:
    print("O preço da passagem é de {} euros.".format(gv))
    