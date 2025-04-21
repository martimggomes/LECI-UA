from urllib import request

try:
    site = request.urlopen("https://store.fcporto.pt/pt/")
except:
    print("A loja do melhor clube do mundo não está disponível neste momento :(")
else:
    print("Consegui acessar a loja do melhor clube do mundo :)")