import moedas

p = float(input("Digite o preço: "))
t = float(input("Digite a taxa (sem o símbolo %): "))
print(f"Metade de {moedas.moeda(p)} são {moedas.moeda(moedas.metade(p))}")
print(f"O dobro de {moedas.moeda(p)} são {moedas.moeda(moedas.dobro(p))}")
print(f"{moedas.moeda(p)} com um aumento de {moedas.taxa(t)}%, fica por {moedas.moeda(moedas.aumentar(p, t))}")
print(f"{moedas.moeda(p)} com desconto de {moedas.taxa(t)}%, fica por {moedas.moeda(moedas.diminuir(p, t))}")