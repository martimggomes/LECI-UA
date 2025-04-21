import moedas

p = float(input("Digite o preço: "))
t = float(input("Digite a taxa (sem o símbolo %): "))
print(f"Metade de {p}€ são {moedas.metade(p)}€")
print(f"O dobro de {p}€ são {moedas.dobro(p)}€")
print(f"{p}€ com um aumento de {t}%, fica por {moedas.aumentar(p, t)}€")
print(f"{p}€ com desconto de {t}%, fica por {moedas.diminuir(p, t)}€")