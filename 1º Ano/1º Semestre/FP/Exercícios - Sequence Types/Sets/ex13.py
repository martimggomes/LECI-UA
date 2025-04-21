"""
Write a Python program to check if a given set is a superset of itself and
a superset of another given set.

"""

# Create a set 'nums' with elements 10, 20, 30, 40, and 50.
nums = {10, 20, 30, 40, 50}

# Print a message to indicate the original set 'nums'.
print("Original set: ", nums)

# Print a message to check if 'nums' is a superset of itself.
print("If nums is superset of itself?")

# Use the 'issuperset()' method to check if 'nums' is a superset of itself and print the result.
print(nums.issuperset(nums))

# Create sets 'num1', 'num2', and 'num3' with different elements.
num1 = {1, 2, 3, 4, 5, 7}
num2 = {2, 4}
num3 = {2, 4}

# Print the contents of sets 'num1', 'num2', and 'num3'.
print("\nnum1 = ", num1)
print("num2 = ", num2)
print("num3 = ", num3)

# Print a message to check if 'num1' is a superset of 'num2'.
print("If num1 is superset of num2:")

# Use the '>' operator to check if 'num1' is a superset of 'num2' and print the result.
print(num1 > num2)

# Print a message to compare 'num2' and 'num3'.
print("Compare num2 and num3:")

# Print a message to check if 'num2' is a superset of 'num3'.
print("If num2 is superset of num3:")

# Use the '>' operator to check if 'num2' is a superset of 'num3' and print the result.
print(num2 > num3)

# Print a message to check if 'num3' is a superset of 'num2'.
print("If num3 is superset of num2:")

# Use the '>' operator to check if 'num3' is a superset of 'num2' and print the result.
print(num3 > num2) 