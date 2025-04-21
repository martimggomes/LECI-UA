""" 

Write a Python program to find the first appearance of the substrings 
'not' and 'poor' in a given string. If 'not' follows 'poor', replace the whole 
'not'...'poor' substring with 'good'. Return the resulting string.

Sample String : 'The lyrics is not that poor!'
'The lyrics is poor!'
Expected Result : 'The lyrics is good!'
'The lyrics is poor!'

"""

def not_poor(str1):
    
    snot = str1.find("not")
    spoor = str1.find("poor")
    
    if spoor > snot and snot > 0 and spoor > 0:
        str1 = str1.replace(str1[snot:(spoor + 4)], 'good')  
        return str1
    else:
        return str1
    
print(not_poor('The lyrics is not that poor!'))  # Output: 'The lyrics is good!'
print(not_poor('The lyrics is poor!'))