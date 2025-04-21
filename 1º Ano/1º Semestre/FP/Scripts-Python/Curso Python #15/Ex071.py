total = 0
print("=" * 30)
print("BANCO CEV".center(30))
print("=" * 30)

v = int(input("Que valor vocè deseja sacar? "))
total = v
nota = 50
totnot = 0
while True:
    if total >= nota:
        total -= nota
        totnot += 1
    else:
        print(f"Total de {totnot} nota(s) de {nota}€")
        if nota == 50:
            nota = 20
        elif nota == 20:
            nota = 10
        elif nota == 10:
            nota = 1
        totnot = 0
        if total == 0:
            break
    
print("=" * 30)
print("Volte sempre ao banco CEV! Tenha um bom dia!")
