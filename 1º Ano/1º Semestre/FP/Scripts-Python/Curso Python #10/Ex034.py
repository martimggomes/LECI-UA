salário = float(input("Indique o seu salário atual: "))

if salário > 1250:
    salário = salário + salário * 0.10
else:
    salário = salário + salário * 0.15
    
print("Com o aumento correpondente, o seu salário passara a ser de {} euros.".format(salário))
