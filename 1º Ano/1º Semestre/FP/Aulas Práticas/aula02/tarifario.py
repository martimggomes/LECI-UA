minutoChamada = 60
precoMinuto = 0.12
precoPorSegundo = 0.002
tempoChamada = int(input("Qual a duração da chamada em segundos: "))
tempoAlemMinuto = tempoChamada - minutoChamada

if tempoChamada <= minutoChamada:
    print("O preço da chamada foi de {}€".format(precoMinuto))
else:
    precoChamada = precoMinuto + ((tempoAlemMinuto) * precoPorSegundo)
    print("O preço da chamada foi de {}€".format(round(precoChamada, 3)))
    