"""
A função somaFracoes(s) recebe uma string s e retorna a soma de todas as frações presentes na string. As frações serão representadas no formato a/b, onde a e b são inteiros.
A função deve ignorar qualquer outro caractere que não faça parte de uma fração válida. Se a string não contiver nenhuma fração válida, a função deve retornar 0.

Exemplos:

somaFracoes("1/2abc3/4") retorna '1.25'
somaFracoes("5/6xyz2/3") retorna '1.5'
somaFracoes("abc") retorna '0's


"""


def somaFracoes(s):
    total_sum = 0
    numero = ''
    fractions = []
    
    for char in s:
        if char.isdigit() or char == '/':
            numero += char
        else:
            if '/' in numero:
                fractions.append(numero)
            numero = ''
    
    if '/' in numero:
        fractions.append(numero)
    
    for frac in fractions:
        a, b = [int(x) for x in frac.split('/')]
        total_sum += a / b
    
    return total_sum

# Testes (não altere esta parte)
print(somaFracoes("1/2abc3/4"))    # Esperado: 1.25
print(somaFracoes("5/6xyz2/3"))    # Esperado: 1.5
print(somaFracoes("abc"))          # Esperado: 0
print(somaFracoes("7/3"))          # Esperado: 2.3333...
print(somaFracoes("1/2x1/2y1/2"))  # Esperado: 1.5
