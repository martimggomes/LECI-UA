"""
Write a Python program to create and display all combinations of letters, 
selecting each letter from a different key in a dictionary.

Sample data : {'1':['a','b'], '2':['c','d']}
Expected Output:
ac
ad
bc
bd

"""

d = {'1':['a','b'], '2':['c','d']}

# Generate and display all combinations of letters
for key1 in d['1']:
	for key2 in d['2']:
		print(key1 + key2)

