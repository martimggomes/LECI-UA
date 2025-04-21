"""
Write a Python program to remove an empty tuple(s) from a list of tuples.

Sample data: [(), (), ('',), ('a', 'b'), ('a', 'b', 'c'), ('d')]
Expected output: [('',), ('a', 'b'), ('a', 'b', 'c'), 'd']

"""
l = [(), (), ('',), ('a', 'b'), ('a', 'b', 'c'), ('d')]
new_l = []

for t in l:
    if t != ():
        new_l.append(t)
        
print(new_l)