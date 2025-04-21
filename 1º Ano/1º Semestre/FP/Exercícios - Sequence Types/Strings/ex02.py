"""
Write a Python program to count the number of characters (character frequency) 
in a string.

Sample String : google.com'
Expected Result : {'g': 2, 'o': 3, 'l': 1, 'e': 1, '.': 1, 'c': 1, 'm': 1}

"""

String = "google.com"
dict = {}
count = 0

for i in String:
    if i not in dict:
        dict[i] = 1
    else:
        dict[i] += 1
        

print(dict)