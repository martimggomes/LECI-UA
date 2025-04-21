"""

Write a Python function that takes a list of words and return the longest 
word and the length of the longest one.

Sample Output:
Longest word: Exercises
Length of the longest word: 9

"""
# Define a function named find_longest_word that takes a list of words as the argument, 'words_list'.
def find_longest_word(words_list):
    # Create an empty list 'word_len' to store pairs of word lengths and the corresponding words.
    word_len = []

    # Iterate through each word 'n' in the 'words_list'.
    for n in words_list:
        # Append a tuple containing the length of the word and the word itself to 'word_len'.
        word_len.append((len(n), n))

    # Sort the list 'word_len' based on the word lengths (ascending order).
    word_len.sort()

    # Return the length and the word of the last item in the sorted list (which is the longest word).
    return word_len[-1][0], word_len[-1][1]

# Call the find_longest_word function with a list of words and store the result in 'result'.
result = find_longest_word(["PHP", "Exercises", "Backend"])

# Print the longest word and its length.
print("\nLongest word: ", result[1])
print("Length of the longest word: ", result[0])

