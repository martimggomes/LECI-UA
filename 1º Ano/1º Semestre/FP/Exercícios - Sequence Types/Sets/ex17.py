"""
Write a Python program that finds all pairs of elements in a
list whose sum is equal to a given value.

"""

def find_pairs(nums, target_val):
    
    nums_set = set(nums)
    pairs = []
    
    for n in nums_set:
        complement = target_val - n
        if complement in nums_set:
            pairs.append([n, complement])
    return pairs

nums = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
print("Original list of numbers:")
print(nums)
target_val = 35
print("Target value:",target_val)
print("Find all pairs in the said list whose sum is equal to a target value:")
print(find_pairs(nums, target_val))
nums = [1, 2, 3, 4, 5]
print("\nOriginal list of numbers:")
print(nums)
target_val = 5
print("Target value:",target_val)
print("Find all pairs in the said list whose sum is equal to a target value:")
print(find_pairs(nums, target_val))