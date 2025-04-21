from datetime import datetime

# Constantes para indexar os tuplos:
NOME, QUANTIDADE, PRECO, VALIDADE = 0, 1, 2, 3

# Função para ler o arquivo CSV e carregar os dados em uma lista de tuplos
def ler_arquivo_csv(nome_arquivo):
    produtos = []
    with open(nome_arquivo, 'r', encoding='utf-8') as f:
        for linha in f:
            partes = linha.strip().split(",")
            nome = partes[NOME]
            quantidade = int(partes[QUANTIDADE])
            preco = float(partes[PRECO])
            validade = partes[VALIDADE]
            produtos.append((nome, quantidade, preco, validade))
    return produtos

# Função para calcular o valor total do estoque
def calcular_valor_estoque(produtos):
    valor_total = {}
    for p in produtos:
        nome = p[NOME]
        quantidade = p[QUANTIDADE]
        preco = p[PRECO]
        if nome in valor_total:
            valor_total[nome] += preco * quantidade
        else:
            valor_total[nome] = preco * quantidade
    return valor_total

# Função para encontrar o produto mais caro em termos de preço por unidade
def produto_mais_caro(produtos):
    mais_caro = produtos[0]
    for produto in produtos:
        if produto[PRECO] > mais_caro[PRECO]:
            mais_caro = produto
    return mais_caro

# Função para listar produtos próximos da validade (prazo de 7 dias ou menos)
def produtos_proximos_validade(produtos, dias=7):
    proximos_validade = []
    hoje = datetime.now().date()
    for produto in produtos:
        data_validade = datetime.strptime(produto[3], "%Y-%m-%d").date()
        if(data_validade - hoje).days <= dias:
            proximos_validade.append(produto)
    return proximos_validade

# Função para adicionar um novo produto ao inventário
def adicionar_produto(produtos, nome, quantidade, preco, validade):
    # Complete o código aqui...
    produtos.append((nome, quantidade, preco, validade))

# Função para atualizar o estoque de um produto existente
def atualizar_estoque(produtos, nome, quantidade):
    # Complete o código aqui...
    for i, produto in enumerate(produtos):
        if produto[0] == nome:
            produtos[i] = (nome, produto[1] + quantidade, produto[2], produto[3])
            break

# Função para remover produtos fora da validade
def remover_produtos_vencidos(produtos):
    hoje = datetime.now().date()
    # Complete o código aqui...
    for produto in produtos:
        data_validade = datetime.strptime(produto[3], "%Y-%m-%d").date()
        if data_validade < hoje:
            produtos.remove(produto)

# Função principal para demonstrar o uso das funções
def main():
    nome_arquivo = "C:\\Users\\MARTIM\\Desktop\\Disciplinas\\FP_EE\\ExameChatGPT2\\produtos.csv"
    produtos = ler_arquivo_csv(nome_arquivo)

    print("Valor total do estoque: €", calcular_valor_estoque(produtos))

    mais_caro = produto_mais_caro(produtos)
    print(f"O produto mais caro é {mais_caro[0]} a €{mais_caro[2]:.2f} por unidade.")

    proximos_validade = produtos_proximos_validade(produtos)
    print("\nProdutos próximos da validade:")
    for produto in proximos_validade:
        print(f"{produto[0]} (Validade: {produto[3]})")

    print("\nAdicionando um novo produto...")
    adicionar_produto(produtos, "Banana", 40, 0.25, "2024-09-25")
    print("Produtos após adicionar Banana:")
    for produto in produtos:
        print(produto)

    print("\nAtualizando estoque do produto 'Maçã'...")
    atualizar_estoque(produtos, "Maçã", 20)
    print("Produtos após atualizar o estoque de Maçã:")
    for produto in produtos:
        print(produto)

    print("\nRemovendo produtos vencidos...")
    remover_produtos_vencidos(produtos)
    print("Produtos após remover os vencidos:")
    for produto in produtos:
        print(produto)

if __name__ == "__main__":
    main()
