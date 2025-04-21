listagem = ('Lápis', 1.75,
            'Borracha', 1.00,
            'Caneta', 1.23,
            'Estojo', 5.00,
            'Livro', 2.29)

print("-" * 36)
print("Listagem de preços".center(36))
print("-" * 36)
for pos in range(0, len(listagem)):
    if pos % 2 == 0:
        print(f"{listagem[pos]:.<30}", end='')
    else:
        print(f"{listagem[pos]:>5}€")