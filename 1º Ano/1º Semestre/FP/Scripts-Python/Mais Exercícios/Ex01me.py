def kilometerstoMiles(kilometer):
    return kilometer * 0.6214

def main():
    
    kilometers = float(input("Digite um número qualquer de quilómetros: "))
    
    print(f"{kilometers}km = {kilometerstoMiles(kilometers):.1f} miles")
    
main()