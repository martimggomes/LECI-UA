"""
Write a Python program to find the two numbers whose product is maximum among all 
the pairs in a given list of numbers. Use the Python set.

"""
def max_product(nums):
    
    max = 0
    max_num1 = None
    max_num2 = None
       
    nums_set = set(nums)
    for n1 in nums_set:
        for n2 in nums_set:
            if n1 != n2 and n1 * n2 > max:
                max = n1 * n2
                max_num1 = n1
                max_num2 = n2
                
    return(max_num1, max_num2)
    
# Define a list of integers 'nums' for testing.
nums = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print("Original list of integers:")
print(nums)

# Call the 'max_product' function and print the result for the list of integers.
print("Maximum product of two numbers among all pairs in the said list:")
print(max_product(nums))

# Repeat the process for a different set of integers.
nums = [1, -2, -3, 4, 5, -6, 7, -8, 9]
print("\nOriginal list of integers:")
print(nums)
print("Maximum product of two numbers among all pairs in the said list:")
print(max_product(nums)) 