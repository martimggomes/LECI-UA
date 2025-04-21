"""
Given two sets of numbers, write a Python program to find the missing numbers
in the second set as compared to the first and vice versa. Use the Python set.

"""
def missing_numbers(set_nums1, set_nums2):
    
     return set(set_nums1) - set(set_nums2), set(set_nums2) - set(set_nums1)


# Define two sets of numbers 'set_nums1' and 'set_nums2' for testing.
set_nums1 = {1, 2, 3, 4, 5, 6}
set_nums2 = {3, 4, 5, 6, 7, 8}

# Call the 'missing_numbers' function and store the result in 'result'.
result = missing_numbers(set_nums1, set_nums2)

# Print the original sets and the missing numbers in both directions.
print("Original sets:")
print(set_nums1)
print(set_nums2)
print("Missing numbers in the second set as compared to the first:")
print(result[0])
print("Missing numbers in the first set as compared to the second:")
print(result[1])

# Repeat the process for a different set of sets.
set_nums1 = {1, 2, 3, 4, 5}
set_nums2 = {6, 7, 8}
result = missing_numbers(set_nums1, set_nums2)

# Print the original sets and the missing numbers in both directions.
print("\nOriginal sets:")
print(set_nums1)
print(set_nums2)
print("Missing numbers in the second set as compared to the first:")
print(result[0])
print("Missing numbers in the first set as compared to the second:")
print(result[1]) 