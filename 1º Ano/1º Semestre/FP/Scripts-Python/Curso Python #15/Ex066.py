soma = 0
count = 1
while True:
    num = int(input("Digite um número (999 para parar): "))
    if num == 999:
        break
    count += 1
    soma += num
print("A soma dos números digitados é {}".format(soma))  
print("A quantidade de números digitados é {}".format(count))  
