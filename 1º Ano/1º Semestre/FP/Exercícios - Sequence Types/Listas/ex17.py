"""
Write a Python program to convert a list of multiple integers into a single integer.
Sample list: [11, 33, 50]
Expected Output: 113350

"""
l = [11, 33, 50]

x = int("".join(map(str, l)))

print("Single Integer: ", x)