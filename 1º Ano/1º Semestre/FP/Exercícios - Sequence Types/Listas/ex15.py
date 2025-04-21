"""
Write a Python program to create a list by concatenating a given list with a range 
from 1 to n.

Sample list : ['p', 'q']
n =5
Sample Output : ['p1', 'q1', 'p2', 'q2', 'p3', 'q3', 'p4', 'q4', 'p5', 'q5']

"""

my_list = ['p', 'q']

n = 4
new_list = []

for x in my_list:
    for y in range(1, n + 1):
        new_list.append('{}{}'.format(x, y))
        
print(new_list)

