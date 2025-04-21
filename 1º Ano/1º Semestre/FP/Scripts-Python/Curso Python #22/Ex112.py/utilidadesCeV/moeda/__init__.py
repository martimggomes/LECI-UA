def aumentar(preço=0, taxa=0, format=False):
    res = preço + preço * (taxa/100)
    return res if format == False else moeda(res)

def diminuir(preço=0, taxa=0, format=False):
    res = preço - preço * (taxa/100)
    return res if format == False else moeda(res)

def dobro(preço=0, format=False):
    res = preço * 2
    return res if not format else moeda(res)

def metade(preço=0, format=False):
    res = preço / 2
    return res if format == False else moeda(res)

def moeda(preço=0, moeda='€'):
    return f"{preço:.2f}{moeda}".replace(".", ",")


def resumo(preço=0, taxaa=10, taxar=5):
    print("-" * 30)
    print("Resumo do Valor".center(30))
    print("-" * 30)
    print(f"Preço analisado: \t{moeda(preço)}")
    print(f"Dobro do preço: \t{dobro(preço, True)}")
    print(f"Metade do preço: \t{metade(preço, True)}")
    print(f"Com {taxaa}% de aumento: \t{aumentar(preço, taxaa, True)}")
    print(f"Com {taxar}% de redução: \t{diminuir(preço, taxar, True)}")
    print("-" * 30)