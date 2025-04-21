"""
Write a Python program to convert a given list of tuples to a list of lists.

Original list of tuples: [(1, 2), (2, 3), (3, 4)]
Convert the said list of tuples to a list of lists: [[1, 2], [2, 3], [3, 4]]
Original list of tuples: [(1, 2), (2, 3, 5), (3, 4), (2, 3, 4, 2)]
Convert the said list of tuples to a list of lists: [[1, 2], [2, 3, 5], [3, 4], [2, 3, 4, 2]]

"""

def convert_list_list(lista, new_l):
    
    new_l = []
    for t in lista:
        lista = list(t)
        new_l.append(lista)
    return new_l
    
    
def main():
    
    new_l = []
    l1 = [(1, 2), (2, 3), (3, 4)]
    print(convert_list_list(l1, new_l))
    l2 = [(1, 2), (2, 3, 5), (3, 4), (2, 3, 4, 2)]
    print(convert_list_list(l2, new_l))

main()