"""
Write a Python program to check if each number is prime in a given list of numbers.
Return True if all numbers are prime otherwise False.

Sample Data:
([0, 3, 4, 7, 9]) -> False
([3, 5, 7, 13]) -> True
([1, 5, 3]) -> False

"""

def test(nums):
    
    return all(is_prime(i) for i in nums)

def is_prime(n):
    
    if n == 1:
        return False
    elif n == 2:
        return True
    else:
        for x in range(2, n):
            if n % x == 0:
                return False
        return True

# Define a list 'nums' containing a sequence of numbers
nums = [0, 3, 4, 7, 9]
# Print the original list of numbers
print("Original list of numbers:")
print(nums)
# Check if each number in 'nums' is prime and print the result
print("Check if each number is prime in the said list of numbers:")
print(test(nums))

# Reassign 'nums' with a different list of numbers
nums = [3, 5, 7, 13]
# Print the original list of numbers
print("\nOriginal list of numbers:")
print(nums)
# Check if each number in the new 'nums' list is prime and print the result
print("Check if each number is prime in the said list of numbers:")
print(test(nums))

# Reassign 'nums' with another list of numbers
nums = [1, 5, 3]
# Print the original list of numbers
print("\nOriginal list of numbers:")
print(nums)
# Check if each number in the new 'nums' list is prime and print the result
print("Check if each number is prime in the said list of numbers:")
print(test(nums)) 