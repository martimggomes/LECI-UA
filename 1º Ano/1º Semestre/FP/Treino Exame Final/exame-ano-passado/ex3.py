"""
Neste programa, countries é uma lista com dados de vários países. 
Cada elemento da lista é um tuplo com o nome do país, o código do continente, 
a área e a população. A variável countries2 contém outra lista do mesmo tipo.

Complete a função morePop(countries, N) para devolver uma lista com os pares (área, nome)
dos países com mais do que N habitantes. Pressione Codecheck para conferir o resultado 
esperado.
nao consigo copiar tudo mas tenho a lista por odem (nome,continente,area,populacao) 
tens q fzr sort para a populacao

!!EXEMPLO!!
nome, continente, area, populacao
   ("Grenada", "Na", 344.0, 108825)
dps tem mais 4
# Complete...
   lst2 = ...


"""

def morePop(countries, N):
    lista = []
    for country in countries:
        if country[3] > N:
            lista.append((country[2], country[0]))
    sorted_countries = sorted(lista, key=lambda x: x[0], reverse=True)
    return sorted_countries

countries = (("Grenada", "Na", 344.0, 108825),
            ("Bilbao", "Na", 432.0, 213423),
            ("Madrid", "Na", 42321.0, 32434242),
            ("Sevilla", "Na", 2342.0, 438794))

print(morePop(countries, 213213))