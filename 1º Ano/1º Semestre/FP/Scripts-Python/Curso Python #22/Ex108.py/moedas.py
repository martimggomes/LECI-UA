def aumentar(preço=0, taxa=0):
    res = preço + preço * (taxa/100)
    return res

def diminuir(preço=0, taxa=0):
    res = preço - preço * (taxa/100)
    return res 

def dobro(preço=0):
    res = preço * 2
    return res 

def metade(preço=0):
    res = preço / 2
    return res

def moeda(preço=0, moeda='€'):
    return f"{preço:.2f}{moeda}".replace(".", ",")

def taxa(taxa=0):
    return f"{taxa}".replace(".", ",")