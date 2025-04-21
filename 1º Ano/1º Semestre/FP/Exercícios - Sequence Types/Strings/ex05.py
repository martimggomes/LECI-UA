"""
Write a Python program to get a single string from two given strings,
separated by a space and swap the first two characters of each string.

Sample String : 'abc', 'xyz'
Expected Result : 'xyc abz'

"""

def chars_mix_up(a, b):
    
    str_a = b[:2] + a[2:]
    str_b = a[:2] + b[2:]
    
    return str_a + " " + str_b

def main():
    
    print(chars_mix_up('abc', 'xyz'))
    
main()