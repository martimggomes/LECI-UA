def isPrime(value):
    if value < 2:
        return False
    else:
        for count in range(2, value):
            if value % count == 0:
                return False

        return True
    
    
def main():
    
    n1 = int(input("Start Range: "))
    n2 = int(input("End Range: "))
    
    while n2 < n1:
        print("\033[0;31mErro. O segundo número tem de ser superior ao primeiro!\033[m")
        n2 = int(input("End Range: "))
    
    totalPrimes = 0
    
    for count in range(n1, n2 + 1):
        if isPrime(count):
            totalPrimes += 1
            print(f"{totalPrimes} .\t {count}")
            
    print(f"Entre o {n1} e o {n2} existem {totalPrimes} números primos!")
        

main()