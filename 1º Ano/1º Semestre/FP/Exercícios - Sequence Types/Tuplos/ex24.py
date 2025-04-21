"""
Write a Python program to convert a tuple of string values to a tuple of integer values.

Original tuple values:
(('333', '33'), ('1416', '55'))
New tuple values:
((333, 33), (1416, 55))

"""

tuplex = (('333', '33'), ('1416', '55'))
listax = []

for t in tuplex:
    tuplexx = tuple((int(t[0]), int(t[1])))
    listax.append(tuplexx)
    tupley = tuple(listax)
print(tupley)
    
    