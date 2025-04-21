"""
Write a Python program to create a dictionary from a string.
Note: Track the count of the letters from the string.

Sample string : 'w3resource'
Expected output: {'w': 1, '3': 1, 'r': 2, 'e': 2, 's': 1, 'o': 1, 'u': 1, 'c': 1}

"""
String = 'w3resource'
dict = {}

# iterate over the characters in the string
for char in String:
	# update the count in the dictionary
	dict[char] = dict.get(char, 0) + 1

print(dict)
