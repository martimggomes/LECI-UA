"""
Write a Python program to find the list of words that are 
longer than n from a given list of words.

"""

def long_words(n, str):

    lista = []
    txt = str.split(" ")
    for x in txt:
        if len(x) > n:
            lista.append(x)
    return lista

print(long_words(3, "The quick brown fox jumps over the lazy dog"))