"""
Write a Python program to check if two given sets have no elements in common.

"""

x = {1, 2, 3, 4}
y = {4, 5, 6, 7}
z = {8}

# Print a message to confirm that two given sets have no common elements.
print("\nConfirm two given sets have no element(s) in common:")

# Print a message to indicate comparing sets 'x' and 'y'.
print("\nCompare x and y:")

# Use the 'isdisjoint()' method to check if 'x' and 'y' have no common elements and print the result.
print(x.isdisjoint(y))

# Print a message to indicate comparing sets 'x' and 'z'.
print("\nCompare x and z:")

# Use the 'isdisjoint()' method to check if 'x' and 'z' have no common elements and print the result.
print(z.isdisjoint(x))

# Print a message to indicate comparing sets 'y' and 'z'.
print("\nCompare y and z:")

# Use the 'isdisjoint()' method to check if 'y' and 'z' have no common elements and print the result.
print(y.isdisjoint(z)) 