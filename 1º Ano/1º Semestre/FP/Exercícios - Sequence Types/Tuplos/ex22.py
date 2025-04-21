"""
Write a Python program to calculate the product, multiplying all the numbers in
a given tuple.

Original Tuple:
(4, 3, 2, 2, -1, 18)
Product - multiplying all the numbers of the said tuple: -864
Original Tuple:
(2, 4, 8, 8, 3, 2, 9)
Product - multiplying all the numbers of the said tuple: 27648

"""

tuplex = (4, 3, 2, 2, -1, 18)
product = 1

for n in tuplex:
    product *= n
print(product)

