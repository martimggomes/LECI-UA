"""
Write a Python program to find elements in a given set that are not in another set.

"""

sn1 = {1, 2, 3, 4, 5}
sn2 = {4, 5, 6, 7, 8}

print(sn1.difference(sn2))
print(sn1 - sn2)
print(sn2.difference(sn1))
print(sn2 - sn1)