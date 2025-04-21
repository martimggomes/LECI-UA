# progY.py [10 pontos]

# Lista de tuplas com strings e números inteiros associados
lista = [("apple", 3), ("banana", 2), ("cherry", 5)]

# Função para repetir strings com base no número associado
def repetir_strings(lista):
    resultado = []
    for palavra, repeticoes in lista:
        string_repetida = palavra * repeticoes
        resultado.append(string_repetida)
    return resultado

# Função para formatar a saída das strings repetidas
def formatar_output(lista):
    resultado_formatado = []
    for i, string in enumerate(lista, start=1):
        resultado_formatado.append("{}: {}".format(i, string))
    return "\n".join(resultado_formatado)

# Teste da função repetir_strings
resultado_repetir = repetir_strings(lista)
print(resultado_repetir)  # Espera-se algo como: ['appleappleapple', 'bananabanana', 'cherrycherrycherrycherrycherry']

# Teste da função formatar_output
resultado_formatado = formatar_output(resultado_repetir)
print(resultado_formatado)
# Espera-se algo como:
# 1: appleappleapple
# 2: bananabanana
# 3: cherrycherrycherrycherrycherry
