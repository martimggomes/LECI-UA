"""
Write a Python program to find all the unique combinations of 3 numbers
from a given list of numbers, adding up to a target number.

"""

def find_combinations_of_three(nums, target_val):
    # Convert the 'nums' list into a set to remove duplicates and then back to a list.
    nums = list(set(nums))
    
    # Create an empty set 'result' to store unique combinations of three numbers.
    result = set()
    
    # Iterate through the indices of 'nums' to consider pairs of numbers.
    for i in range(len(nums)):
        for j in range(i+1, len(nums)):
            # Calculate the third number ('complement') needed to reach the 'target_val'.
            complement = target_val - nums[i] - nums[j]
            
            # Check if the 'complement' exists in the remaining part of the list 'nums'.
            if complement in nums[:i] + nums[j+1:]:
                # Add a sorted tuple of the three numbers to the 'result' set.
                result.add(tuple(sorted((nums[i], nums[j], complement))))
    
    # Convert the 'result' set into a list and return it.
    return list(result)

# Define a list of numbers 'nums' and a 'target_val' for testing.
nums = [1, 2, 3, 4, 5, 6, 7, 8, 9]
target_val = 12
print("Original list of numbers:")
print(nums)
print("Target value:", target_val)

# Call the 'find_combinations_of_three' function and print the result for the given list and target value.
print("Combine three numbers whose sum equals the target number:")
print(find_combinations_of_three(nums, target_val))

# Repeat the process for a different 'target_val'.
target_val = 17
print("\nOriginal list of numbers:")
print(nums)
print("Target value:", target_val)

# Call the 'find_combinations_of_three' function and print the result for the updated target value.
print("Combine three numbers whose sum equals the target number:")
print(find_combinations_of_three(nums, target_val)) 
