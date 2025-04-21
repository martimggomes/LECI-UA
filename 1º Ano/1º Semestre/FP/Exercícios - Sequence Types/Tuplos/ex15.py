"""
Write a Python program to convert a list of tuples into a dictionary.

"""

l = [("x", 1), ("x", 2), ("x", 3), ("y", 1), ("y", 2), ("z", 1)]

dicta = {}
dictb = {}

for a,b in l:
    
    dicta.setdefault(a, []).append(b)
    dictb.setdefault(a, b)
    
print(dicta)
print(dictb)

"""

DIFFERENCE BETWEEN THIS: dict.setdefault(a, []).append(b)
AND THIS: dict.setdefault(a, b)


"""