from datetime import date
for nasc in range(1,8):
    nasc = int(input("Digite o ano de nascimento: "))
    atual = date.today().year
    idade = atual - nasc
    if idade < 18:
        print("Você ainda não atingiu a maioridade")
    else: 
        print("Você já atingiu a maioridade")