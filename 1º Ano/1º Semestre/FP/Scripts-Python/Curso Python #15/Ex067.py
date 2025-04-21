
while True:
    n = int(input("Quer ver a tabuada de qual valor? "))
    if n < 0:
        print("\033[0;31mErro\033[m")
        break
    print("-" * 30)
    for i in range(1, 11):
        print(f"{i} x {n} = {n*i}")
    print("-" * 30)