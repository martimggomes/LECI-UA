def getValues():
    count = 0
    values = []
    while True:
        numero = input("Número: (Pressione enter caso não queira digitar mais nenhum número!) ")
        if numero == "":
            break
        else:
            count += 1
            values.append(float(numero))
    return values

def soma(values) :
    
    soma = 0
    for value in values:
        soma += value
    return soma
    
def media(n):

    return soma(n) / len(n)


def main():
    
    valores = getValues()
    print("A média dos valores é de {}".format(media(valores)))
    
main()
    
    
    