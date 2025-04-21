def isPrime(value):
    if value < 2:
        return False
    else:
        for count in range(2, value):
            if value % 2 == 0:
                return False

        return True
    
    
def main():
    for number in range(11):
        print(number, isPrime(number))
        
main()