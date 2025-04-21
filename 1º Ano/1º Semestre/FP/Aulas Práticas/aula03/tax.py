def tax(r):
    if r <= 1000:
        return 0.1 * r
    elif 1000 < r <= 2000:
        return 0.2 * r - 100
    else:
        return 0.3 * r - 300
    
def main():
    
    print(tax(555))
    print(tax(1234))
    print(tax(2345))

main()