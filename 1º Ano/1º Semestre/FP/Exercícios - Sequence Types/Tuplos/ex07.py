"""
Write a Python program to remove an item from a tuple.

"""

tuplex = "w", 3, "r", "s", "o", "u", "r", "c", "e"

lista = list(tuplex)

lista.remove("c")

tuplee = tuple(lista)

print(tuplee)