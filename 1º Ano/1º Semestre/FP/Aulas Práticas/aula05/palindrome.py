def ispalindrome(s):
    
    pal_s = s[::-1]
    return pal_s == s

def main():
    
    s = input("Digite uma palavra: ")
    print(ispalindrome(s))
    
main()