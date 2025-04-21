""" 
Write a Python program to get the largest number from a list.

"""

def largest(list):
    
    max = list[0]
    for a in list:
        if a > max:
            max = a
            
    return max

print(largest([1, 2, -8, 0]))