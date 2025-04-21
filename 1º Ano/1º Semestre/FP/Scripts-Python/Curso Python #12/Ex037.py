n = int(input("Digite um número: "))
print('''Escolha uma das bases para conversão:
[1] Conveter para Binário 
[2] Coverter para Octal
[3] Converter para Hexadecimal''')
opção = int(input("Sua opção: "))
i = 0
for i in range(1, 2, 3):
    if opção == 1:
        print("{} convertido para binário é {}".format(n, bin(n)[2:]))
            
    elif opção == 2:
        print("{} convertido para octal é {}".format(n, oct(n)[2:]))
            
    elif opção == 3:
        print("{} convertido para hexadecimal é {}".format(n,hex(n)[2:]))
          
    else:
        print("ERROR")
          