"""
Write a Python program to check if a set is a subset of another set.

"""

setx = set(["apple", "mango"])
sety = set(["mango", "orange"])
setz = set(["mango"])

print(setx.issubset(sety))
print(sety.issubset(setx))
print(setx.issubset(setz))
print(setz.issubset(setx))
print(setz.issubset(sety))
print(sety.issubset(setz))