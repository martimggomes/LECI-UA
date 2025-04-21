"""
Write a Python program to sort a list alphabetically in a dictionary.

"""

# Create a dictionary 'num' with keys 'n1', 'n2', and 'n3', and associated lists of numbers as values.
num = {'n1': [2, 3, 1], 'n2': [5, 1, 2], 'n3': [3, 2, 4]}

# Use a dictionary comprehension to create a new dictionary 'sorted_dict'.
# Iterate through the key-value pairs in 'num' and sort the lists of numbers ('y') for each key ('x').
sorted_dict = {}

for x,y in num.items():
    sorted_dict[x] = sorted(y)

# Print the 'sorted_dict' dictionary, which contains the same keys with sorted lists of numbers as values.
print(sorted_dict)