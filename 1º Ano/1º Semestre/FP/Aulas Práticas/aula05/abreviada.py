def shorten(name):
    string = ""
    for char in name:
        if char.isupper():
            string += char
    return string
    
    
def main():
    
    print()
    print(shorten("Universidade de Aveiro"))
    print()
    print(shorten("United Nations Organization"))
    print()
    print(shorten("Futebol Clube de Arouca"))
    print()
    
main()    