"""
Write a Python program to get the top three items in a shop.

Sample data: {'item1': 45.50, 'item2':35, 'item3': 41.30, 'item4':55, 'item5': 24}
Expected Output:
item4 55
item1 45.5
item3 41.3

"""

dict = {'item1': 45.50, 'item2':35, 'item3': 41.30, 'item4':55, 'item5': 24}

sorted_dict = sorted(dict.items(), key=lambda x: x[1], reverse=True)

for k, v in sorted_dict[:3]:
    print("{} {}".format(k, v))

