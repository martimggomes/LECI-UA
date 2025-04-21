# Função para ler o ficheiro e retornar uma lista de tuplas
def ler_vendas(ficheiro):
    vendas = []
    with open(ficheiro, 'r', encoding='utf-8') as f:
        for line in f:
            partes = line.split(",")
            produto = partes[0]
            quantidade = int(partes[1])
            preco = float(partes[2])
            data = partes[3]
            venda = (produto, quantidade, preco, data)
            vendas.append(venda)
    return vendas

# Função para calcular o total arrecadado por cada produto
def calcular_total_por_produto(vendas):
    total_por_produto = {}
    for venda in vendas:
        nome_produto, quantidade, preco, _ = venda
        if nome_produto not in total_por_produto:
            total_por_produto[nome_produto] = quantidade * preco
        else:
            total_por_produto[nome_produto] += quantidade * preco
    return total_por_produto
    

# Função para calcular as vendas por dia
def calcular_vendas_por_dia(vendas):
    vendas_por_dia = {}
    for venda in vendas:
        nome_produto, _, _, data_venda = venda
        if data_venda in vendas_por_dia:
            vendas_por_dia[data_venda].append(nome_produto)
        else:
            vendas_por_dia[data_venda] = [nome_produto]
    return vendas_por_dia

# Função para gerar e exibir o relatório
def gerar_relatorio(vendas):
    total_por_produto = calcular_total_por_produto(vendas)
    vendas_por_dia = calcular_vendas_por_dia(vendas)
    
    print("Total por Produto:")
    for produto, total in total_por_produto.items():
        print("{}: {}".format(produto, round(total, 2)))
        
    print("\nVendas por Dia:")
    for data, produtos in vendas_por_dia.items():
        print("{}: {}".format(data, produtos))

# Programa principal
def main():
    # Nome do ficheiro com os dados das vendas
    ficheiro = 'C:\\Users\\MARTIM\\Desktop\\Disciplinas\\FP_EE\\Exame4\\vendas.txt'
    
    # Ler as vendas do ficheiro
    vendas = ler_vendas(ficheiro)
    
    # Gerar o relatório
    gerar_relatorio(vendas)

# Chamar o programa principal
if __name__ == "__main__":
    main()
