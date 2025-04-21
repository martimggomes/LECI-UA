"""
Write a Python program to check if a given value is present in a set or not.

"""

nums = {1, 3, 5, 7, 9, 11}

num = int(input("Número: "))

if num in nums:
    print("Existe")
else:
    print("Não existe")