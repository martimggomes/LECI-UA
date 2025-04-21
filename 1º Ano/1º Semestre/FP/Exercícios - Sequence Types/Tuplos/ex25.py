"""
Write a Python program to convert a given tuple of positive integers into an integer.

Original tuple:
(1, 2, 3)
Convert the said tuple of positive integers into an integer:
123
Original tuple:
(10, 20, 40, 5, 70)
Convert the said tuple of positive integers into an integer:
102040570

"""

def tuple_to_int(nums):

    result = int("".join(map(str, nums)))
    return result

def main():
    
    tuplex = (1, 2, 3)
    tupley = (10, 20, 40, 5, 70)
    print(tuple_to_int(tuplex))
    print(tuple_to_int(tupley))
    
main()