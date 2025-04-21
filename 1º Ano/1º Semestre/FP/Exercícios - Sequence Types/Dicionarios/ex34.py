"""
Write a Python program to split a given dictionary of lists into lists of dictionaries.

Original dictionary of lists:
{'Science': [88, 89, 62, 95], 'Language': [77, 78, 84, 80]}
Split said dictionary of lists into list of dictionaries:
[{'Science': 88, 'Language': 77}, {'Science': 89, 'Language': 78}, 
{'Science': 62, 'Language': 84}, {'Science': 95, 'Language': 80}]

"""

# Define a function 'list_of_dicts' that splits a dictionary of lists into a list of dictionaries.
def list_of_dicts(marks):
    # Get the keys (subjects) from the 'marks' dictionary.
    keys = marks.keys()
    	
    # Use the 'zip' function to transpose the lists of marks into tuples.
    vals = zip(*marks.values())
    
    # Create a list of dictionaries by iterating over the transposed tuples.
    result = []
    for v in vals:
        dict_item = {}
        for i, k in enumerate(keys):
            dict_item[k] = v[i]
        result.append(dict_item)
    return result

# Create a dictionary 'marks' with subjects as keys and lists of marks as values.
marks = {'Science': [88, 89, 62, 95], 'Language': [77, 78, 84, 80]}

# Print a message indicating the start of the code section and the original dictionary of lists.
print("Original dictionary of lists:")
print(marks)

# Print a message indicating the intention to split the dictionary of lists into a list of dictionaries.
print("\nSplit said dictionary of lists into a list of dictionaries:")

# Call the 'list_of_dicts' function to split the dictionary of lists and print the resulting list of dictionaries.
print(list_of_dicts(marks)) 


