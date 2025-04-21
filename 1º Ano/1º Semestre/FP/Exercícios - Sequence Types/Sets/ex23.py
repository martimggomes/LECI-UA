"""
Write a Python program to find the third largest number
from a given list of numbers.Use the Python set data type.

"""

def third_largest(nums):
    
    nums = set(nums)
    
    if len(nums) < 3:
        return None

    nums = list(nums)
    sorted_nums = sorted(nums, reverse=True)
    
    return sorted_nums[2]

# Define a list of numbers 'nums' for testing.
nums = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print("Original list of numbers:")
print(nums)

# Call the 'third_largest' function and print the third largest number for the given list.
print("Third largest number of the said list of numbers:")
print(third_largest(nums))

# Repeat the process for different input lists.
nums = [1, 2, 3, 4, 5, 5, 6, 7, 7, 8, 8, 9, 10]
print("\nOriginal list of numbers:")
print(nums)
print("Third largest number of the said list of numbers:")
print(third_largest(nums))

nums = [1, 2, 3]
print("\nOriginal list of numbers:")
print(nums)
print("Third largest number of the said list of numbers:")
print(third_largest(nums))

nums = [1, 2, 2]
print("\nOriginal list of numbers:")
print(nums)
print("Third largest number of the said list of numbers:")
print(third_largest(nums))

nums = [1, 2]
print("\nOriginal list of numbers:")
print(nums)
print("Third largest number of the said list of numbers:")
print(third_largest(nums)) 