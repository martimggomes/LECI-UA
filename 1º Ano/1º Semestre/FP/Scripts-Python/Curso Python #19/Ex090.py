aluno = dict()
aluno["Nome"] = str(input("Digite o nome do aluno: "))
aluno["Média"] = float(input("Digite a média do aluno: "))
print()
if aluno["Média"] >= 9.5:
    aluno["Situação"] = "Aprovado!"
else:
    aluno["Situaçõo"] = "Reprovado!:("

for k,v in aluno.items():
    print(f"{k} - {v}")