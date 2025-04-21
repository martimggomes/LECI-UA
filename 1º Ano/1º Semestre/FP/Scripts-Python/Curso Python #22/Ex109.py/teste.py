import moedas

p = float(input("Digite o preço: "))
t = float(input("Digite a taxa (sem o símbolo %): "))
print(f"Metade de {moedas.moeda(p)} são {(moedas.metade(p, True))}")
print(f"O dobro de {moedas.moeda(p)} são {(moedas.dobro(p, True))}")
print(f"{moedas.moeda(p)} com um aumento de {moedas.taxa(t)}%, fica por {(moedas.aumentar(p, t, True))}")
print(f"{moedas.moeda(p)} com desconto de {moedas.taxa(t)}%, fica por {(moedas.diminuir(p, t, True))}")