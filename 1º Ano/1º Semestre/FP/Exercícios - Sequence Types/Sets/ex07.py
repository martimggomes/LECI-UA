"""
Write a Python program to create set difference.

"""

setx = set(["green", "blue"])

sety = set(["blue", "yellow"])

setxy = setx - sety

r1 = setx.difference(sety)
r2 = sety.difference(setx)

print(setxy)
print(r1)
print(r2)