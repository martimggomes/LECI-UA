def mediana(lst):
    lst = sorted(lst, reverse=True)
    if len(lst) % 2 != 0:
        mid = len(lst) // 2 
        return lst[mid]
    else:
        middle = len(lst) // 2 - 1
        return (lst[middle] + lst[middle + 1]) / 2
        
def main():
    lst1 = [33, 66, 223, 42, 65]
    lst2 = [1, 2, 3, 4, 5, 6]
    print(mediana(lst1))
    print(mediana(lst2))
   
if __name__ == '__main__': 
    main()