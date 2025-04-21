
cont = ('zero', 'um', 'dois', 'três', 'quatro', 'cinco', 
     'seis', 'sete', 'oito', 'nove', 'dez', 'onze', 
     'doze', 'treza', 'catorze', 'quinze', 'dezasseis',
     'dezassete', 'dezoito', 'dezanove', 'vinte')
while True:
    num = int(input("Digite um número: "))
    if 0 <= num <= 20:
        break
    print("Tente novamente.", end =" ")
print(f"Você digitou o número {cont[num]}")
