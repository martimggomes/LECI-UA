import csv

def carregar_dados(nome_arquivo):
    lista_tuplos = []
    with open(nome_arquivo, mode='r', encoding='utf-8') as file:
        reader = csv.reader(file)
        next(reader)  # Pular o cabeçalho
        for row in reader:
            lista_tuplos.append(tuple(row))
    return lista_tuplos

def clubes_por_pais(lista_tuplos, pais):
    for clube in lista_tuplos:
        if clube[2] == pais:
            print("Clube: {}, Posição {}, Score: {}".format(clube[1], clube[0], clube[3]))
    

def salvar_clubes_por_pais(lista_tuplos, pais, nome_arquivo_saida):
    with open(nome_arquivo_saida, 'w', encoding='utf-8') as file:
        for clube in lista_tuplos:
            if clube[2] == pais:
                file.write("Clube: {}, Posição {}, Score: {}".format(clube[1], clube[0], clube[3]))

def agrupar_clubes_por_pais(lista_tuplos):
    dicionario = {}
    for clube in lista_tuplos:
        pais = clube[2]
        if pais not in dicionario:
            dicionario[pais] = []
        dicionario[pais].append(clube[1])
    return dicionario

def clube_que_mais_subiu(lista_tuplos):
    clube_mais_subiu = None
    maior_subida = None
    for clube in lista_tuplos:
        subida = int(clube[4])
        if maior_subida is None or subida < maior_subida:
            maior_subida = subida
            clube_mais_subiu = clube
    return clube_mais_subiu

def dados_do_clube(lista_tuplos, nome_clube):
    for clube in lista_tuplos:
        if clube[1] == nome_clube:
            print(f"Dados do Clube: {clube}")
            return
    print("Clube não encontrado.")
    
def ranking_medio_por_pais(lista_tuplos):
    ranking_por_pais = {}
    for clube in lista_tuplos:
        pais = clube[2]
        ranking = int(clube[0])
        if pais in ranking_por_pais:
            ranking_por_pais[pais].append(ranking)
        else:
            ranking_por_pais[pais] = [ranking]
            
    ranking_medio = {}
    for pais, rankings in ranking_por_pais.items():
        media = sum(rankings) / len(rankings)
        ranking_medio[pais] = media
    return ranking_medio

def ordenar_paises_por_ranking_medio(lista_tuplos):
    ranking_medio = ranking_medio_por_pais(lista_tuplos)
    ranking_ordenado = sorted(ranking_medio.items(), key= lambda x: x[1])
    for pais, ranking in ranking_ordenado:
        print("País: {}, Ranking Médio: {}".format(pais, ranking_medio))

def menu(lista_tuplos):
    while True:
        print("\nMenu:")
        print("1 - Listar clubes por país")
        print("2 - Salvar clubes por país em arquivo")
        print("3 - Agrupar clubes por país")
        print("4 - Encontrar o clube que mais subiu no ranking")
        print("5 - Exibir dados de um clube específico")
        print("6 - Calcular ranking médio por país")
        print("7 - Ordenar países por ranking médio")
        print("0 - Sair")
        opcao = input("Escolha uma opção: ")

        if opcao == '1':
            pais = input("Digite o nome do país: ")
            clubes_por_pais(lista_tuplos, pais)
        elif opcao == '2':
            pais = input("Digite o nome do país: ")
            nome_arquivo_saida = input("Digite o nome do arquivo de saída: ")
            salvar_clubes_por_pais(lista_tuplos, pais, nome_arquivo_saida)
        elif opcao == '3':
            resultado = agrupar_clubes_por_pais(lista_tuplos)
            print(resultado)
        elif opcao == '4':
            resultado = clube_que_mais_subiu(lista_tuplos)
            print(resultado)
        elif opcao == '5':
            nome_clube = input("Digite o nome do clube: ")
            dados_do_clube(lista_tuplos, nome_clube)
        elif opcao == '6':
            ranking_medio = ranking_medio_por_pais(lista_tuplos)
            for pais, media in ranking_medio.items():
                print(f"País: {pais}, Ranking Médio: {media}")
        elif opcao == '7':
            ordenar_paises_por_ranking_medio(lista_tuplos)
        elif opcao == '0':
            break
        else:
            print("Opção inválida.")


lista_tuplos = carregar_dados('C:\\Users\\MARTIM\\Desktop\\Disciplinas\\FP_EE\\Exame1\\Soccer_Football Clubs Ranking.csv')
menu(lista_tuplos)