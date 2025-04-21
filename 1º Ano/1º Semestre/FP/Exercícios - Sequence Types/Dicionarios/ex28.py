"""
Write a Python program to count the number of items
in a dictionary value that is a list.

"""

dict =  {'Alex': ['subj1', 'subj2', 'subj3'], 'David': ['subj1', 'subj2']}
count = 0

for value in dict.values():
    count += len(value)
        
print(count)