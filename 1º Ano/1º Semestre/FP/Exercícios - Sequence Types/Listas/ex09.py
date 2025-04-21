"""
Write a Python program to print a specified list after removing the 0th, 
4th and 5th elements.

Sample List : ['Red', 'Green', 'White', 'Black', 'Pink', 'Yellow']
Expected Output : ['Green', 'White', 'Black']

"""

color = ['Red', 'Green', 'White', 'Black', 'Pink', 'Yellow']
lista = []

for i, x in enumerate(color):
    if i not in (0, 4, 5):
        lista.append(color[i])
        
print(lista)