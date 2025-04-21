"""
A sequência de Fibonacci começa com os números 0 e 1.  Depois, cada elemento
consecutivo da sequência obtém-se pela soma dos dois elementos anteriores.
Complete a função genFibonacci(n) para _devolver_ uma lista com os n primeiros
números de Fibonacci.  Por exemplo, se n=6, deve devolver [0, 1, 1, 2, 3, 5].
A função só tem de funcionar para n>=2.

"""

def genFibonacci(n):
    
    assert n >= 2
    lst = []
    for i in range(n):
        if i == 0:
            lst.append(0)
        elif i == 1:
            lst.append(1)
        else:
            soma = lst[i - 2] + lst [i - 1]
            lst.append(soma)
    return lst

def main():
    
    print(genFibonacci(5))
    print(genFibonacci(10))
    print(genFibonacci(21))

main()