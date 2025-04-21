def voto(ano):
    idade = 2024 - ano
    if idade < 18:
        return f"Com {idade} anos não pode votar (Voto negado)"
    elif idade >= 18:
        return f"Com {idade} anos é obrigatório votar!"
        





nasc = int(input("Qual o seu ano de nascimento: "))
print(voto(nasc))