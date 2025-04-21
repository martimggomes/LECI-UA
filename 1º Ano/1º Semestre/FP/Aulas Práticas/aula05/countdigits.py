def countDigits(n):

    if n.isdigit():
        return len(n)
    else:
        c = 0
        for dig in n:
            if dig.isdigit():
                c += 1
        return c
    
def main():
    
    s = input("=> ")    
    print("Existem {} dígitos".format(countDigits(s)))

main()