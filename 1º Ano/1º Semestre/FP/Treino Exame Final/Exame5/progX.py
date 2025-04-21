# progW.py [10 pontos]

# Lista de frases para serem processadas
frases = ["Aprender Python é divertido", "Desenvolver código exige prática"]

# Função para inverter a ordem das palavras e convertê-las para maiúsculas
def inverter_e_maiusculo(frases):
    resultado = []
    for frase in frases:
        palavras = frase.split()
        palavras_invertidas = palavras[::-1]
        frase_invertida_maiuscula = " ".join(palavras_invertidas).upper()
        resultado.append(frase_invertida_maiuscula)
    return resultado

# Função para contar caracteres em cada frase
def contar_caracteres(frases):
    resultado = []
    for frase in frases:
        resultado.append(len(frase))
    return resultado

# Teste da função inverter_e_maiusculo
resultado_invertido = inverter_e_maiusculo(frases)
print(resultado_invertido)  # Saída esperada: ["DIVERTIDO É PYTHON APRENDER", "PRÁTICA EXIGE CÓDIGO DESENVOLVER"]

# Teste da função contar_caracteres
resultado_caracteres = contar_caracteres(frases)
print(resultado_caracteres)  # Saída esperada: [25, 32]
