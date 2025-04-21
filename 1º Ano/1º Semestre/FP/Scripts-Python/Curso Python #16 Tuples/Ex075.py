num = (int(input("Digite um número: ")),
 int(input("Digite outro número: ")),
 int(input("Digite mais um número: ")),
 int(input("Digite um último número: ")))
print(f"Você digitou os números: {(num)}")
print(f"Você digitou o número 9, {num.count(9)} vez(es).")
if 3 in num:
    print(f"O número 3 foi digitado, primeiramente, na posição {num.index(3) + 1}")
else: 
    print("O número 3 não está em nenhuma posição.")
print("Os valores pares digitados foram ", end= " ")
for n in num:
    if n % 2 == 0:    
        print(n, end= " ")
        
        
        
        
        
        
def tupleList():
    lst =[]
    with open("Soccer_Football Clubs Ranking.csv", "r" ,enconding="utf8") as file:
        for line in file:
            lst.append((line.strip()))  #Add the line as a tuple, removing whitespace

    return lst
        