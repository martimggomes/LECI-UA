# import uteis

#num = int(input("Digite um número: "))
#fat = uteis.fatorial(num)                                                 #A partir de um módulo 
#print(f"O fatorial de {num} é igual a {fat}")
#print(f"O dobro de {num} é igual a {uteis.dobro(num)}")


from uteispackage import numeros

num = int(input("Digite um número: "))
fat = numeros.fatorial(num)                                                  #A partir de um package
print(f"O fatorial de {num} é igual a {fat}")
print(f"O dobro de {num} é igual a {numeros.dobro(num)}")