"""
Write a Python program to compute the sum of all the elements of each tuple stored 
inside a list of tuples.

Original list of tuples:
[(1, 2), (2, 3), (3, 4)]
Sum of all the elements of each tuple stored inside the said list of tuples:
[3, 5, 7]
Original list of tuples:
[(1, 2, 6), (2, 3, -6), (3, 4), (2, 2, 2, 2)]
Sum of all the elements of each tuple stored inside the said list of tuples:
[9, -1, 7, 8]

"""

def sum_numbers(l):
    
    new_l = []
    for t in l:
        s = 0
        for n in t:
            s += n
        new_l.append(s)

    return new_l

def main():
    
    l1 = [(1, 2), (2, 3), (3, 4)]
    l2 = [(1, 2, 6), (2, 3, -6), (3, 4), (2, 2, 2, 2)]
    print(sum_numbers(l1))
    print(sum_numbers(l2))
    
main()
    
    