"""
Write a Python program to print all distinct values in a dictionary.
Sample Data : [{"V":"S001"}, {"V": "S002"}, {"VI": "S001"}, {"VI": "S005"}, 
{"VII":"S005"}, {"V":"S009"},{"VIII":"S007"}]

Expected Output : Unique Values: {'S005', 'S002', 'S007', 'S001', 'S009'}

"""
# Create a list 'L' containing dictionaries with key-value pairs.
L = [{"V": "S001"}, {"V": "S002"}, {"VI": "S001"}, {"VI": "S005"}, {"VII": "S005"}, {"V": "S009"}, {"VIII": "S007"}]

# Print a message indicating the start of the code section.
print("Original List: ", L)

# Create an empty set to store the unique values.
u_value = set()

# Iterate through each dictionary in the list 'L'.
for dic in L:
    # Iterate through each value in the current dictionary.
    for val in dic.values():
        # Add the value to the set 'u_value'.
        u_value.add(val)

# Print the unique values stored in the 'u_value' set.
print("Unique Values: ", u_value)