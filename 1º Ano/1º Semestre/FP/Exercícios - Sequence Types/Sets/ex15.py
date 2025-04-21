"""
Write a Python program to remove the intersection of a second set with a first set.

"""

# Create sets 'sn1' and 'sn2' with different elements.
sn1 = {1, 2, 3, 4, 5}
sn2 = {4, 5, 6, 7, 8}

# Print a message to indicate the original sets.
print("Original sets:")
print(sn1)
print(sn2)

# Print a message to indicate the removal of the intersection of the 2nd set from the 1st set using 'remove()'.
print("\nRemove the intersection of a 2nd set from the 1st set using remove():")

# Iterate over the elements in the intersection of 'sn1' and 'sn2' and remove them from 'sn1' using the 'remove()' method.
for i in sn1 & sn2:
    sn1.remove(i)

# Print the modified 'sn1' and the original 'sn2'.
print("sn1: ", sn1)
print("sn2: ", sn2) 