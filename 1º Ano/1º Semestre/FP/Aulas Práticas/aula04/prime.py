def isPrime(n):
    
    if n == 1 or n == 2 or n == 3 or n == 5:
        return True
    
    elif n % 2 == 0 or n % 3 == 0 or n % 5 == 0:
        return False
    
    else:
        return True
    
    
def main():
    
    for num in range(1, 101):
        print()
        print("O número {} é um número primo? {}".format(num, isPrime(num)))
    
main()