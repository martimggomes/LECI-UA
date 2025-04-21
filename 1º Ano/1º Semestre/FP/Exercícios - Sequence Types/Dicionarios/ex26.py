"""
Write a Python program to get the key, value and item in a dictionary.

"""

dict_num = {1: 10, 2: 20, 3: 30, 4: 40, 5: 50, 6: 60}
c = 0

print("Key  Value  Count")

for key, value in dict_num.items():
    c += 1
    print("{:>2}{:>6}{:>7}".format(key, value, c))