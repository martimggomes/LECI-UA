"""
Write a Python program to count the number of elements in a list within 
a specified range.

"""

def count_range_in_list(li, min, max):
    
    ctr = 0
    
    for x in li:
        if min <= x <= max:
            ctr += 1
            
    return ctr

# Define a list 'list1' containing numeric elements
list1 = [10, 20, 30, 40, 40, 40, 70, 80, 99]

# Call the 'count_range_in_list' function with 'list1' and the range [40, 100], and print the result
print(count_range_in_list(list1, 40, 100))

# Define another list 'list2' containing character elements
list2 = ['a', 'b', 'c', 'd', 'e', 'f']

# Call the 'count_range_in_list' function with 'list2' and the range ['a', 'e'], and print the result
print(count_range_in_list(list2, 'a', 'e')) 