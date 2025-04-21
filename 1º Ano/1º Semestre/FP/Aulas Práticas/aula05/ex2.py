def inputFloatList():
    lst = []
    while True:
        n = input("Número: ")
        if n != "":
            lst.append(int(n))
            print(lst)
        else:
            print()
            print("Lista criada pelo utilizador: {}".format(lst))
            return lst  # Retorna a lista criada

def countLower(lst, v):
    lst2 = []
    for i in lst:
        if i < v:
            lst2.append(i)
    
    print("=> Existe(m) {} valor(es) abaixo de {}".format(len(lst2), v))
    
def minmax(lst):
    lst.sort()
    print("=> O valor mínimo é o {}".format(lst[0]))
    print()
    print("=> O valor máximo é o {}".format(lst[-1]))

def vmedio(lst):
    s = 0
    for i in lst:
        s += i
    vm = s / len(lst)
    print("=> O valor médio é {}".format(round(vm, 3)))
    
    print()
    
    lst3 = []
    for p in lst:
        if p < vm:
            lst3.append(p)
    print("=> Existe(m) {} número(s) abaixo do valor médio".format(len(lst3)))
        


def main():
    lst = inputFloatList()  # Agora lst recebe a lista retornada
    print()
    v = int(input("Número para verificar valores abaixo: "))
    print()
    countLower(lst, v)
    print()
    minmax(lst)
    print()
    vmedio(lst)
    print()

main()
