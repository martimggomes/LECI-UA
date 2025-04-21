"""
Write a Python program to convert a tuple to a dictionary.

"""

tuplex = ((2, "w"), (3, "r"))

result_dict = dict((y, x) for y,x in tuplex)
result_dict = dict(tuplex)

print(result_dict)