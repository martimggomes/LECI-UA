dados = dict()

dados["Nome"] = str(input("Nome: "))
nascimento = int(input("Ano de nascimento: "))
idade = 2023 - nascimento
dados["Idade"] = idade
dados["Ctps"] = int(input("Carteira de trabalho (0 não tem): "))
if dados["Ctps"] != 0:
    dados["Contratação"] = int(input("Ano da Contratação: "))
    dados["Salário"] = float(input("Salário(€): "))
    dados["Aposentadoria"] = dados["Idade"] + ((dados["Contratação"] + 35 ) - 2023)
    
for k,v in dados.items():
    print(f"{k}: {v}")