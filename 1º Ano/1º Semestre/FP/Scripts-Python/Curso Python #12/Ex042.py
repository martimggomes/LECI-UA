r1 = float(input("Indique o comprimento da reta 1: "))
r2 = float(input("Indique o comprimento da reta 2: "))
r3 = float(input("Indique o comprimento da reta 3: "))
if r1 < r2 + r3 and r2 < r1 + r3 and r3 < r1 + r2:
    print("Formam um trângulo.")
    if r1 == r2 == r3:
        print("Triângulo equilátero")
    elif r1 == r2 or r1 == r3 or r2 == r3:
        print("Triângulo Isósceles")
    else:
        print("Triângulo Escaleno")
else:
    print("Não formam um triângulo.")