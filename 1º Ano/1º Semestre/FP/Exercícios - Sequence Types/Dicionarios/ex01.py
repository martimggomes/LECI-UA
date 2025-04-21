"""
Write a Python script to sort (ascending and descending) a dictionary by value.

"""

d = {1: 2, 3: 4, 4: 3, 2: 1, 0: 0}

sorted_d = sorted(d.items(), key=lambda x: x[1])

print(sorted_d)

sorted_d_r = sorted(d.items(), key=lambda x: x[1], reverse=True)

print(sorted_d_r)

