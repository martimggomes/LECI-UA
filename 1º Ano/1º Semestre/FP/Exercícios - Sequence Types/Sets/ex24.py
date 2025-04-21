"""
Write a Python program to remove all duplicates from a given list of strings and return
a list of unique strings. Use the Python set data type.

"""
def remove_duplicates(strs):
    
    strs = set(strs)
    
    return list(strs)


# Define a list of strings 'strs' for testing.
strs = ['foo', 'bar', 'abc', 'foo', 'qux', 'bar', 'baz']
print("Original list of strings:")
print(strs)
# Call the 'remove_duplicates' function and print the list of unique strings.
print("List of strings after removing duplicates:")
print(remove_duplicates(strs))

# Repeat the process for a different input list.
strs = ["Python", "Exercises", "Practice", "Solution", "Exercises"]
print("\nOriginal list of strings:")
print(strs)
# Call the 'remove_duplicates' function and print the list of unique strings.
print("List of strings after removing duplicates:") 
print(remove_duplicates(strs)) 