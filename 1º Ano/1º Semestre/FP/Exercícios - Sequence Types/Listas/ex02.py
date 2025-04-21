"""

Write a Python program to count the number of strings from a given list
of strings. The string length is 2 or more and the first and last characters are
the same.

Sample List : ['abc', 'xyz', 'aba', '1221']
Expected Result : 2

"""

def match_words(words):
    
    counter = 0
    for word in words:
        if len(word) > 1 and word[0] == word[-1]:
            counter += 1
    
    return counter

print(match_words(['abc', 'xyz', 'aba', '1221']))