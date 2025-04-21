palavras = ("aprender", "programar", "linguagem", "phyton", "curso", "gratis", "estudar", "praticar", "trabalhar", "mercado", "programador", "futuro")

for x in palavras:
    print(f"\nNa palavra {x.upper()} temos ", end = "")
    for letra in x:
        if letra in "aeiou":
            print(letra, end = " ")