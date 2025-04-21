"""
Write a Python program to find all the unique words and count the frequency of 
occurrence from a given list of strings. Use Python set data type.

"""
def word_count(words):
    word_counts = {}
    
    for word in words:
        if word not in word_counts:
            word_counts[word] = 1
        else:
            word_counts[word] += 1
        
    return word_counts

# Create a list 'words' with words of various colors.
words = ['Red', 'Green', 'Red', 'Blue', 'Red', 'Red', 'Green']

# Call the 'word_count' function with the 'words' list and print the word counts.
print(word_count(words)) 