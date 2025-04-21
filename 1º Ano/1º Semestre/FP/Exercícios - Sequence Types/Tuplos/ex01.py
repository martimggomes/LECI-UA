"""
Write a Python program to add an item to a tuple.

"""

tuplex = (4, 6, 2, 8, 3, 1)

tuplex = tuplex + (9,)

print(tuplex)

tuplex = tuplex[:5] + (15, 20, 25) + tuplex[:5]

print(tuplex)

# ou

listx = list(tuplex)

listx.append(30)

tuplex = tuple(listx)

print(tuplex) 