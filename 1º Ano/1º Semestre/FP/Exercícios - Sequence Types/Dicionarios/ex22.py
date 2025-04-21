"""
Write a Python program to convert a list into a nested dictionary of keys.

"""

# Create a list 'num_list' containing numbers.
num_list = [1, 2, 3, 4]

# Create an empty dictionary 'new_dict' and initialize 'current' to reference the same dictionary.
new_dict = current = {}

# Iterate through the numbers in 'num_list' using a for loop.
for number in num_list:
    # Create a nested empty dictionary under the 'current' dictionary with the current 'name' as the key.
    current[number] = {}
    
    # Update the 'current' reference to point to the newly created nested dictionary.
    current = current[number]

# Print the 'new_dict' dictionary, which is a nested structure with empty dictionaries.
print(new_dict)