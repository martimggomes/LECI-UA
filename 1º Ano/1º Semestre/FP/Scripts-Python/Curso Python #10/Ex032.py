from datetime import date
ano = int(input("Indique-me um ano (pode colocar 0 para saber o ano atual): "))
if ano == 0:
    ano = date.today().year   
if ano % 4 == 0 and ano % 400 == 0 or ano % 100 != 0:
    print("O ano {} é bissexto.".format(ano))
else:
    print("O ano não é bissexto.")