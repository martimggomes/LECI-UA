# Função para ler o ficheiro e retornar uma lista de tuplas
def ler_vendas(ficheiro):
    vendas = []
    with open(ficheiro, 'r') as f:
        for linha in f:
            # Remover espaços em branco e nova linha
            linha = linha.strip()
            # Dividir a linha nos componentes
            partes = linha.split(',')
            nome_produto = partes[0]
            quantidade = int(partes[1])
            preco_unitario = float(partes[2])
            data_venda = partes[3]
            # Criar uma tupla e adicionar à lista de vendas
            venda = (nome_produto, quantidade, preco_unitario, data_venda)
            vendas.append(venda)
    return vendas

# Função para calcular o total arrecadado por cada produto
def calcular_total_por_produto(vendas):
    total_por_produto = {}
    for venda in vendas:
        nome_produto, quantidade, preco_unitario, _ = venda
        if nome_produto in total_por_produto:
            total_por_produto[nome_produto] += quantidade * preco_unitario
        else:
            total_por_produto[nome_produto] = quantidade * preco_unitario
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
        print(f"{produto}: {total:.2f}")
    
    print("\nVendas por Dia:")
    for data, produtos in vendas_por_dia.items():
        print(f"{data}: {produtos}")

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
