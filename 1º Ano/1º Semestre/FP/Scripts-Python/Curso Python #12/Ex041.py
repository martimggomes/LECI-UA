from datetime import date
ano = int(input('Digite seu ano de nascimento: '))
nasc = date.today().year - ano
if nasc <= 9:
    print("Mirim")
elif 9 < nasc <= 14:
    print("Infantil")
elif 14 < nasc <= 19:
    print("Junior")
elif 19 < nasc <= 25:
    print("Sénior")
else:
    print("Master")