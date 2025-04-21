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

def taxa(taxa=0):
    return f"{taxa}".replace(".", ",")