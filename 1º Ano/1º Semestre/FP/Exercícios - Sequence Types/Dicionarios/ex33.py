"""
Write a Python program to create a dictionary grouping a sequence of key-value 
pairs into a dictionary of lists.

Original list:
[('yellow', 1), ('blue', 2), ('yellow', 3), ('blue', 4), ('red', 1)]
Grouping a sequence of key-value pairs into a dictionary of lists:
{'yellow': [1, 3], 'blue': [2, 4], 'red': [1]}

"""

colors = [('yellow', 1), ('blue', 2), ('yellow', 3), ('blue', 4), ('red', 1)]

def grouping_dictionary(l):

    colors_updated = {}

    for k, v in l:
        colors_updated.setdefault(k, []).append(v)
    return colors_updated

def main():
    
    print(grouping_dictionary(colors))
    
main()

