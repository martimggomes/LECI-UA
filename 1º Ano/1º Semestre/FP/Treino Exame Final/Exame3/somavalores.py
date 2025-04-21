"""
A função somaValores(s) recebe uma string s e retorna a soma de todos os números presentes na string. Os números podem ser representados de duas formas:

Números inteiros simples, por exemplo, "23".
Números decimais com um ponto, por exemplo, "12.5".
Além disso, a função deve ignorar qualquer outro caractere que não faça parte de um número válido. Se a string não contiver nenhum número válido, a função deve retornar 0.

Exemplos:

somaValores("23abc45") retorna '68'
somaValores("10.5xyz20.4") retorna '30.9'
somaValores("abc") retorna '0'


"""

def somaValores(s):
    soma = 0
    numero = ''
    
    for char in s:
        if char.isdigit() or (char == '.' and '.' not in numero):
            numero += char
        else:
            if numero:
                soma += float(numero)
                numero = ''
    
    # Adiciona o último número encontrado, se houver
    if numero:
        soma += float(numero)
    
    return soma
            
            
# Testes (não altere esta parte)
print(somaValores("23abc45"))     # Esperado: 68
print(somaValores("10.5xyz20.4")) # Esperado: 30.9
print(somaValores("abc"))         # Esperado: 0
print(somaValores("100"))         # Esperado: 100
print(somaValores("10.2.3"))      # Esperado: 13.2
