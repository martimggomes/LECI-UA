frase = input("Digite uma frase: ").strip().upper()
palavras = frase.split()
junto = " ".join(palavras)
inverso = ""
for letra in range(len(junto) - 1, -1, -1):
    inverso += junto[letra]
print(inverso)
if inverso == junto:
    print("Temos um palíndromo!")
else:
    print("Não temos um palíndromo!")


