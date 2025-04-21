"""
Complete numberOfDigits(n) para devolver o número de dígitos do número inteiro n. 
A solução tem de ser recursiva e não pode usar strings nem ciclos.
Note que o resto da divisão por dez dá o dígito menos significativo (1234%10 → 4) e 
o quociente tem os restantes dígitos (1234//10 → 123).

"""

def numberOfDigits(n):
    assert n > 0
    if n // 10 == 0:
        digits = 1
    else:
        digits = 1 + numberOfDigits(n // 10)
    return digits


print(numberOfDigits(2))
print(numberOfDigits(2242))
print(numberOfDigits(12))