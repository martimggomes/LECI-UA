"""
Write a Python program to find all the anagrams and group them together from a 
given list of strings. Use the Python data type.

"""

# Define a function 'group_anagrams' that takes a list of strings 'strs' as input.
def group_anagrams(strs):
    # Create an empty dictionary 'result' to store grouped anagrams.
    result = {}
    
    # Iterate over each string 's' in the input list 'strs'.
    for s in strs:
        # Sort the characters of the string 's' and join them to create a sorted string.
        sorted_string = ''.join(sorted(s))
        
        # Check if the sorted string exists as a key in 'result'.
        if sorted_string in result:
            # If it exists, append the original string 's' to the existing list of anagrams.
            result[sorted_string].append(s)
        else:
            # If it doesn't exist, create a new entry with the sorted string as the key and a list containing 's' as the value.
            result[sorted_string] = [s]
    
    # Convert the values of the 'result' dictionary (lists of anagrams) to a list and return it.
    return list(result.values())

# Define a list of strings 'strs' for testing.
strs = ['eat', 'cba', 'tae', 'abc', 'xyz']
print("Original list of strings:")
print(strs)

# Call the 'group_anagrams' function and print the result for the list of strings.
print("Find and group all anagrams in the said list:")
print(group_anagrams(strs))

# Repeat the process for a different set of strings.
strs = ['restful', 'forty five', 'evil', 'over fifty', 'vile', 'fluster']
print("\nOriginal list of strings:")
print(strs)

# Call the 'group_anagrams' function and print the result for the list of strings.
print("Find and group all anagrams in the said list:")
print(group_anagrams(strs)) 