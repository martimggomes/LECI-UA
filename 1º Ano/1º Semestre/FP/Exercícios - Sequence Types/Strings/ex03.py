""" 
Write a Python program to get a string made of the first 2 and last 2 characters 
of a given string. If the string length is less than 2, return the empty string instead.

Sample String : 'w3resource'
Expected Result : 'w3ce'
Sample String : 'w3'
Expected Result : 'w3w3'
Sample String : ' w'
Expected Result : Empty String

"""


String = input("String: ")
string_resultante = ''

if len(String) <= 1:
    print(string_resultante)
else: 
    print(String[:2] + String[-2:])
        
print(string_resultante)