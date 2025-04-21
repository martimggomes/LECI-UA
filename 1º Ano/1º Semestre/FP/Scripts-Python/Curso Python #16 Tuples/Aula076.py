listagem = ("Lápis", 1.75,
            "Booracha", 2.0,
            "Caderno", 15.90,
            "Estojo", 25.0,
            "Transferidor", 4.20,
            "Compasso", 9.99)
print("-" *38)
print("TABELA DE PREÇOS")
print("-" *38)
    
for pos in range(0, len(listagem)):
    if pos % 2 == 0:
        print(f"{listagem[pos]:.<30}", end = " ")
    else: 
        print(f"{listagem[pos]:>3.2f} €")
print("-" *38)    