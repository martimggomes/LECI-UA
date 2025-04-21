"""
Write a Python program to find the longest 
common prefix of all strings. Use the Python set.

"""
def longest_Common_Prefix(strs):
    # Check if the input list 'strs' is empty, and return an empty string if so.
    if not strs:
        return ""
    
    # Find the minimum length of strings in the list using a list comprehension.
    min_length = min([len(word) for word in strs])
    
    # Iterate from the first character to the 'min_length'.
    for i in range(min_length):
        # Create a set 'chars' containing the i-th character of each string in 'strs'.
        chars = set([word[i] for word in strs])
        
        # If the set 'chars' has more than one element, return the common prefix found so far (up to the i-th character).
        if len(chars) > 1:
            return strs[0][:i]
    
    # If no common prefix was found in the loop, return the common prefix as the first string up to the 'min_length'.
    return strs[0][:min_length] 


# Define a list of strings 'strs' for testing.
strs = ["pqrefgh", "pqrsfgh"]
print("Original list of strings:")
print(strs)

# Call the 'longest_Common_Prefix' function and print the result for the list of strings.
print("Longest common prefix of all said strings:")
print(longest_Common_Prefix(strs))

# Repeat the process for different sets of strings.
strs = ["w3r", "w3resource"]
print("\nOriginal list of strings:")
print(strs)
print("Longest common prefix of all said strings:")
print(longest_Common_Prefix(strs))

strs = ["Python", "PHP", "Perl"]
print("\nOriginal list of strings:")
print(strs)
print("Longest common prefix of all said strings:")
print(longest_Common_Prefix(strs))

strs = ["Python", "HTML", "PHP"]
print("\nOriginal list of strings:")
print(strs)
print("Longest common prefix of all said strings:")
print(longest_Common_Prefix(strs))