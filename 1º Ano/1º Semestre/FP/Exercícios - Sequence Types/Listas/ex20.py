"""
Write a Python program to compute the difference between two lists.
Sample data: ["red", "orange", "green", "blue", "white"], 
["black", "yellow", "green", "blue"]

Expected Output:
Color1-Color2: ['white', 'orange', 'red']
Color2-Color1: ['black', 'yellow']

"""

from collections import Counter

color1 = ["red", "orange", "green", "blue", "white"]
color2 = ["black", "yellow", "green", "blue"]

counter1 = Counter(color1)
counter2 = Counter(color2)

print("Color1 - Color2: ", list(counter1 - counter2))
print("Color2-Color1: ", list(counter2 - counter1))