# progX.py [10 pontos]

# Lista de frases para serem processadas
frases = ["O rato roeu a roupa do rei de Roma", "A vaca foi para o brejo"]

# Função para ordenar palavras dentro de cada frase
def ordenar_palavras(frases):
    resultado = []
    for frase in frases:
        palavras = frase.split()
        palavras_ordenadas = sorted(palavras, key=lambda palavra: palavra.lower())
        frase_ordenada = " ".join(palavras_ordenadas)
        resultado.append(frase_ordenada)
    return resultado
    
# Função para contar palavras em cada frase
def contar_palavras(frases):
    contagens = []
    for frase in frases:
        palavras = frase.split()
        contagens.append((len(palavras)))
    return contagens
        
# Teste da função ordenar_palavras
resultado_ordenado = ordenar_palavras(frases)
print(resultado_ordenado)  # Saída esperada: ["a de do O rei Roma roeu roupa rato", "A brejo foi o para vaca"]

# Teste da função contar_palavras
resultado_contagem = contar_palavras(frases)
print(resultado_contagem)  # Saída esperada: [9, 6]
