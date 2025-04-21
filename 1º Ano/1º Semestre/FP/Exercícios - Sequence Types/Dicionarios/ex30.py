"""
Write a Python program to filter a dictionary based on values.

Original Dictionary:
{'Cierra Vega': 175, 'Alden Cantrell': 180, 'Kierra Gentry': 165, 'Pierre Cox': 190}
Marks greater than 170:
{'Cierra Vega': 175, 'Alden Cantrell': 180, 'Pierre Cox': 190}

"""

d = {'Cierra Vega': 175, 'Alden Cantrell': 180, 'Kierra Gentry': 165, 'Pierre Cox': 190}
new_d = {}

print("Marks greater than 170:")

for key, value in d.items():
    if value >= 170:
        new_d[key] = value

print(new_d)
    