"""
Write a Python program to add member(s) to a set

"""
# Create a new empty set 'color_set':
color_set = set()

# Print the empty set 'color_set':
print(color_set)

# Print a newline for separation:
print("\nAdd single element:")

# Add a single element "Red" to the 'color_set':
color_set.add("Red")

# Print the 'color_set' with the added element "Red":
print(color_set)

# Print a newline for separation:
print("\nAdd multiple items:")

# Add multiple elements "Blue" and "Green" to the 'color_set' using the 'update' method:
color_set.update(["Blue", "Green"])

# Print the 'color_set' with the added elements "Blue" and "Green":
print(color_set) 