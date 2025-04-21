"""
Write a Python program to find the highest 3 values of 
corresponding keys in a dictionary.

"""
my_dict = {'a': 500, 'b': 5874, 'c': 560, 'd': 400, 'e': 5874, 'f': 20}

sorted_dict = sorted(my_dict.items(), key = lambda x: x[1], reverse=True)

print(sorted_dict[:-3])